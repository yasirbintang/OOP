object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 332
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 105
    Align = alTop
    TabOrder = 0
    ExplicitLeft = -8
    object Label2: TLabel
      Left = 17
      Top = 14
      Width = 24
      Height = 13
      Caption = 'Kode'
    end
    object Label3: TLabel
      Left = 17
      Top = 43
      Width = 27
      Height = 13
      Caption = 'Nama'
    end
    object Label4: TLabel
      Left = 17
      Top = 75
      Width = 33
      Height = 13
      Caption = 'Alamat'
    end
    object edKode: TEdit
      Left = 89
      Top = 13
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object edNama: TEdit
      Left = 89
      Top = 40
      Width = 169
      Height = 21
      TabOrder = 1
    end
    object edAlamat: TEdit
      Left = 89
      Top = 75
      Width = 169
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 491
    Height = 72
    Align = alTop
    TabOrder = 1
    object Button1: TButton
      Left = 341
      Top = 11
      Width = 60
      Height = 20
      Caption = 'OK'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 407
      Top = 11
      Width = 60
      Height = 20
      Caption = 'Cancel'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 17
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Tes Koneksi'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 98
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Lihat Pembeli'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 179
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Baru'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 260
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Hapus'
      TabOrder = 5
      OnClick = Button6Click
    end
    object btSimpan: TButton
      Left = 17
      Top = 41
      Width = 75
      Height = 25
      Caption = 'Simpan'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 177
    Width = 491
    Height = 155
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 456
    Top = 48
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from tpembeli')
    Left = 272
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 304
    Top = 8
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=belajar_oop;Data Source=192.168.0.62;Initial File Na' +
      'me="";Server SPN="";'
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLNCLI11.1'
    Left = 384
    Top = 24
  end
end
