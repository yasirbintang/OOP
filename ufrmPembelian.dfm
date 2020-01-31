object frmPembelian: TfrmPembelian
  Left = 0
  Top = 0
  Caption = 'Form Pembelian'
  ClientHeight = 318
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 121
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 487
    DesignSize = (
      438
      121)
    object lblNoPembelian: TLabel
      Left = 16
      Top = 19
      Width = 64
      Height = 13
      Caption = 'No Pembelian'
    end
    object lblTgl: TLabel
      Left = 16
      Top = 45
      Width = 38
      Height = 13
      Caption = 'Tanggal'
    end
    object lblPembeli: TLabel
      Left = 18
      Top = 81
      Width = 36
      Height = 13
      Caption = 'Pembeli'
    end
    object edNoBukti: TEdit
      Left = 94
      Top = 14
      Width = 146
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edNoBuktiKeyDown
      ExplicitWidth = 195
    end
    object edPembeliKode: TEdit
      Left = 94
      Top = 64
      Width = 59
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnKeyDown = edPembeliKodeKeyDown
      ExplicitWidth = 108
    end
    object dtptanggal: TDateTimePicker
      Left = 94
      Top = 41
      Width = 146
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Date = 43860.379476782410000000
      Time = 43860.379476782410000000
      TabOrder = 1
    end
    object edPembeliNama: TEdit
      Left = 94
      Top = 91
      Width = 155
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 3
      ExplicitWidth = 204
    end
  end
  object pnlButon: TPanel
    Left = 0
    Top = 277
    Width = 438
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 487
    DesignSize = (
      438
      41)
    object btnsimpan: TButton
      Left = 181
      Top = 8
      Width = 59
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnsimpanClick
      ExplicitWidth = 108
    end
    object btnhapus: TButton
      Left = 259
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      TabOrder = 1
      OnClick = btnhapusClick
      ExplicitLeft = 308
    end
    object Baru: TBitBtn
      Left = 355
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BaruClick
      ExplicitLeft = 404
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 121
    Width = 438
    Height = 156
    Align = alClient
    TabOrder = 1
    ExplicitTop = 123
    object cxGridTablePembelianItem: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Appending = True
      OptionsView.NoDataToDisplayInfoText = '.'
      OptionsView.GroupByBox = False
      object cxGridColID: TcxGridColumn
        Caption = 'ID'
        Visible = False
      end
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
        Width = 92
      end
      object cxGridColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.OnValidate = cxGridColQtyPropertiesValidate
        HeaderAlignmentHorz = taCenter
      end
      object cxGridColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 68
      end
      object cxGridColTotal: TcxGridColumn
        Caption = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 151
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
