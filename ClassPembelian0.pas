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
    function GetPembelianItems: TObjectList<TPembelianItem>;
  public
    function Hapus: Boolean;
    function Simpan: Boolean;
    property ID: Integer read FID write FID;
    property noBukti: String read FnoBukti write FnoBukti;
    property Pembeli: TPembeli read FPembeli write FPembeli;
    property PembelianItems: TObjectList<TPembelianItem> read GetPembelianItems
        write FPembelianItems;
    property Tgl: TDateTime read FTgl write FTgl;
  end;

  TPembelianItem = class(TObject)
  private
    FitemID: Integer;
    FBarang: TBarang;
    Fharga: double;
    FHeader_ID: Integer;
    FQty: Integer;
    Ftotal: double;
  public
    destructor Destroy; override;
    function GenerateSQL(AHeader_ID : Integer): string;
    property itemID: Integer read FitemID write FitemID;
    property Barang: TBarang read FBarang write FBarang;
    property harga: double read Fharga write Fharga;
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property Qty: Integer read FQty write FQty;
    property Total: double read FTotal write FTotal;
  end;

implementation

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
  sSql := 'hapus tpembelian where id = ' + IntToStr(FID);
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
      'tanggal = '  + QuotedStr(FormatDateTime('yyyy/mm/dd', tgl)) +
      'pembeli = '  + IntToStr(Pembeli.ID)                         +
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
  sSQL := 'insert into tpembelianitem (header_id, barang, qty, harga, total) values ('+
      IntToStr(AHeader_ID)                         + ', ' +
      IntToStr(Barang.ID)                           + ', ' +
      IntToStr(Qty) + ', ' +
      FloatToStr(harga) + ', ' +
      FloatToStr(Total) + ');';

  Result := sSQL;
end;
{
Procedure
  1. Create Pembelian
     1a. Looping:
           buat PembelianItem baru
  2. Update Pembelian
     2a. Looping:
           Dari header_id yg ingin diupdate, hapus PembelianItem yg lama
           kemudian tambahkan pembelianitem baru.
  3. Delete Pembelian
     3a. Looping:
           hapus PembelianItemsesuai header_id yg dipilih

Function
  1. Cari Pembelian berdasarkan
   1a. Kode Pembelian
   1b. Kode Pembeli
}
end.
