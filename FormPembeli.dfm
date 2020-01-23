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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 211
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 379
    object Label2: TLabel
      Left = 17
      Top = 30
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label3: TLabel
      Left = 17
      Top = 59
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object Label4: TLabel
      Left = 17
      Top = 91
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object edKode: TEdit
      Left = 89
      Top = 27
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object edNama: TEdit
      Left = 89
      Top = 56
      Width = 185
      Height = 21
      TabOrder = 1
    end
    object memAlamat: TMemo
      Left = 89
      Top = 91
      Width = 185
      Height = 89
      TabOrder = 2
    end
    object Button4: TButton
      Left = 302
      Top = 155
      Width = 75
      Height = 25
      Caption = 'Lihat Pembeli'
      TabOrder = 5
      OnClick = Button4Click
    end
    object Button1: TButton
      Left = 6
      Top = 186
      Width = 60
      Height = 20
      Caption = 'OK'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button5: TButton
      Left = 302
      Top = 124
      Width = 75
      Height = 25
      Caption = 'Baru'
      TabOrder = 6
      OnClick = Button5Click
    end
    object Button2: TButton
      Left = 72
      Top = 186
      Width = 60
      Height = 20
      Caption = 'Cancel'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button6: TButton
      Left = 302
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 7
      OnClick = Button6Click
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
    Left = 96
    Top = 216
  end
end
