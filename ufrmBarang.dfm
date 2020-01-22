object frmBarang: TfrmBarang
  Left = 0
  Top = 0
  Caption = 'frmBarang'
  ClientHeight = 201
  ClientWidth = 447
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
    Top = 32
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 32
    Top = 72
    Width = 24
    Height = 13
    Caption = 'Kode'
  end
  object Label3: TLabel
    Left = 32
    Top = 112
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label4: TLabel
    Left = 32
    Top = 152
    Width = 29
    Height = 13
    Caption = 'Harga'
  end
  object edID: TEdit
    Left = 80
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edKode: TEdit
    Left = 80
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 80
    Top = 109
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edHarga: TEdit
    Left = 80
    Top = 149
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 304
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 98
    Width = 75
    Height = 25
    Caption = 'Show'
    TabOrder = 5
    OnClick = Button2Click
  end
end
