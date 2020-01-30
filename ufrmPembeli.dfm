object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 360
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxg1: TcxGrid
    Left = 0
    Top = 211
    Width = 400
    Height = 149
    Align = alClient
    TabOrder = 2
    Visible = False
    ExplicitTop = 212
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGTV: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.NoDataToDisplayInfoText = '.'
      OptionsView.GroupByBox = False
      object cxGTVColKode: TcxGridDBColumn
      end
      object cxGTVColNama: TcxGridDBColumn
      end
      object cxGTVColAlamat: TcxGridDBColumn
      end
    end
    object cxGLv: TcxGridLevel
      GridView = cxGTV
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 211
    Align = alTop
    TabOrder = 0
    DesignSize = (
      400
      211)
    object lblKode: TLabel
      Left = 17
      Top = 30
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object lblNama: TLabel
      Left = 17
      Top = 59
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object lblAlamat: TLabel
      Left = 17
      Top = 91
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object lblInputKodeWarning: TLabel
      AlignWithMargins = True
      Left = 283
      Top = 32
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hanya Angka'
      Color = clYellow
      ParentColor = False
      Visible = False
      ExplicitLeft = 280
    end
    object lblInputNamaWarning: TLabel
      AlignWithMargins = True
      Left = 283
      Top = 64
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hanya Huruf'
      Color = clYellow
      ParentColor = False
      Visible = False
    end
    object edKode: TEdit
      Left = 88
      Top = 24
      Width = 184
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edKodeKeyDown
    end
    object edNama: TEdit
      Left = 88
      Top = 56
      Width = 184
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnKeyPress = edNamaKeyPress
    end
    object memAlamat: TMemo
      Left = 88
      Top = 88
      Width = 184
      Height = 88
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object btnLihat: TButton
      Left = 302
      Top = 155
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Lihat Pembeli'
      TabOrder = 6
      OnClick = btnLihatClick
    end
    object btnSimpan: TButton
      Left = 6
      Top = 186
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      TabOrder = 3
      OnClick = btnSimpanClick
    end
    object btnBaru: TButton
      Left = 302
      Top = 124
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Baru'
      TabOrder = 5
      OnClick = btnBaruClick
    end
    object btnCancel: TButton
      Left = 72
      Top = 186
      Width = 60
      Height = 20
      Anchors = [akLeft, akBottom]
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = btnCancelClick
    end
    object btnHapus: TButton
      Left = 302
      Top = 186
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Hapus'
      TabOrder = 7
      OnClick = btnHapusClick
    end
  end
  object DBGridPembeli: TDBGrid
    Left = 0
    Top = 211
    Width = 400
    Height = 149
    Align = alClient
    DataSource = DSPembeli
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 304
    Top = 72
  end
  object ADConnection1: TADConnection
    Left = 336
    Top = 8
  end
  object con1: TADConnection
    Left = 344
    Top = 56
  end
  object con2: TADConnection
    Left = 352
    Top = 104
  end
  object DSPembeli: TDataSource
    Left = 360
    Top = 216
  end
end
