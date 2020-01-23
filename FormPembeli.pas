unit FormPembeli;

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
    Label2: TLabel;
    edKode: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    Label4: TLabel;
    memAlamat: TMemo;
    Button4: TButton;
    Button1: TButton;
    Button5: TButton;
    Button2: TButton;
    Button6: TButton;
    DBGridPembeli: TDBGrid;
    DSPembeli: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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

procedure TfrmPembeli.Button1Click(Sender: TObject);
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

    if lPembeli.Simpan then
    begin
      LoadDataPembeli;
      ShowMessage('Berhasil Simpan')
    end else begin
      ShowMessage('Gagal Simpan');
    end;

  finally
    lPembeli.Free;
  end;




end;

procedure TfrmPembeli.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPembeli.Button4Click(Sender: TObject);
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
      FID             := lPembeli.ID;

      edKode.Text     := lPembeli.Kode;
      edNama.Text     := lPembeli.Nama;
      memAlamat.Text   := lPembeli.Alamat;
    end;

  finally
    lPembeli.Free;
  end;

end;
// Tombol Baru diklik
procedure TfrmPembeli.Button5Click(Sender: TObject);
begin
  FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  memAlamat.Text := '';
end;

procedure TfrmPembeli.Button6Click(Sender: TObject);
var
  lpembeli: TPembeli;
begin
  lpembeli := TPembeli.Create;
  lpembeli.LoadByID(FID);

  if lpembeli.Hapus then
  begin
    LoadDataPembeli;
    ShowMessage('Berhasil Hapus');
    Button5.Click;
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
  if (memAlamat.Text = '') then
  begin
    str := str + 'Alamat belum diisi.';
    memAlamat.SetFocus;
  end;
  str := StringReplace(StringReplace(str, '', ' ', [rfReplaceAll]), #13, ' ', [rfReplaceAll]);

  if str <> '' then
  begin
    showMessage(str);
    exit;
  end;

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

