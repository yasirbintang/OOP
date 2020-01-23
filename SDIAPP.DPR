program Sdiapp;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassPembeli in 'ClassPembeli.pas',
  FormPembeli in 'FormPembeli.pas' {frmPembeli},
  uConnection in 'uConnection.pas',
  FrmSetKoneksi in 'FrmSetKoneksi.pas' {Form2},
  FormBarang in 'FormBarang.pas' {Form3},
  ClassBarangBaru in 'ClassBarangBaru.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmPembeli, frmPembeli);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
 
