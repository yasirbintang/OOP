object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'frmSetKoneksi'
  ClientHeight = 168
  ClientWidth = 435
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 32
    Top = 67
    Width = 46
    Height = 13
    Caption = 'Database'
  end
  object Label3: TLabel
    Left = 32
    Top = 142
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label6: TLabel
    Left = 32
    Top = 107
    Width = 48
    Height = 13
    Caption = 'Username'
  end
  object edServer: TEdit
    Left = 112
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edDB: TEdit
    Left = 112
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edPass: TEdit
    Left = 112
    Top = 139
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 288
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 3
  end
  object edUser: TEdit
    Left = 112
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
