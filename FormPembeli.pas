unit FormPembeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ClassPembeli, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, DB, uADCompClient;

type
  TfrmPembeli = class(TForm)
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
    con1: TADConnection;
    procedure Button1Click(Sender: TObject);
  private
    function IsDataValid: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembeli: TfrmPembeli;
implementation

{$R *.dfm}

procedure TfrmPembeli.Button1Click(Sender: TObject);
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

function TfrmPembeli.IsDataValid: Boolean;
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

