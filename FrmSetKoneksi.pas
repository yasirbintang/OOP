unit FrmSetKoneksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    edServer: TEdit;
    Label2: TLabel;
    edDB: TEdit;
    edPass: TEdit;
    Label3: TLabel;
    Button1: TButton;
    edUser: TEdit;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
