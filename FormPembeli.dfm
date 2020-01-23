object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 242
  ClientWidth = 284
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
    Left = 24
    Top = 24
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 24
    Height = 13
    Caption = 'Kode'
  end
  object Label3: TLabel
    Left = 24
    Top = 80
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label4: TLabel
    Left = 24
    Top = 112
    Width = 33
    Height = 13
    Caption = 'Alamat'
  end
  object edID: TEdit
    Left = 88
    Top = 21
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object edKode: TEdit
    Left = 88
    Top = 48
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object edNama: TEdit
    Left = 88
    Top = 77
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object edAlamat: TEdit
    Left = 88
    Top = 112
    Width = 169
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 56
    Top = 200
    Width = 60
    Height = 20
    Caption = 'OK'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 174
    Top = 200
    Width = 60
    Height = 20
    Caption = 'Cancel'
    TabOrder = 5
  end
  object con1: TADConnection
    Left = 136
    Top = 128
  end
end
