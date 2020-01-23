unit ufrmBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, classBarang;

type
  TfrmBarang = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edKode: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    Label4: TLabel;
    edHarga: TEdit;
    Button1: TButton;
    edID: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
   function validasidata: Boolean;
    { Public declarations }
  end;

var
  frmBarang: TfrmBarang;
  Barang: TBarang;
implementation

{$R *.dfm}

procedure TfrmBarang.Button1Click(Sender: TObject);
begin
  if not validasidata then
    Exit;

  Barang := TBarang.Create;
  try
    barang.Kode := edKode.Text;
    barang.Nama := edNama.Text;
    barang.Harga := edharga.Text;

    if barang.Simpan then
    begin
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    barang.Free;
  end;
end;

procedure TfrmBarang.Button2Click(Sender: TObject);
begin
  barang.ToString;
end;

function TfrmBarang.validasidata: Boolean;
begin
  result:= false;

  if edKode.Text = '' then
  begin
    ShowMessage('Kode Belum Diisi');
    edKode.SetFocus;
    exit;
  end;

  Result := True; //
  // TODO -cMM: TfrmBarang.validasidata default body inserted
end;

end.
