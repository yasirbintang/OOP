unit FormBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uConnection, Grids, DBGrids, StdCtrls, ClassBarangBaru,uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADCompClient, DB, uADPhysODBCBase, uADPhysMSSQL,
  DBClient, Provider, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADCompDataSet, ExtCtrls;

type
  TfrmBarang = class(TForm)
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
    DSBarang: TDataSource;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    ADConnection2: TADConnection;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btsimpanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
  FID: Integer;

    function IsDataValid: Boolean;
    procedure LoadDataBarang;
    function scandata: string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBarang: TfrmBarang;

implementation

{$R *.dfm}


procedure TfrmBarang.FormCreate(Sender: TObject);
begin
  LoadDataBarang;


end;

procedure TfrmBarang.btsimpanClick(Sender: TObject);
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





//    if TConnection.OpenQuery.RecordCount > 0 then
//       ShowMessage('Kode Sudah Ada')
//    else
//      lbarang.Simpan;
//      LoadDataBarang;
//      ShowMessage('Berhasil Simpan');


//    if lbarang.Simpan then
//    begin
//      LoadDataBarang;
//      ShowMessage('Berhasil Simpan')
//    end else begin
//      ShowMessage('Gagal Simpan');
//    end;

  finally
    lbarang.Free;
  end;
end;

procedure TfrmBarang.Button1Click(Sender: TObject);
begin
 if TConnection.ConnectDB('belajar', 'MSSQL', '192.168.0.62','belajar_oop', 'sa', 'it@3Serangkai', '1433') then
  begin
    ShowMessage('Berhasil Membuat koneksi DB');
  end;

end;

procedure TfrmBarang.Button2Click(Sender: TObject);
var
  lbarang: TBarang;

begin
  lbarang := TBarang.Create;
  lbarang.LoadByID(FID);

  if MessageDlg('Apakah ingin dihapus?',mtConfirmation,mbYesNo,0) = mrYes then
  begin
    lbarang.Hapus;
    LoadDataBarang;
    ShowMessage('Berhasil Hapus');
    Button3.Click;
  end;

// if lbarang.Hapus then
//  begin
//    LoadDataBarang;
//    ShowMessage('Berhasil Hapus');
//    Button3.Click;
//  end;

end;

procedure TfrmBarang.Button3Click(Sender: TObject);
begin
FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  edharga.Text := '';
end;

procedure TfrmBarang.Button4Click(Sender: TObject);
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

function TfrmBarang.IsDataValid: Boolean;
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
    str := str + 'Harga belum diisi.';
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

procedure Tfrmbarang.LoadDataBarang;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from tbarang order by id';
  lcds := TConnection.OpenQuery(sSQL, Self);

  DSBarang.DataSet := lcds;
end;



function tfrmbarang.scandata: string;
var
  lcds : TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * kode from tbarang ';
  lcds := TConnection.OpenQuery(sSQL);
  sSQL := Label1.Caption;
end;
end.
