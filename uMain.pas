unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CPortCtl, CPort, StdCtrls, iniFiles, fldbrows, ExtCtrls, Buttons;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    edPath: TEdit;
    edFileName: TEdit;
    btnBrowsePath: TButton;
    btnRecStart: TButton;
    btnRecEnd: TButton;
    lbRecorded: TLabel;
    Panel1: TPanel;
    ComLed1: TComLed;
    ComLed2: TComLed;
    Label1: TLabel;
    Label2: TLabel;
    ccbPort: TComComboBox;
    ccbDataBits: TComComboBox;
    ccbParity: TComComboBox;
    ccbStopBits: TComComboBox;
    ccbBaud: TComComboBox;
    btnConn: TButton;
    btnDisc: TButton;
    ComPort: TComPort;
    sbRefreshPorts: TSpeedButton;
    procedure btnConnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBrowsePathClick(Sender: TObject);
    procedure btnRecStartClick(Sender: TObject);
    procedure btnRecEndClick(Sender: TObject);
    procedure btnDiscClick(Sender: TObject);
    procedure ComPortBeforeClose(Sender: TObject);
    procedure ComPortRxChar(Sender: TObject; Count: Integer);
    procedure sbRefreshPortsClick(Sender: TObject);
  private
    { Private-Deklarationen }
    fRecorder: TFileStream;
    fRecorded: Integer;
    fInputBuffer: AnsiString;
    function GetConfigFile: string;
    procedure DecodeOneValue(var Buf: AnsiString);
  public
    { Public-Deklarationen }
  end;

var
  fmMain: TfmMain;

implementation

uses
  uDlgCollision;

{$R *.dfm}

function IsoDateTimeStr(dt: TDateTime): string;
begin
  Result:= FormatDateTime('yyyy-mm-dd"T"HH:nn:ss', dt);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini: TIniFile;
begin
  ComPortAfterClose(self);
  ComPort.LoadSettings(stIniFile, GetConfigFile);
  ini:= TIniFile.Create(GetConfigFile);
  try
    edPath.Text:= ini.ReadString('Logging', 'OutputPath', ExtractFilePath(ParamStr(0)));
    edFileName.Text:= ini.ReadString('Logging', 'OutputFile', FormatDateTime('yyyy-mm-dd-00', Now));
  finally
    FreeAndNil(ini);
  end;
  fRecorder:= nil;
  fRecorded:= 0;
  lbRecorded.Caption:= '';
end;

procedure TfmMain.FormDestroy(Sender: TObject);
var
  ini: TIniFile;
begin
  if ComPort.Connected then
    btnDisc.Click;
  ComPort.StoreSettings(stIniFile, GetConfigFile);
  ini:= TIniFile.Create(GetConfigFile);
  try
    ini.WriteString('Logging', 'OutputPath', edPath.Text);
    ini.WriteString('Logging', 'OutputFile', edFileName.Text);
  finally
    FreeAndNil(ini);
  end;
end;

procedure TfmMain.btnConnClick(Sender: TObject);
begin
  ComPort.Port:= ccbPort.Text;
  ccbDataBits.ApplySettings;
  ccbParity.ApplySettings;
  ccbStopBits.ApplySettings;
  ccbBaud.ApplySettings;
  ComPort.Open;
end;

procedure TfmMain.btnDiscClick(Sender: TObject);
begin
  ComPort.Close;
end;

procedure TfmMain.ComPortAfterClose(Sender: TObject);
begin
  btnConn.Enabled:= true;
  btnDisc.Enabled:= false;
  btnRecStart.Enabled:= false;
  btnRecEnd.Enabled:= false;
  ccbPort.Enabled:= true;
  ccbDataBits.Enabled:= true;
  ccbParity.Enabled:= true;
  ccbStopBits.Enabled:= true;
  ccbBaud.Enabled:= true;
end;

procedure TfmMain.ComPortAfterOpen(Sender: TObject);
begin
  btnConn.Enabled:= false;
  btnDisc.Enabled:= true;
  btnRecStart.Enabled:= true;
  btnRecEnd.Enabled:= false;
  ccbPort.Enabled:= false;
  ccbDataBits.Enabled:= false;
  ccbParity.Enabled:= false;
  ccbStopBits.Enabled:= false;
  ccbBaud.Enabled:= false;
end;

procedure TfmMain.ComPortBeforeClose(Sender: TObject);
begin
  if Assigned(fRecorder) then
    btnRecEnd.Click;
end;

function TfmMain.GetConfigFile: string;
begin
  Result:= ChangeFileExt(ParamStr(0), '.ini');
end;

procedure TfmMain.btnBrowsePathClick(Sender: TObject);
var
  fb: TFolderBrowser;
begin
  fb:= TFolderBrowser.Create(Handle, 'Ausgabeverzeichnis auswählen', edPath.Text);
  try
    if fb.Execute then
      edPath.Text:= IncludeTrailingPathDelimiter(fb.SelectedItem);
  finally
    FreeAndNil(fb);
  end;
end;

procedure TfmMain.btnRecStartClick(Sender: TObject);
var
  fn, h: string;
begin
  if (edFileName.Text = '') or (edPath.Text = '') then begin
    MessageDlg('Dateiname und Pfad darf nicht leer sein!', mtError, [mbOK], 0);
    exit;
  end;

  fn:= IncludeTrailingPathDelimiter(edPath.Text) + edFileName.Text + '.csv';
  if FileExists(fn) then begin
    if not TdlgFileCollision.Execute(fn) then
      exit;
  end;
  ForceDirectories(ExtractFilePath(fn));
  fRecorder:= TFileStream.Create(fn, fmCreate);
  h:= Format('%s;%s' + sLineBreak, [ChangeFileExt(ExtractFileName(fn), ''), IsoDateTimeStr(Now)]);
  fRecorder.Write(h[1], Length(h));
  fInputBuffer:= '';
  btnRecStart.Enabled:= false;
  btnRecEnd.Enabled:= true;
  fRecorded:= 0;
  ComPort.SetRTS(true);
  lbRecorded.Caption:= 'Bereit...';
end;

procedure TfmMain.btnRecEndClick(Sender: TObject);
begin
  FreeAndNil(fRecorder);
  ComPort.SetRTS(false);
  btnRecStart.Enabled:= true;
  btnRecEnd.Enabled:= false;
  lbRecorded.Caption:= Format('%d Messwerte gelesen', [fRecorded]);
end;

procedure TfmMain.DecodeOneValue(var Buf: AnsiString);
var
  w: Word;
  l: string;
begin
  if Length(Buf) < 2 then
    exit;
  // Extract 2 Bytes from Buffer
  w:= PWord(@Buf[1])^;
  Delete(Buf, 1, 2);
  // Swap endianness from BE to LE
  w:= ((w shr 8) and $FF) or ((w shl 8) and $FF00);
  // Write to file
  l:= Format('%d' + sLineBreak, [w]);
  fRecorder.Write(l[1], Length(l));
  inc(fRecorded);
  lbRecorded.Caption:= Format('%d Messwerte gelesen...', [fRecorded]);
end;

procedure TfmMain.ComPortRxChar(Sender: TObject; Count: Integer);
var
  n: AnsiString;
begin
  if Assigned(fRecorder) then begin
    SetLength(n, Count);
    ComPort.Read(N[1], Count);
    fInputBuffer:= fInputBuffer + N;
    while Length(fInputBuffer) >= 2 do begin
      DecodeOneValue(fInputBuffer);
    end;
    Application.ProcessMessages;
  end;
end;

procedure TfmMain.sbRefreshPortsClick(Sender: TObject);
begin
  //reset+set = reload items
  ccbPort.ComProperty:= cpNone;
  ccbPort.ComProperty:= cpPort;
end;

end.

