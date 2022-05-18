object FrmConnection: TFrmConnection
  Left = 0
  Top = 0
  Width = 372
  Height = 296
  BorderStyle = bsSingle
  Caption = 'Config'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmAuto
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CbTns: TComboBox
    Left = 128
    Top = 42
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'CbTns'
    OnSelect = CbTnsSelect
  end
  object Button1: TButton
    Left = 24
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Capture'
    TabOrder = 1
    OnClick = Button1Click
  end
  object EdtOraUser: TLabeledEdit
    Left = 88
    Top = 112
    Width = 121
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'Usu'#225'rio'
    TabOrder = 2
  end
  object EdtOraDatabase: TLabeledEdit
    Left = 88
    Top = 190
    Width = 121
    Height = 21
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Database'
    TabOrder = 3
  end
  object EdtOraPassword: TLabeledEdit
    Left = 88
    Top = 155
    Width = 121
    Height = 21
    EditLabel.Width = 30
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha'
    TabOrder = 4
  end
  object Conetar: TButton
    Left = 248
    Top = 110
    Width = 91
    Height = 101
    Caption = 'Conetar'
    TabOrder = 5
    OnClick = ConetarClick
  end
end
