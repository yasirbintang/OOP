program Sdiapp;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  uConnection in 'uConnection.pas',
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassPembeli in 'ClassPembeli.pas',
  ClassBarang in 'ClassBarang.pas',
  ufrmPembeli in 'ufrmPembeli.pas' {frmPembeli},
  ufrmBarang in 'ufrmBarang.pas' {frmBarang},
  ufrmPembelian in 'ufrmPembelian.pas' {frmPembelian},
  ClassPembelian0 in 'ClassPembelian0.pas',
  ufrmBuatUSer in 'ufrmBuatUSer.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.


