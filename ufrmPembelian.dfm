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
    DesignSize = (
      454
      121)
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
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = ednopembelianKeyDown
    end
    object edkode: TEdit
      Left = 94
      Top = 66
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnKeyDown = edkodeKeyDown
    end
    object dtptanggal: TDateTimePicker
      Left = 94
      Top = 41
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Date = 43857.379476782410000000
      Time = 43857.379476782410000000
      TabOrder = 1
    end
    object edNama: TEdit
      Left = 94
      Top = 91
      Width = 171
      Height = 21
      Anchors = [akLeft, akTop, akRight]
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
    DesignSize = (
      454
      41)
    object btnsimpan: TButton
      Left = 181
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnsimpanClick
    end
    object btnhapus: TButton
      Left = 275
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      TabOrder = 1
    end
    object Baru: TBitBtn
      Left = 371
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BaruClick
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
      OptionsView.GroupByBox = False
      object cxGridColKodeBarang: TcxGridColumn
        Caption = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGridColKodeBarangPropertiesValidate
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColNamaBarang: TcxGridColumn
        Caption = 'Nama'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object cxGridColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8')
        Properties.OnValidate = cxGridColQtyPropertiesValidate
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object cxGridColTotal: TcxGridColumn
        Caption = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
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
    Left = 376
    Top = 8
  end
  object DSpembelian: TDataSource
    Left = 408
    Top = 56
  end
  object DSbelian: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 8
  end
end
