object frmPembelian: TfrmPembelian
  Left = 0
  Top = 0
  Caption = 'Form Pembelian'
  ClientHeight = 318
  ClientWidth = 454
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
    Left = 16
    Top = 19
    Width = 64
    Height = 13
    Caption = 'No Pembelian'
  end
  object lbl1: TLabel
    Left = 16
    Top = 59
    Width = 38
    Height = 13
    Caption = 'Tanggal'
  end
  object Label2: TLabel
    Left = 18
    Top = 91
    Width = 36
    Height = 13
    Caption = 'Pembeli'
  end
  object ednopembelian: TEdit
    Left = 94
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edkode: TEdit
    Left = 94
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object dtptanggal: TDateTimePicker
    Left = 94
    Top = 51
    Width = 121
    Height = 21
    Date = 43857.379476782410000000
    Time = 43857.379476782410000000
    TabOrder = 1
  end
  object dbgrdpembelian: TDBGrid
    Left = 8
    Top = 192
    Width = 438
    Height = 118
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnsimpan: TButton
    Left = 170
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Simpan'
    TabOrder = 5
  end
  object btnhapus: TButton
    Left = 264
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 6
  end
  object Baru: TBitBtn
    Left = 360
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Baru'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
  end
  object edtnama: TEdit
    Left = 94
    Top = 125
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object con1: TADConnection
    Left = 392
    Top = 24
  end
  object DSpembelian: TDataSource
    Left = 344
    Top = 24
  end
  object DSbelian: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 104
  end
end
