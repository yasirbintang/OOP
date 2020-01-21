object frmPembeli: TfrmPembeli
  Left = 0
  Top = 0
  Caption = 'Pembeli Baru'
  ClientHeight = 300
  ClientWidth = 300
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
    Left = 24
    Top = 19
    Width = 24
    Height = 13
    Caption = 'Kode'
  end
  object Label3: TLabel
    Left = 24
    Top = 48
    Width = 27
    Height = 13
    Caption = 'Nama'
  end
  object Label4: TLabel
    Left = 24
    Top = 80
    Width = 33
    Height = 13
    Caption = 'Alamat'
  end
  object edKode: TEdit
    Left = 104
    Top = 19
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object edNama: TEdit
    Left = 104
    Top = 46
    Width = 169
    Height = 21
<<<<<<< HEAD
    TabOrder = 1
=======
    TabOrder = 2
  end
  object edAlamat: TEdit
    Left = 88
    Top = 112
    Width = 169
    Height = 21
    TabOrder = 3
// >>>>>>> 7a181d3d696de49d2ccaee68b52c9d40b4d59e8e
  end
  object Button1: TButton
    Left = 48
    Top = 168
    Width = 60
    Height = 20
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 190
    Top = 168
    Width = 60
    Height = 20
    Caption = 'Cancel'
    TabOrder = 3
  end
  object edAlamat: TMemo
    Left = 104
    Top = 73
    Width = 169
    Height = 80
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
end
