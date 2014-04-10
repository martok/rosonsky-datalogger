object dlgFileCollision: TdlgFileCollision
  Left = 432
  Top = 213
  BorderStyle = bsDialog
  ClientHeight = 105
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  DesignSize = (
    434
    105)
  PixelsPerInch = 96
  TextHeight = 13
  object lbMessage: TLabel
    Left = 60
    Top = 5
    Width = 369
    Height = 65
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 
      'Ausgabedatei "%s" existiert bereits.'#13#10#13#10'Wie soll fortgefahren we' +
      'rden?'
    WordWrap = True
  end
  object Image1: TImage
    Left = 5
    Top = 5
    Width = 48
    Height = 48
    Center = True
  end
  object btnOverwrite: TButton
    Left = 67
    Top = 77
    Width = 88
    Height = 25
    Anchors = [akBottom]
    Caption = #220'berschreiben'
    ModalResult = 6
    TabOrder = 0
  end
  object btnRename: TButton
    Left = 173
    Top = 77
    Width = 88
    Height = 25
    Anchors = [akBottom]
    Caption = 'Umbenennen'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnAbort: TButton
    Left = 280
    Top = 77
    Width = 88
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = 'Abbrechen'
    ModalResult = 2
    TabOrder = 2
  end
end
