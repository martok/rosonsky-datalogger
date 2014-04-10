program DataLogger;

uses
  Forms,
  uMain in 'uMain.pas' {fmMain},
  uDlgCollision in 'uDlgCollision.pas' {dlgFileCollision};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
