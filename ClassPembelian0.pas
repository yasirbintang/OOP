unit ClassPembelian0;

interface
uses
  uConnection, SysUtils, ClassPembeli, ClassBarang, Generics.Collections;

type
  TPembelianItem = class;

  TPembelian = class(TObject)
  private
    FID: Integer;
    FnoBukti: String;
    FPembeli: TPembeli;
    FPembelianItems: TObjectList<TPembelianItem>;
    FTgl: TDateTime;
    function GetPembeli: TPembeli;
    function GetPembelianItems: TObjectList<TPembelianItem>;
  public
    function Hapus: Boolean;
    function isKodesudahada(skode : String; aID : Integer): boolean;
    procedure LoadByID(AID : Integer);
    procedure LoadbyNoBukti(AKode : String);
    function Simpan: Boolean;
    property ID: Integer read FID write FID;
    property noBukti: String read FnoBukti write FnoBukti;
    property Pembeli: TPembeli read GetPembeli write FPembeli;
    property PembelianItems: TObjectList<TPembelianItem> read GetPembelianItems
        write FPembelianItems;
    property Tgl: TDateTime read FTgl write FTgl;
  end;

  TPembelianItem = class(TObject)
  private
    FBarang: TBarang;
    Fharga: double;
    FHeader_ID: Integer;
    FitemID: Integer;
    FQty: Integer;
    FTotal: double;
    function GetBarang: TBarang;
  public
    destructor Destroy; override;
    function GenerateSQL(AHeader_ID : Integer): string;
    property Barang: TBarang read GetBarang write FBarang;
    property harga: double read Fharga write Fharga;
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property itemID: Integer read FitemID write FitemID;
    property Qty: Integer read FQty write FQty;
    property Total: double read FTotal write FTotal;
  end;

implementation
uses
DBClient;

function TPembelian.GetPembeli: TPembeli;
begin
  if FPembeli = nil then
    FPembeli := TPembeli.Create;

  Result := FPembeli;
end;

function TPembelian.GetPembelianItems: TObjectList<TPembelianItem>;
begin
  if FPembelianItems = nil then
    FPembelianItems := TObjectList<TPembelianItem>.Create;

  Result := FPembelianItems;
end;

function TPembelian.Hapus: Boolean;
var
  sSql: string;
begin
  Result := False;
  sSql := 'delete tpembelian where id = ' + IntToStr(FID) + ';';
  sSQLYasir := 'delete tpembelianitem where header_id = ' + IntToStr(FID)+ ';';

  sSql := sSql + sSQLYasir;

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

function TPembelian.isKodesudahada(skode : String; aID : Integer): boolean;
var
  lcds: TClientDataSet;
  sSQL: string;
begin
  Result := False;
  sSQL := 'select id from tpembelian' +
    ' where no_bukti = ' + QuotedStr(sKode) +
    ' and id <> '    + IntToStr(aID) + ';';

  lcds := TConnection.OpenQuery(sSQL);
  try
    if lcds.IsEmpty then Exit;
  finally
    lcds.Free;
  end;
  Result := True;
end;

procedure TPembelian.LoadByID(AID : Integer);
var
  lcds: TClientDataSet;
  lPembelianItem: TPembelianItem;
  sSQL: string;
begin
   sSQL := ' select * from tpembelian ' +
          ' where Id = ' + IntToStr(AID) + ';';

  lcds := TConnection.OpenQuery(sSQL);
  try
    while not lcds.Eof do begin
      noBukti       := lcds.FieldByName('No_Bukti').AsString;
      Tgl           := lcds.FieldByName('Tanggal').AsDateTime;
      Self.ID       := lcds.FieldByName('ID').AsInteger;

      Pembeli.LoadByID(lcds.FieldByName('Pembeli').AsInteger);

      lcds.Next;
    end;
  finally
    lcds.Free;
  end;

  sSQL := 'select * from tpembelianitem' +
          ' where header_id = ' + IntToStr(Self.ID);
  lcds := TConnection.OpenQuery(sSQL);
  try
    Self.PembelianItems.Clear;
    while not lcds.Eof do
    begin
      lPembelianItem := TPembelianItem.Create;

      lPembelianItem.Barang.LoadByID(lcds.FieldByName('barang').AsInteger);
      lPembelianItem.Header_ID  := Self.ID;
      lPembelianItem.harga      := lcds.FieldByName('harga').AsFloat;
      lPembelianItem.Qty        := lcds.FieldByName('Qty').AsInteger;
      lPembelianItem.Total      := lPembelianItem.harga * lPembelianItem.Qty;

      Self.PembelianItems.Add(lPembelianItem);

      lcds.Next;
    end;
  finally
    lcds.Free;
  end;
end;

procedure TPembelian.LoadbyNoBukti(AKode : String);
var
  lcds: TClientDataSet;
  sSQL: string;
begin
   sSQL := ' select ID from tpembelian ' +
          ' where no_bukti = ' + QuotedStr(AKode);

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

function TPembelian.Simpan: Boolean;
var
  sSQL: string;
  sSQLTambahan: string;
  I: Integer;
begin
  Result := False;
  if ID = 0 then begin
  sSQL := 'select max(id) AS ID_TERAKHIR from tpembelian';
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

  sSQL := 'insert into tpembelian (id, no_bukti, tanggal, pembeli) values('+
    IntToStr(FID)                                + ', ' +
    QuotedStr(nobukti)                           + ', ' +
    QuotedStr(FormatDateTime('yyyy/mm/dd', tgl)) + ', ' +
    IntToStr(Pembeli.ID)                         + ');';
  end else begin
    sSQL := 'update table tpembelian set '                         +
      'no_bukti = ' + QuotedStr(nobukti)                           +
      ',tanggal = '  + QuotedStr(FormatDateTime('yyyy/mm/dd', tgl)) +
      ',pembeli = '  + IntToStr(Pembeli.ID)                         +
      'where id = ' + IntToStr(FID) + ';';
  end;

  sSQLTambahan := 'delete from tpembelianitem where header_id = ' +
  IntToStr(FID) + ';';
  sSQL := sSQL + sSQLTambahan;

  for I := 0 to PembelianItems.Count - 1 do begin
    sSQL := sSQL + PembelianItems[i].GenerateSQL(FID);
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

destructor TPembelianItem.Destroy;
begin
  inherited;
  FreeAndNil(FBarang);
end;

function TPembelianItem.GenerateSQL(AHeader_ID : Integer): string;
var
  sSQL: string;
begin
  sSQL := 'insert into tpembelianitem '+
      '(header_id, barang, qty, harga, total) values ('+
      IntToStr(AHeader_ID) + ', ' +
      IntToStr(Barang.ID)  + ', ' +
      IntToStr(Qty)        + ', ' +
      FloatToStr(harga)    + ', ' +
      FloatToStr(Total)    + ');';

  Result := sSQL;
end;

function TPembelianItem.GetBarang: TBarang;
begin
  if FBarang = nil then
    FBarang := TBarang.Create;

  Result := FBarang;
end;

end.
