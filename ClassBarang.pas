unit ClassBarang;

interface
uses
  uConnection,  sysutils;

type
  TBarang = class
  private
    FID: Integer;
    FKode: String;
    FNama: String;
    FHarga: double;
  public
    constructor Create; reintroduce;
    function Hapus: Boolean;
    function IsKodeSudahAda(aKode : String; aID : Integer): Boolean;
    procedure LoadByID(AID : Integer);
    procedure LoadbyKode(AKode : String);
    function Simpan: Boolean;
//    function ToString: string;
    property ID: Integer read FID write FID;
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Harga: double read FHarga write FHarga;
  end;

implementation

uses
  DBClient;


constructor TBarang.Create;
begin
  inherited;
  Self.ID := 0;
end;

function TBarang.Hapus: Boolean;
var
  sSQL: string;
begin
  Result := False;

  sSQL := 'delete tbarang where id = ' + IntToStr(id);

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

function TBarang.IsKodeSudahAda(aKode : String; aID : Integer): Boolean;
var
  sSQL: string;
  lcds: TClientDataSet;
begin
  Result := False;
  sSQL := 'select id from TBarang ' +
          ' where kode = ' + QuotedStr(AKode) +
          ' and id <> ' + IntToStr(aID);

  lcds := TConnection.OpenQuery(sSQL);
  try
    if lcds.IsEmpty then
      Exit;
  finally
    lcds.Free;
  end;
  Result := True;

end;

procedure TBarang.LoadByID(AID : Integer);
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := ' select * from tbarang ' +
          ' where id = ' + IntToStr(AID);

  lcds := TConnection.OpenQuery(sSQL);
  try
    while not lcds.Eof do begin
      id      := lcds.FieldByName('id').AsInteger;
      kode    := lcds.FieldByName('kode').AsString;
      nama    := lcds.FieldByName('nama').AsString;
      harga   := lcds.FieldByName('harga').AsFloat;

      lcds.Next;
    end;
  finally
    lcds.Free;
  end;

end;
procedure TBarang.LoadbyKode(AKode : String);
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  sSQL := ' select * from tbarang ' +
          ' where kode = ' + QuotedStr(Akode);

  lcds := TConnection.OpenQuery(sSQL);
  try
    while not lcds.Eof do begin
      id      := lcds.FieldByName('id').AsInteger;
      kode    := lcds.FieldByName('kode').AsString;
      nama    := lcds.FieldByName('nama').AsString;
      harga   := lcds.FieldByName('harga').AsFloat;
      lcds.Next;
    end;
  finally
    lcds.Free;
  end;
end;

function TBarang.Simpan: Boolean;
var
  sSQL: string;
begin
  Result := False;

  if ID = 0 then // data baru
  begin
     //generate id baru select max(id) AS ID_TERAKHIR from tpembeli;
    sSQL := 'select max(id) AS ID_TERAKHIR from tbarang';

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





    sSQL := 'insert into tbarang (id,kode,nama,harga) values (' +
          IntToStr(ID) + ',' +
          QuotedStr(Kode) + ',' +
          QuotedStr(Nama) + ',' +
          FloatToStr(Harga) + ')';
  end else begin // update
    sSQL:= 'update tbarang set ' +
           ' kode = ' + QuotedStr(Kode) + ',' +
           ' nama = ' + QuotedStr(Nama) + ',' +
           ' harga = ' + FloatToStr(Harga) +
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

{function TBarang.ToString: string;
begin
  Result := 'Data Pembeli' + #13 +
            '---------------------' + #13 +
            ' Kode : ' + Self.Kode;
end;}

end.
