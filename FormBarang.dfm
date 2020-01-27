object frmBarang: TfrmBarang
  Left = 0
  Top = 0
  Caption = 'Barang Baru'
  ClientHeight = 335
  ClientWidth = 484
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
  object Label1: TLabel
    Left = 271
    Top = 159
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label5: TLabel
    Left = 271
    Top = 132
    Width = 68
    Height = 13
    Caption = 'Status Barang'
  end
  object btnconnect: TButton
    Left = 401
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Tes Koneksi'
    TabOrder = 1
    OnClick = btnconnectClick
  end
  object btnhapus: TButton
    Left = 271
    Top = 93
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 4
    OnClick = btnhapusClick
  end
  object btnbaru: TButton
    Left = 271
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 3
    OnClick = btnbaruClick
  end
  object btnlihat: TButton
    Left = 401
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Lihat Barang'
    TabOrder = 2
    OnClick = btnlihatClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 192
    Width = 473
    Height = 135
    DataSource = DSBarang
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object btsimpan: TButton
    Left = 271
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 0
    OnClick = btsimpanClick
  end
  object pnlpropety: TPanel
    Left = -1
    Top = 2
    Width = 266
    Height = 184
    TabOrder = 6
    object Label2: TLabel
      Left = 53
      Top = 96
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object Label3: TLabel
      Left = 53
      Top = 58
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label4: TLabel
      Left = 51
      Top = 136
      Width = 29
      Height = 13
      Caption = 'Harga'
    end
    object edKode: TEdit
      Left = 104
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyPress = edKodeKeyPress
    end
    object edNama: TEdit
      Left = 104
      Top = 93
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edHarga: TEdit
      Left = 104
      Top = 133
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 9
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit1'
    end
  end
  object con2: TADConnection
    Left = 656
    Top = 248
  end
  object con1: TADConnection
    Left = 656
    Top = 200
  end
  object ADConnection1: TADConnection
    Left = 592
    Top = 200
  end
  object DSBarang: TDataSource
    Left = 592
    Top = 256
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 656
    Top = 296
  end
  object ADConnection2: TADConnection
    Left = 528
    Top = 256
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 200
  end
end
