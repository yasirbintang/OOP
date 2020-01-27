program Sdiapp;

uses
  Forms,
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassBarangBaru in 'ClassBarangBaru.pas',
  ClassPembeli in 'ClassPembeli.pas',
  ClassPembelian in 'ClassPembelian.pas',
  FormBarang in 'FormBarang.pas' {Form3},
  FormPembeli in 'FormPembeli.pas' {frmPembeli},
  FrmSetKoneksi in 'FrmSetKoneksi.pas' {Form2},
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  uConnection in 'uConnection.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfrmPembeli, frmPembeli);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.Run;
end.
 
