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
  object pnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 19
      Width = 64
      Height = 13
      Caption = 'No Pembelian'
    end
    object lbl1: TLabel
      Left = 16
      Top = 45
      Width = 38
      Height = 13
      Caption = 'Tanggal'
    end
    object Label2: TLabel
      Left = 18
      Top = 81
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
      Top = 66
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyDown = edkodeKeyDown
    end
    object dtptanggal: TDateTimePicker
      Left = 94
      Top = 41
      Width = 121
      Height = 21
      Date = 43857.379476782410000000
      Time = 43857.379476782410000000
      TabOrder = 1
    end
    object edNama: TEdit
      Left = 94
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object pnlButon: TPanel
    Left = 0
    Top = 277
    Width = 454
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnsimpan: TButton
      Left = 181
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnsimpanClick
    end
    object btnhapus: TButton
      Left = 275
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 1
    end
    object Baru: TBitBtn
      Left = 371
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Baru'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 121
    Width = 454
    Height = 156
    Align = alClient
    TabOrder = 2
    object cxGridTablePembelianItem: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      object cxGridColKodeBarang: TcxGridColumn
        Caption = 'Kode'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColNamaBarang: TcxGridColumn
        Caption = 'Nama'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColTotal: TcxGridColumn
        Caption = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColID: TcxGridColumn
        Caption = 'ID'
        Visible = False
      end
    end
    object cxgrdlvlGrid1Level1: TcxGridLevel
      GridView = cxGridTablePembelianItem
    end
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
