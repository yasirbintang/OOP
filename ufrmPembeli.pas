unit ufrmPembeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ClassPembeli, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADCompClient, DB, uConnection, uADPhysODBCBase, uADPhysMSSQL,
  DBClient, Provider, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADCompDataSet, ExtCtrls, Grids, DBGrids;

type
  TfrmPembeli = class(TForm)
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    ADConnection1: TADConnection;
    Panel1: TPanel;
    lblKode: TLabel;
    edKode: TEdit;
    lblNama: TLabel;
    edNama: TEdit;
    lblAlamat: TLabel;
    memAlamat: TMemo;
    btnLihat: TButton;
    btnSimpan: TButton;
    btnBaru: TButton;
    btnCancel: TButton;
    btnHapus: TButton;
    DBGridPembeli: TDBGrid;
    DSPembeli: TDataSource;
    lblInputKodeWarning: TLabel;
    lblInputNamaWarning: TLabel;
    procedure btnSimpanClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure edKodeKeyPress(Sender: TObject; var Key: Char);
    procedure edNamaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FID: Integer;
    function IsDataValid: Boolean;
    procedure LoadDataPembeli;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembeli: TfrmPembeli;
implementation

{$R *.dfm}

procedure TfrmPembeli.btnSimpanClick(Sender: TObject);
var
  lPembeli: TPembeli;
begin
  if not IsDataValid then
    Exit;

  lPembeli := TPembeli.Create;
  try
    lPembeli.Kode     := edKode.Text;
    lPembeli.Nama     := edNama.Text;
    lPembeli.Alamat   := memAlamat.Text;
    lPembeli.ID       := FID;

    if (lPembeli.IsKodeSudahAda(edKode.Text, FID)) then

    if lPembeli.IsKodeSudahAda(edKode.Text, FID) then

    begin
      // warning kode sudah ada
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

procedure TfrmPembeli.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPembeli.btnLihatClick(Sender: TObject);
var
  lPembeli: TPembeli;
  sID: string;
begin
  sID := InputBox('ID', 'ID', '0');

  lPembeli := TPembeli.Create;
  try
    lPembeli.LoadByID(StrToInt(sID));

    if lPembeli.ID > 0 then
    begin
      FID            := lPembeli.ID;
      edKode.Text    := lPembeli.Kode;
      edNama.Text    := lPembeli.Nama;
      memAlamat.Text := lPembeli.Alamat;
    end;

  finally
    lPembeli.Free;
  end;

end;
// Tombol Baru diklik
procedure TfrmPembeli.btnBaruClick(Sender: TObject);
begin
  FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  memAlamat.Text := '';
end;

procedure TfrmPembeli.btnHapusClick(Sender: TObject);
var
  lpembeli: TPembeli;
begin
  lpembeli := TPembeli.Create;
  lpembeli.LoadByID(FID);
  if Dialogs.MessageDlg('Hapus?',mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrYes then begin
        lpembeli.Hapus;
        LoadDataPembeli;
        if lpembeli.ID > 0 then begin
          ShowMessage(lpembeli.Nama + ' Berhasil dihapus'); end
        else begin
          ShowMessage(lpembeli.Nama + ' Gagal dihapus'); end;
  end
end;

procedure TfrmPembeli.edKodeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then begin
    Key := #0;
//    lblInputKodeWarning.Caption := 'Hanya Angka';
    lblInputKodeWarning.Visible := True;
  end else begin
    lblInputKodeWarning.Visible := False;
  end;
end;

procedure TfrmPembeli.edNamaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9'] then
  begin
    Key := #0;
//    lblInputNamaWarning.Caption := 'Hanya Huruf';
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
    edKode.SetFocus; end;
  if (edNama.Text = '') then begin
    str := str + 'Nama belum diisi.' + sLineBreak;
    edNama.SetFocus; end;
  if (memAlamat.Text = '') then begin
    str := str + 'Alamat belum diisi.';
    memAlamat.SetFocus; end;
  str := StringReplace(StringReplace(str, '', ' ', [rfReplaceAll]), #13, ' ', [rfReplaceAll]);

  if str <> '' then begin
    showMessage(str);
    exit; end;

  Result := True;
end;

procedure TfrmPembeli.LoadDataPembeli;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from tpembeli order by kode';
  lcds := TConnection.OpenQuery(sSQL, Self);

  DSPembeli.DataSet := lcds;
//  DBGridPembeli
end;

end.

