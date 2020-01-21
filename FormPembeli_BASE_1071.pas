unit FormPembeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ClassPembeli;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edID: TEdit;
    edKode: TEdit;
    edNama: TEdit;
    edAlamat: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function IsDataValid: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  lPembeli: TPembeli;
begin
  if not IsDataValid then
    Exit;

  lPembeli := TPembeli.Create;
  try
    lPembeli.Kode := edKode.Text;
    lPembeli.Nama := edNama.Text;

    if lPembeli.Simpan then
    begin
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    lPembeli.Free;
  end;
end;

function TForm1.IsDataValid: Boolean;
begin
  Result := False;

  if edKode.Text = '' then
  begin
    ShowMessage('Kode Belum Diisi');
    edKode.SetFocus;
    exit;
  end;

  Result := True;
end;

end.

