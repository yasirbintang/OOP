unit FormBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uConnection, Grids, DBGrids, StdCtrls, ClassBarangBaru, ClassPembelian;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edKode: TEdit;
    edNama: TEdit;
    Label3: TLabel;
    edHarga: TEdit;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    DBGrid1: TDBGrid;
    btsimpan: TButton;
    edID: TEdit;
    procedure btsimpanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
  FID: Integer;

    function IsDataValid: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}



procedure TForm3.btsimpanClick(Sender: TObject);

var
  lbarang: TBarang;
begin
  if not IsDataValid then
    Exit;

  lbarang := Tbarang.Create;
  try
    lbarang.Kode     := edKode.Text;
    lbarang.Nama     := edNama.Text;
    lbarang.Harga    := edHarga.Text;
    lbarang.ID       := FID;

    if lbarang.Simpan then
    begin
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    lbarang.Free;
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 if TConnection.ConnectDB('belajar', 'MSSQL', '192.168.0.62','belajar_oop', 'sa', 'it@3Serangkai', '1433') then
  begin
    ShowMessage('Berhasil Membuat koneksi DB');
  end;

end;

procedure TForm3.Button2Click(Sender: TObject);
var
  lbarang: TBarang;
begin
  lbarang := TBarang.Create;
  lbarang.LoadByID(FID);

  if lbarang.Hapus then
  begin
    ShowMessage('Berhasil Hapus');
    Button3.Click;
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  edharga.Text := '';
end;

procedure TForm3.Button4Click(Sender: TObject);
var
  lBarang: TBarang;
  sID: string;
begin
  sID := InputBox('ID', 'ID', '0');

  lBarang := TBarang.Create;
  try
    lBarang.LoadByID(StrToInt(sID));

    if lBarang.ID > 0 then
    begin
      FID             := lBarang.ID;
      edKode.Text     := lBarang.Kode;
      edNama.Text     := lBarang.Nama;
      edHarga.Text    := lBarang.Harga;
    end;

  finally
    lBarang.Free;
  end;
end;

function Tform3.IsDataValid: Boolean;
var
  str : string;
begin
  Result := False;
  str := '';
  if (edKode.Text = '') then
  begin
    str := 'Kode belum diisi.' + sLineBreak;
    edKode.SetFocus;
  end;
  if (edNama.Text = '') then
  begin
    str := str + 'Nama belum diisi.' + sLineBreak;
    edNama.SetFocus;
  end;
  if (edHarga.Text = '') then
  begin
    str := str + 'Alamat belum diisi.';
    edHarga.SetFocus;
  end;
  str := StringReplace(StringReplace(str, '', ' ', [rfReplaceAll]), #13, ' ', [rfReplaceAll]);

  if str <> '' then
  begin
    showMessage(str);
    exit;
  end;

  Result := True;
end;

end.
