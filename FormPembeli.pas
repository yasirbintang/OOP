unit FormPembeli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ClassPembeli, uADStanIntf, uADStanOption,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADCompClient, DB, uConnection, uADPhysODBCBase, uADPhysMSSQL,
  DBClient, Provider, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADCompDataSet;

type
  TfrmPembeli = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edKode: TEdit;
    edNama: TEdit;
    edAlamat: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADPhysMSSQLDriverLink1: TADPhysMSSQLDriverLink;
    Button4: TButton;
    edID: TEdit;
    Button5: TButton;
    Button6: TButton;
    con2: TADConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    FID: Integer;
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
    lPembeli.Kode     := edKode.Text;
    lPembeli.Nama     := edNama.Text;
    lPembeli.Alamat   := edAlamat.Text;
    lPembeli.ID       := FID;

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

procedure TfrmPembeli.Button3Click(Sender: TObject);
begin
  if TConnection.ConnectDB('belajar', 'MSSQL', '192.168.0.62','belajar_oop', 'sa', 'it@3Serangkai', '1433') then
  begin
    ShowMessage('Berhasil Membuat koneksi DB');
  end;
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
      edAlamat.Text   := lPembeli.Alamat;
    end;

  finally
    lPembeli.Free;
  end;

end;

procedure TfrmPembeli.Button5Click(Sender: TObject);
begin
  FID           := 0;

  edKode.Text   := '';
  edNama.Text   := '';
  edAlamat.Text := '';
end;

procedure TfrmPembeli.Button6Click(Sender: TObject);
var
  lpembeli: TPembeli;
begin
  lpembeli := TPembeli.Create;
  lpembeli.LoadByID(FID);

  if lpembeli.Hapus then
  begin
    ShowMessage('Berhasil Hapus');
    Button5.Click;
  end;

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
  if (edAlamat.Text = '') then
  begin
    str := str + 'Alamat belum diisi.';
    edAlamat.SetFocus;
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

