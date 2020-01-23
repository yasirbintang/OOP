object frmBarang: TfrmBarang
  Left = 0
  Top = 0
  Caption = 'Barang Baru'
  ClientHeight = 335
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 24
    Top = 72
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label3: TLabel
    Left = 24
    Top = 112
    Width = 24
    Height = 13
    Caption = 'Kode'
  end
  object Label4: TLabel
    Left = 24
    Top = 152
    Width = 29
    Height = 13
    Caption = 'Harga'
  end
  object Label1: TLabel
    Left = 416
    Top = 112
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object edKode: TEdit
    Left = 80
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edNama: TEdit
    Left = 80
    Top = 109
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edHarga: TEdit
    Left = 80
    Top = 149
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 398
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Tes Koneksi'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 398
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 398
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Lihat Barang'
    TabOrder = 6
    OnClick = Button4Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 192
    Width = 473
    Height = 135
    DataSource = DSBarang
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btsimpan: TButton
    Left = 231
    Top = 147
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 8
    OnClick = btsimpanClick
  end
  object con2: TADConnection
    Left = 352
    Top = 64
  end
  object con1: TADConnection
    Left = 352
    Top = 16
  end
  object ADConnection1: TADConnection
    Left = 288
    Top = 16
  end
  object DSBarang: TDataSource
    Left = 288
    Top = 72
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 352
    Top = 112
  end
  object ADConnection2: TADConnection
    Left = 224
    Top = 72
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 16
  end
end
