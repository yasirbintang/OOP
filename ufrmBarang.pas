unit ufrmBarang;

interface

uses
  ClassBarang,  Classes, Controls, DB, DBClient, DBGrids, Dialogs, ExtCtrls, Forms,
  Graphics, Grids, Menus, Messages, Provider, StdCtrls, SysUtils, Variants, uADCompClient,
  uADCompDataSet, uADDAptIntf, uADDAptManager, uADDatSManager, uADGUIxIntf, uADPhysIntf,
  uADPhysMSSQL, uADPhysManager, uADPhysODBCBase, uADStanAsync, uADStanDef, uADStanError,
  uADStanIntf, uADStanOption, uADStanParam, uADStanPool, uConnection, Windows;

type
  TfrmBarang = class(TForm)
    ADConnection1: TADConnection;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    btnbaru: TButton;
    btnhapus: TButton;
    btsimpan: TButton;
    DBGridBarang: TDBGrid;
    DSBarang: TDataSource;
    edHarga: TEdit;
    edKode: TEdit;
    edNama: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    lblHarga: TLabel;
    lblKode: TLabel;
    lblNama: TLabel;
    pnlAtas: TPanel;
    procedure btnbaruClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btsimpanClick(Sender: TObject);
    procedure DBGridBarangCellClick(Column: TColumn);
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    FID: Integer;
    function IsDataValid: Boolean;
    procedure LoadDataBarang;
  end;

var
  frmBarang: TfrmBarang;
implementation

{$R *.dfm}


procedure TfrmBarang.btnbaruClick(Sender: TObject);
begin
  FID           := 0;
  edKode.Text   := '';
  edNama.Text   := '';
  edharga.Text := '';
end;

procedure TfrmBarang.btnhapusClick(Sender: TObject);
var
  lbarang: TBarang;
begin
  lbarang := TBarang.Create;
  lbarang.LoadByID(FID);
  if MessageDlg('Hapus?',mtConfirmation,mbYesNo,0) = mrYes then
  begin
    lbarang.Hapus;
    LoadDataBarang;
    ShowMessage('Berhasil Hapus');
    btnbaru.Click;
  end;
end;

procedure TfrmBarang.btsimpanClick(Sender: TObject);
var
  lBarang: TBarang;
begin
  if not IsDataValid then
    Exit;

  lBarang := TBarang.Create;
  try
    lbarang.Kode     := edKode.Text;
    lbarang.Nama     := edNama.Text;
    lbarang.Harga    := StrToFloat(edHarga.Text);
    lbarang.ID       := FID;

    if lBarang.IsKodeSudahAda(edKode.Text, FID) then begin
      ShowMessage('Kode Sudah Ada');
      edKode.Focused;
    end else
    if lBarang.Simpan then begin
      LoadDataBarang;
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;
    finally
    lbarang.Free;
  end;
end;

procedure TfrmBarang.DBGridBarangCellClick(Column: TColumn);
var
  lBarang: TBarang;
  s: string;
begin
  s := DBGridBarang.Fields[1].Value;

  lBarang := TBarang.Create;
  lBarang.LoadbyKode(s);

  FID := lBarang.ID;
  edKode.Text := lBarang.Kode;
  edNama.Text := lBarang.Nama;
  edHarga.Text := FloatToStr(lBarang.Harga);
end;

procedure TfrmBarang.edKodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  lBarang: TBarang;
begin
  if Key = VK_RETURN then begin
    lBarang := TBarang.Create;
    lBarang.LoadbyKode(edKode.Text);

    FID          := lBarang.ID;
    edNama.Text  := lBarang.Nama;
    edHarga.Text := FloatToStr(lBarang.Harga);
  end;
end;

procedure TfrmBarang.FormCreate(Sender: TObject);
begin
  LoadDataBarang;
end;

function TfrmBarang.IsDataValid: Boolean;
var
  str : string;
begin
  Result := False;
  str := '';
  if (edKode.Text = '') then begin
    str := 'Kode belum diisi.' + sLineBreak;
    edKode.SetFocus;
  end;
  if (edNama.Text = '') then begin
    str := str + 'Nama belum diisi.' + sLineBreak;
    edNama.SetFocus;
  end;
  if (edHarga.Text = '') then begin
    str := str + 'Harga belum diisi.';
    edHarga.SetFocus;
  end;
  str := StringReplace(StringReplace(str, '', ' ',
    [rfReplaceAll]), #13, ' ', [rfReplaceAll]);

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
  i: Integer;
begin
  sSQL := 'select * from tbarang order by id';
  lcds := TConnection.OpenQuery(sSQL, Self);

  DSBarang.DataSet := lcds;
  for I := 0 to lcds.FieldCount - 1 do
    if lcds.FieldDefs[i].DisplayName = 'ID' then
      DBGridBarang.columns[i].Visible := False;
end;

end.
