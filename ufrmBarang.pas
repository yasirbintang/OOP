unit ufrmBarang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uConnection, Grids, DBGrids, StdCtrls, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADCompClient, DB, uADPhysODBCBase, uADPhysMSSQL,
  DBClient, Provider, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADCompDataSet, ExtCtrls, ClassBarang;

type
  TfrmBarang = class(TForm)
    btnconnect: TButton;
    btnhapus: TButton;
    btnbaru: TButton;
    btnlihat: TButton;
    DBGrid1: TDBGrid;
    btsimpan: TButton;
    DSBarang: TDataSource;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    ADConnection2: TADConnection;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    pnlpropety: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edKode: TEdit;
    edNama: TEdit;
    edHarga: TEdit;
    Edit1: TEdit;
    Label5: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btsimpanClick(Sender: TObject);
    procedure btnconnectClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnbaruClick(Sender: TObject);
    procedure btnlihatClick(Sender: TObject);
    procedure edKodeKeyPress(Sender: TObject; var Key: Char);
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
    lbarang.Harga    := StrToFloat(edHarga.Text);
    lbarang.ID       := FID;

    scandata;

    if label1.Caption <> '' then
    begin
      ShowMessage('kode sudah ada');
      exit;
    end;

    if lbarang.IsKodeSudahAda(edKode.Text , FID) then
    begin
      ShowMessage('kode sudah ada');
      exit;
    end;

    if lbarang.Simpan then
    begin
      LoadDataBarang;
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    lbarang.Free;
  end;
end;

procedure TfrmBarang.btnconnectClick(Sender: TObject);
begin
 if TConnection.ConnectDB('belajar', 'MSSQL', '192.168.0.62','belajar_oop', 'sa', 'it@3Serangkai', '1433') then
  begin
    ShowMessage('Berhasil Membuat koneksi DB');
  end;

end;

procedure TfrmBarang.btnhapusClick(Sender: TObject);
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
    btnbaru.Click;
  end;

// if lbarang.Hapus then
//  begin
//    LoadDataBarang;
//    ShowMessage('Berhasil Hapus');
//    Button3.Click;
//  end;

end;

procedure TfrmBarang.btnbaruClick(Sender: TObject);
begin
FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  edharga.Text := '';
end;

procedure TfrmBarang.btnlihatClick(Sender: TObject);
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
      edHarga.Text    := FloatToStr(lBarang.Harga);
    end;

  finally
    lBarang.Free;
  end;
end;


procedure TfrmBarang.edKodeKeyPress(Sender: TObject; var Key: Char);
begin
//    if not (key in['0'..'9', #8, #13]) then
//    ShowMessage('data harus angka');
    //edKode.Clear;
    //key:= #0;
    //edKode.SetFocus;
    //key:= #0 ;
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
  sSQL := 'select kode, nama from tbarang ' +
          ' where id <> '+ IntToStr(FID) +
          ' and kode = ' + QuotedStr(edKode.Text);


  lcds := TConnection.OpenQuery(sSQL);
  try
    if not lcds.IsEmpty then
    begin
      label1.Caption := lcds.FieldByName('kode').AsString + ' : ' + lcds.FieldByName('nama').AsString;
    end else
      label1.Caption := '';

  finally
    lcds.Free;
  end;

end;
end.
