object fmMain: TfmMain
  Left = 238
  Top = 109
  Width = 386
  Height = 248
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Datenlogger'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    378
    221)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 75
    Width = 366
    Height = 140
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Ausgabe'
    TabOrder = 1
    DesignSize = (
      366
      140)
    object lbRecorded: TLabel
      Left = 110
      Top = 75
      Width = 55
      Height = 13
      Caption = 'lbRecorded'
    end
    object edPath: TEdit
      Left = 10
      Top = 20
      Width = 321
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object edFileName: TEdit
      Left = 10
      Top = 45
      Width = 321
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object btnBrowsePath: TButton
      Left = 335
      Top = 20
      Width = 23
      Height = 21
      Anchors = [akTop, akRight]
      Caption = '...'
      TabOrder = 1
      OnClick = btnBrowsePathClick
    end
    object btnRecStart: TButton
      Left = 10
      Top = 70
      Width = 96
      Height = 25
      Caption = 'Aufnahme Start'
      TabOrder = 3
      OnClick = btnRecStartClick
    end
    object btnRecEnd: TButton
      Left = 10
      Top = 100
      Width = 96
      Height = 25
      Caption = 'Aufnahme Ende'
      TabOrder = 4
      OnClick = btnRecEndClick
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 366
    Height = 69
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 0
    object ComLed1: TComLed
      Left = 152
      Top = 26
      Width = 25
      Height = 25
      Hint = 'Verbindung'
      ComPort = ComPort
      LedSignal = lsConn
      Kind = lkRedLight
    end
    object ComLed2: TComLed
      Left = 177
      Top = 26
      Width = 25
      Height = 25
      Hint = 'Empfang'
      ComPort = ComPort
      LedSignal = lsRx
      Kind = lkGreenLight
    end
    object Label1: TLabel
      Left = 155
      Top = 48
      Width = 19
      Height = 13
      Caption = 'Con'
    end
    object Label2: TLabel
      Left = 182
      Top = 48
      Width = 15
      Height = 13
      Caption = 'RX'
    end
    object sbRefreshPorts: TSpeedButton
      Left = 125
      Top = 1
      Width = 22
      Height = 21
      Hint = 'Liste neu laden'
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000010000585858006262
        62006D6D6D0079797900DC00FF00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000040404040404
        0404040404040404040404040404040404040404040404040404040404040404
        0404040000000003040404040404020001040400000003040404040404020002
        0404040000000204040404040400020404040400040200040404040403000404
        0404040404040003040404040000040404040404040400000404040400000404
        0404040404040000040404040300040403040404040400030404040404000203
        0004040404020004040404040402000000040404020002040404040404030000
        0004040100020404040404040300000000040404040404040404040404040404
        0404040404040404040404040404040404040404040404040404}
      OnClick = sbRefreshPortsClick
    end
    object ccbPort: TComComboBox
      Left = 2
      Top = 1
      Width = 123
      Height = 21
      Hint = 'Com-Port'
      ComPort = ComPort
      ComProperty = cpPort
      AutoApply = True
      Text = 'COM16'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
    end
    object ccbDataBits: TComComboBox
      Left = 227
      Top = 1
      Width = 36
      Height = 21
      Hint = 'Datenbits'
      ComPort = ComPort
      ComProperty = cpDataBits
      AutoApply = True
      Text = '8'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 2
    end
    object ccbParity: TComComboBox
      Left = 267
      Top = 1
      Width = 56
      Height = 21
      Hint = 'Parit'#228'tsbits'
      ComPort = ComPort
      ComProperty = cpParity
      AutoApply = True
      Text = 'None'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
    end
    object ccbStopBits: TComComboBox
      Left = 327
      Top = 1
      Width = 36
      Height = 21
      Hint = 'Stoppbits'
      ComPort = ComPort
      ComProperty = cpStopBits
      AutoApply = True
      Text = '1'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
    end
    object ccbBaud: TComComboBox
      Left = 152
      Top = 1
      Width = 71
      Height = 21
      Hint = 'Baudrate'
      ComPort = ComPort
      ComProperty = cpBaudRate
      AutoApply = True
      Text = '9600'
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 7
      TabOrder = 1
    end
    object btnConn: TButton
      Left = 2
      Top = 31
      Width = 70
      Height = 25
      Caption = 'Verbinden'
      TabOrder = 5
      OnClick = btnConnClick
    end
    object btnDisc: TButton
      Left = 77
      Top = 31
      Width = 70
      Height = 25
      Caption = 'Trennen'
      TabOrder = 6
      OnClick = btnDiscClick
    end
  end
  object ComPort: TComPort
    BaudRate = br9600
    Port = 'COM16'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    Buffer.InputSize = 4096
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnAfterOpen = ComPortAfterOpen
    OnAfterClose = ComPortAfterClose
    OnBeforeClose = ComPortBeforeClose
    OnRxChar = ComPortRxChar
    Left = 215
    Top = 40
  end
end
