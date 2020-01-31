object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 400
  ClientWidth = 384
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
  object pnlAtas: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 200
    Align = alTop
    TabOrder = 0
    DesignSize = (
      384
      200)
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
      Left = 267
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
      Left = 267
      Top = 64
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Hanya Huruf'
      Color = clYellow
      ParentColor = False
      Visible = False
      ExplicitLeft = 283
    end
    object edKode: TEdit
      Left = 88
      Top = 24
      Width = 168
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnKeyDown = edKodeKeyDown
    end
    object edNama: TEdit
      Left = 88
      Top = 56
      Width = 168
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 1
      OnKeyPress = edNamaKeyPress
    end
    object memAlamat: TMemo
      Left = 88
      Top = 88
      Width = 168
      Height = 88
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object btnSimpan: TButton
      Left = 292
      Top = 163
      Width = 80
      Height = 25
      Align = alCustom
      Anchors = [akTop, akRight]
      Caption = 'Simpan'
      TabOrder = 3
      OnClick = btnSimpanClick
    end
    object btnBaru: TButton
      Left = 292
      Top = 83
      Width = 80
      Height = 25
      Align = alCustom
      Anchors = [akTop, akRight]
      Caption = 'Baru'
      TabOrder = 4
      OnClick = btnBaruClick
    end
    object btnHapus: TButton
      Left = 292
      Top = 123
      Width = 80
      Height = 25
      Align = alCustom
      Anchors = [akTop, akRight]
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = btnHapusClick
    end
  end
  object DBGridPembeli: TDBGrid
    Left = 0
    Top = 200
    Width = 384
    Height = 200
    Align = alClient
    DataSource = DSPembeli
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridPembeliCellClick
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 32
    Top = 371
  end
  object ADConnection1: TADConnection
    Left = 60
    Top = 371
  end
  object DSPembeli: TDataSource
    Top = 370
  end
end
