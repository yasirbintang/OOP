object frmPembelian: TfrmPembelian
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Form Pembelian'
  ClientHeight = 320
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 80
  TextHeight = 13
  object pnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 434
    Height = 120
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      434
      120)
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
      Width = 55
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edNoBuktiKeyDown
      ExplicitWidth = 75
    end
    object edPembeliKode: TEdit
      Left = 94
      Top = 66
      Width = 55
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnKeyDown = edPembeliKodeKeyDown
      ExplicitWidth = 75
    end
    object dtptanggal: TDateTimePicker
      Left = 94
      Top = 41
      Width = 142
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Date = 43831.379476782410000000
      Time = 43831.379476782410000000
      DateFormat = dfLong
      TabOrder = 1
      ExplicitWidth = 162
    end
    object edPembeliNama: TEdit
      Left = 94
      Top = 91
      Width = 151
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clSilver
      ReadOnly = True
      TabOrder = 3
      ExplicitWidth = 171
    end
  end
  object pnlButon: TPanel
    Left = 0
    Top = 279
    Width = 434
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 277
    ExplicitWidth = 454
    DesignSize = (
      434
      41)
    object btnsimpan: TButton
      Left = 181
      Top = 8
      Width = 55
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Simpan'
      TabOrder = 0
      OnClick = btnsimpanClick
      ExplicitWidth = 75
    end
    object btnhapus: TButton
      Left = 255
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      TabOrder = 1
      OnClick = btnhapusClick
      ExplicitLeft = 275
    end
    object Baru: TBitBtn
      Left = 351
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = BaruClick
      ExplicitLeft = 371
    end
  end
  object cxgrd1: TcxGrid
    Left = 0
    Top = 120
    Width = 434
    Height = 159
    Align = alClient
    TabOrder = 2
    LookAndFeel.SkinName = 'LondonLiquidSky'
    ExplicitTop = 121
    ExplicitWidth = 454
    ExplicitHeight = 156
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
        MinWidth = 10
      end
      object cxGridColNamaBarang: TcxGridColumn
        Caption = 'Nama'
        PropertiesClassName = 'TcxLabelProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
      end
      object cxGridColQty: TcxGridColumn
        Caption = 'Qty'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExpr
        Properties.EditMask = '[1-9]\d*$'
        HeaderAlignmentHorz = taCenter
        MinWidth = 5
      end
      object cxGridColHarga: TcxGridColumn
        Caption = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        MinWidth = 15
        Options.Editing = False
      end
      object cxGridColTotal: TcxGridColumn
        Caption = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.;-,0.'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        MinWidth = 15
        Options.Editing = False
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
