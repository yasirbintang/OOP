program Sdiapp;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassPembeli in 'ClassPembeli.pas',
  FormPembeli in 'FormPembeli.pas' {frmPembeli},
  ufrmBarang in 'ufrmBarang.pas' {frmBarang},
  konek in 'konek.pas' {koneksi: TDataModule},
  classbrg in 'classbrg.pas',
  classBarang in 'classBarang.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(Tkoneksi, koneksi);
  Application.Run;
end.
 
