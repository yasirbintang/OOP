unit ClassPembelian0;

interface
uses
  uConnection, SysUtils, ClassPembeli, ClassBarang;

type
  TPembelian = class(TObject)
  private
    FID: Integer;
    FnoBukti: String;
    FPembeli: TPembeli;
    FTgl: TDateTime;
  public
    function Hapus: Boolean;
    function Simpan: Boolean;
    property ID: Integer read FID write FID;
    property noBukti: String read FnoBukti write FnoBukti;
    property Pembeli: TPembeli read FPembeli write FPembeli;
    property Tgl: TDateTime read FTgl write FTgl;
  end;

  TPembelianItem = class(TObject)
  private
    FitemID: Integer;
    FBarang: TBarang;
    Fharga: double;
    FQty: Integer;
    Ftotal: double;
  public
    property itemID: Integer read FitemID write FitemID;
    property Barang: TBarang read FBarang write FBarang;
    property harga: double read Fharga write Fharga;
    property Qty: Integer read FQty write FQty;
    property Total: double read FTotal write FTotal;
  end;

implementation

function TPembelian.Hapus: Boolean;
var
  sSql: string;
begin
  Result := False;
  sSql = 'hapus tpembelian where id = ' + FID;
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
begin
  Result := False;

  // SQL utk insert tpembelian
  // SQL u/ hapus tpembelian item
  // sql u/ insert tpembelianiem (looping)

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
    sSQL := 'insert into tpembelian (id, no_bukti, tanggal, pembeli) values'+
      IntToStr(FID)                                + ', ' +
      QuotedStr(nobukti)                           + ', ' +
      QuotedStr(FormatDateTime('yyyy/mm/dd', tgl)) + ', ' +
      IntToStr(Pembeli.ID)                         + ')';
    end else begin
      sSQL := 'update table tpembelian set '                         +
        'no_bukti = ' + QuotedStr(nobukti)                           +
        'tanggal = '  + QuotedStr(FormatDateTime('yyyy/mm/dd', tgl)) +
        'pembeli = '  + IntToStr(Pembeli.ID)                         +
        'where id = ' + IntToStr(FID);
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


{Procedure
  Buat Pembelian baru
  Ubah Pembelian
  Hapus Pembelian

Function
  Cari Pembelian berdasarkan
  1 Kode Pembelian
  2 Tanggal Pembelian
  3 Pembeli: Kode/Nama
  4 Barang: Kode/Nama

  Ubah Pembelian yg sebelumnya diperoleh dari pencarian
}
end.
