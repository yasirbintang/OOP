program Sdiapp;

uses
  Forms,
  SDIMAIN in 'SDIMAIN.PAS' {SDIAppForm},
  ABOUT in 'ABOUT.PAS' {AboutBox},
  ClassPembeli in 'ClassPembeli.pas',
  FormPembeli in 'FormPembeli.pas' {frmPembeli},
  uConnection in 'uConnection.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TfrmPembeli, frmPembeli);
  Application.Run;
end.
 
