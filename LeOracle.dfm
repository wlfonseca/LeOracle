object MainForm: TMainForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsSingle
  Caption = 'LeOracle'
  ClientHeight = 623
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = 'VMSUPERUS'
    Port = 1521
    Database = 'BASE_ANIBALTEC'
    User = 'superus'
    Password = ''
    Protocol = 'oracle'
    LibraryLocation = 'C:\Users\Tom\Downloads\client_oracle11\client_oracle11\oci.dll'
    Left = 352
    Top = 176
  end
  object MainMenu1: TMainMenu
    Left = 664
    Top = 192
    object Configurar1: TMenuItem
      Caption = 'Configurar'
      OnClick = Configurar1Click
    end
  end
end
