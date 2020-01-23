object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 300
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 32
    Top = 38
    Width = 24
    Height = 13
    Caption = 'Kode'
  end
  object Label3: TLabel
    Left = 32
    Top = 67
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label4: TLabel
    Left = 32
    Top = 99
    Width = 33
    Height = 13
    Caption = 'Alamat'
  end
  object edKode: TEdit
    Left = 104
    Top = 35
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object edNama: TEdit
    Left = 104
    Top = 64
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 64
    Top = 248
    Width = 60
    Height = 20
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 182
    Top = 248
    Width = 60
    Height = 20
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 89
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Lihat Pembeli'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 170
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Baru'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 251
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 6
    OnClick = Button6Click
  end
  object memAlamat: TMemo
    Left = 104
    Top = 99
    Width = 185
    Height = 89
    TabOrder = 7
  end
  object ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink
    Left = 304
    Top = 248
  end
  object ADConnection1: TADConnection
    Left = 304
    Top = 16
  end
end
