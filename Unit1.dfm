object frmBarang: TfrmBarang
  Left = 0
  Top = 0
  Caption = 'Barang'
  ClientHeight = 309
  ClientWidth = 412
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
    Left = 8
    Top = 19
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 8
    Top = 59
    Width = 27
    Height = 13
    Caption = 'KODE'
  end
  object Label3: TLabel
    Left = 8
    Top = 99
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object Label4: TLabel
    Left = 8
    Top = 139
    Width = 35
    Height = 13
    Caption = 'HARGA'
  end
  object edID: TEdit
    Left = 64
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edKode: TEdit
    Left = 64
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 64
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edHarga: TEdit
    Left = 64
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 240
    Top = 59
    Width = 75
    Height = 25
    Caption = 'LOAD'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 99
    Width = 75
    Height = 25
    Caption = 'LIHAT'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Table1: TTable
    Left = 352
    Top = 24
  end
end
