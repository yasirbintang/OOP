object frmBarang: TfrmBarang
  Left = 0
  Top = 0
  Caption = 'Barang Baru'
  ClientHeight = 380
  ClientWidth = 344
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
  object pnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 120
    Align = alTop
    TabOrder = 0
    DesignSize = (
      344
      120)
    object lblNama: TLabel
      Left = 15
      Top = 42
      Width = 27
      Height = 13
      Align = alCustom
      Caption = 'Nama'
    end
    object lblKode: TLabel
      Left = 15
      Top = 13
      Width = 24
      Height = 13
      Align = alCustom
      Caption = 'Kode'
    end
    object lblHarga: TLabel
      Left = 15
      Top = 72
      Width = 29
      Height = 13
      Align = alCustom
      Caption = 'Harga'
    end
    object Label5: TLabel
      Left = 404
      Top = 165
      Width = 68
      Height = 13
      Caption = 'Status Barang'
    end
    object Label1: TLabel
      Left = 350
      Top = 165
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object edKode: TEdit
      Left = 61
      Top = 13
      Width = 181
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edKodeKeyDown
    end
    object edNama: TEdit
      Left = 61
      Top = 42
      Width = 181
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object edHarga: TEdit
      Left = 61
      Top = 74
      Width = 181
      Height = 21
      Align = alCustom
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object btnbaru: TButton
      Left = 260
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      TabOrder = 3
      OnClick = btnbaruClick
    end
    object btsimpan: TButton
      Left = 260
      Top = 70
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      TabOrder = 4
      OnClick = btsimpanClick
    end
    object btnhapus: TButton
      Left = 260
      Top = 40
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = btnhapusClick
    end
  end
  object DBGridBarang: TDBGrid
    Left = 0
    Top = 120
    Width = 344
    Height = 260
    Align = alClient
    DataSource = DSBarang
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridBarangCellClick
  end
  object DSBarang: TDataSource
    Top = 351
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 30
    Top = 354
  end
  object ADConnection1: TADConnection
    Left = 59
    Top = 351
  end
end
