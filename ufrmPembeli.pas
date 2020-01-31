unit ufrmPembeli;

interface

uses
  ClassPembeli, Classes, Controls, DB, DBClient, DBGrids, Dialogs, ExtCtrls, Forms,
  Graphics, Grids, Menus, Messages, Provider, StdCtrls, SysUtils, Variants, uADCompClient,
  uADCompDataSet, uADDAptIntf, uADDAptManager, uADDatSManager, uADGUIxIntf, uADPhysIntf,
  uADPhysMSSQL, uADPhysManager, uADPhysODBCBase, uADStanAsync, uADStanDef, uADStanError,
  uADStanIntf, uADStanOption, uADStanParam, uADStanPool, uConnection, Windows;

type
  TfrmPembeli = class(TForm)
    ADConnection1: TADConnection;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    btnBaru: TButton;
    btnHapus: TButton;
    btnSimpan: TButton;
    DBGridPembeli: TDBGrid;
    DSPembeli: TDataSource;
    edKode: TEdit;
    edNama: TEdit;
    lblAlamat: TLabel;
    lblInputKodeWarning: TLabel;
    lblInputNamaWarning: TLabel;
    lblKode: TLabel;
    lblNama: TLabel;
    memAlamat: TMemo;
    pnlAtas: TPanel;
    procedure btnBaruClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnSimpanClick(Sender: TObject);
    procedure DBGridPembeliCellClick(Column: TColumn);
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FID: Integer;
    function IsDataValid: Boolean;
    procedure LoadDataPembeli;
  end;

var
  frmPembeli: TfrmPembeli;
implementation

{$R *.dfm}

// Tombol Baru diklik
procedure TfrmPembeli.btnBaruClick(Sender: TObject);
begin
  FID            := 0;
  edKode.Text    := '';
  edNama.Text    := '';
  memAlamat.Text := '';
end;

procedure TfrmPembeli.btnHapusClick(Sender: TObject);
var
  lPembeli: TPembeli;
begin
  lPembeli := TPembeli.Create;
  lPembeli.LoadByID(FID);
  if MessageDlg('Hapus?',mtConfirmation,mbYesNo,0) = mrYes then
    lPembeli.Hapus;
    LoadDataPembeli;
    if lPembeli.ID > 0 then begin
      ShowMessage(lPembeli.Nama + ' Berhasil dihapus');
    end else
      ShowMessage(lPembeli.Nama + ' Gagal dihapus');
end;

procedure TfrmPembeli.btnSimpanClick(Sender: TObject);
var
  lPembeli: TPembeli;
begin
  if not IsDataValid then Exit;

  lPembeli := TPembeli.Create;
  try
    lPembeli.Kode     := edKode.Text;
    lPembeli.Nama     := edNama.Text;
    lPembeli.Alamat   := memAlamat.Text;
    lPembeli.ID       := FID;
    if lPembeli.IsKodeSudahAda(edKode.Text, FID) then begin
      ShowMessage('Kode Sudah Ada');
      edKode.Focused;
    end else
    if lPembeli.Simpan then begin
      LoadDataPembeli;
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    lPembeli.Free;
  end;

end;

procedure TfrmPembeli.DBGridPembeliCellClick(Column: TColumn);
var
  lPembeli: TPembeli;
  s: string;
begin
  s := DBGridPembeli.DataSource.DataSet.FieldByName('kode').AsString;

  lPembeli := TPembeli.Create;
  lPembeli.LoadbyKode(s);

  FID := lpembeli.ID;
  edKode.Text := lPembeli.Kode;
  edNama.Text := lPembeli.Nama;
  memAlamat.Text := lPembeli.Alamat;
end;

procedure TfrmPembeli.edKodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  lPembeli: TPembeli;
begin
  if Key = VK_RETURN then begin
    lPembeli := TPembeli.Create;
    lPembeli.LoadbyKode(edKode.Text);

    FID            := lPembeli.ID;
    edNama.Text    := lPembeli.Nama;
    memAlamat.Text := lPembeli.Alamat;
  end;
end;

procedure TfrmPembeli.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9'] then begin
    Key := #0;
    lblInputNamaWarning.Visible := True;
  end else begin
    lblInputNamaWarning.Visible := False;
  end;
end;

procedure TfrmPembeli.FormShow(Sender: TObject);
begin
  LoadDataPembeli;
end;

function TfrmPembeli.IsDataValid: Boolean;
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
  if (memAlamat.Text = '') then begin
    str := str + 'Alamat belum diisi.';
    memAlamat.SetFocus;
  end;
  str := StringReplace(StringReplace(str, '', ' ',
    [rfReplaceAll]), #13, ' ', [rfReplaceAll]);

  if str <> '' then begin
    showMessage(str);
    exit;
  end;

  Result := True;
end;

procedure TfrmPembeli.LoadDataPembeli;
var
  lcds: TClientDataSet;
  sSQL: string;
  i: Integer;
begin
  sSQL := 'select * from tpembeli order by id';
  lcds := TConnection.OpenQuery(sSQL, Self);

  DSPembeli.DataSet := lcds;
  for I := 0 to lcds.FieldCount - 1 do begin

    if lcds.FieldDefs[i].DisplayName = 'id' then
      DBGridPembeli.columns[i].Visible := False;
  end;

end;

end.

