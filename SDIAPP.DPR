program Sdiapp;

uses
  Forms,
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassBarangBaru in 'ClassBarangBaru.pas',
  ClassPembeli in 'ClassPembeli.pas',
  ClassPembelian in 'ClassPembelian.pas',
  FormBarang in 'FormBarang.pas' {Form3},
  FormPembeli in 'FormPembeli.pas' {frmPembeli},
<<<<<<< HEAD
  FrmSetKoneksi in 'FrmSetKoneksi.pas' {Form2},
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  uConnection in 'uConnection.pas';
=======
  uConnection in 'uConnection.pas',
  FormBarang in 'FormBarang.pas' {frmBarang},
  ClassBarangBaru in 'ClassBarangBaru.pas',
  ufrmPembelian in 'ufrmPembelian.pas' {frmPembelian};
>>>>>>> 534fcde1105e7ca9c7cc1e86fdfc66b23178aa91

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
<<<<<<< HEAD
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfrmPembeli, frmPembeli);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TSDIAppForm, SDIAppForm);
=======
  Application.CreateForm(TfrmPembelian, frmPembelian);
>>>>>>> 534fcde1105e7ca9c7cc1e86fdfc66b23178aa91
  Application.Run;
end.
 
