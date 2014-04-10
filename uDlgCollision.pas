unit uDlgCollision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TdlgFileCollision = class(TForm)
    btnOverwrite: TButton;
    btnRename: TButton;
    btnAbort: TButton;
    lbMessage: TLabel;
    Image1: TImage;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    class function Execute(var FileName: string): boolean;
  end;

var
  dlgFileCollision: TdlgFileCollision;

implementation

uses
  Consts;

{$R *.dfm}

{ TdlgFileCollision }

function FindFreeName(const fn: string): String;
var
  p,n,e: String;
  i: integer;
begin
  p:= ExtractFilePath(fn);
  n:= ChangeFileExt(ExtractFileName(fn),'');
  e:= ExtractFileExt(fn);
  Result:= fn;
  i:= 1;
  while FileExists(Result) do begin
    Result:= IncludeTrailingPathDelimiter(p) + n + '('+IntToStr(i)+')' + e;
    inc(i);
  end;
end;

class function TdlgFileCollision.Execute(var FileName: string): boolean;
var
  alterName: string;
begin
  Result:= false;
  with TdlgFileCollision.Create(Application) do try
    Caption:= SMsgDlgConfirm;
    Image1.Picture.Icon.Handle:= LoadIcon(0, IDI_QUESTION);
    alterName:= FindFreeName(FileName);
    lbMessage.Caption:= format(lbMessage.Caption, [FileName]);
    btnRename.Hint:= alterName;
    case ShowModal of
      mrYes: begin // overwrite
        Result:= true;
      end;
      mrOk: begin // rename
        FileName:= alterName;
        Result:= true;
      end;
      mrCancel: begin //cancel
        Result:= false;
      end;
    end;
  finally
    Release;
  end;
end;

end.
