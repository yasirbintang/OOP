unit ClassPembeli;

interface
uses
  uConnection,  sysutils;

type
  TPembeli = class
  private
    FID: Integer;
    FKode: String;
    FNama: String;
    FAlamat: String;
  public
    constructor Create; reintroduce;
    function Hapus: Boolean;
    function IsKodeSudahAda(aKode : String; aID : Integer): Boolean;
    procedure LoadByID(AID : Integer);
    function LoadbyKode(AKode : String): Boolean;
    function Simpan: Boolean;
    property ID: Integer read FID write FID;
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Alamat: String read FAlamat write FAlamat;
  end;

implementation

uses
  DBClient;

constructor TPembeli.Create;
begin
  inherited;
  Self.ID := 0;
end;

function TPembeli.IsKodeSudahAda(aKode : String; aID : Integer): Boolean;
var
  sSQL: string;
  lcds: TClientDataSet;
begin
  Result := False;
  sSQL := 'select id from tpembeli ' +
          ' where kode = ' + QuotedStr(AKode) +
          ' and id <> '    + IntToStr(aID);

  lcds := TConnection.OpenQuery(sSQL);
  try
    if lcds.IsEmpty then
      Exit;
  finally
    lcds.Free;
  end;
  Result := True;
end;

function TPembeli.Hapus: Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'delete tpembeli where id = ' + IntToStr(id);

  FDConnection.StartTransaction;
  try
    if TConnection.ExecuteSQL(sSQL) then begin
      FDConnection.Commit;
      Result := True;
    end;
  except
    FDConnection.Rollback;
  end;
end;

procedure TPembeli.LoadByID(AID : Integer);
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := ' select * from tpembeli ' +
          ' where id = ' + IntToStr(AID);
  lcds := TConnection.OpenQuery(sSQL);
  try
    while not lcds.Eof do begin
      id      := lcds.FieldByName('id').AsInteger;
      kode    := lcds.FieldByName('kode').AsString;
      nama    := lcds.FieldByName('nama').AsString;
      alamat  := lcds.FieldByName('alamat').AsString;

      lcds.Next;
    end;
  finally
    lcds.Free;
  end;

end;

function TPembeli.LoadbyKode(AKode : String): Boolean;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := 'select * from tpembeli ' +
          'where kode = '           +
          QuotedStr(Akode)          + ';';

  lcds := TConnection.OpenQuery(sSQL);
  try
    while not lcds.Eof do begin
      LoadByID(lcds.FieldByName('ID').AsInteger);
      lcds.Next;
    end;
  finally
    lcds.Free;
  end;
end;

function TPembeli.Simpan: Boolean;
var
  sSQL: string;
begin
  Result := False;
  // data baru
  if ID = 0 then begin
    sSQL := 'select max(id) AS ID_TERAKHIR from tpembeli';
    with TConnection.OpenQuery(sSQL, nil) do begin
      try
        if not IsEmpty then
          ID := FieldByName('ID_TERAKHIR').AsInteger + 1
        else
          ID := 1;
      finally
        Free;
      end;
    end;

    sSQL := 'insert into tpembeli (id,kode,nama,alamat) values (' +
          IntToStr(ID) + ',' +
          QuotedStr(Kode) + ',' +
          QuotedStr(Nama) + ',' +
          QuotedStr(Alamat) + ')';
  end else begin // update
    sSQL:= 'update tpembeli set ' +
           ' kode = ' + QuotedStr(Kode) + ',' +
           ' nama = ' + QuotedStr(Nama) + ',' +
           ' alamat = ' + QuotedStr(Alamat) +
           ' where id = ' + IntToStr(id);
  end;

  FDConnection.StartTransaction;
  try
    if TConnection.ExecuteSQL(sSQL) then begin
      FDConnection.Commit;
      Result := True;
    end;
  except
    FDConnection.Rollback;
  end;
end;

end.

