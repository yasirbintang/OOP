unit ClassPembelianItem_Y;

interface
uses
  uConnection, SysUtils, ClassBarangBaru, ClassPembeli;

type
  TPembelianItemY = class(Tobject)
    private
      FID : Integer;
      FBarang: TBarang;
      FQty : Integer;
      FHarga: double;
      FTotal : Double;
//      procedure SetHarga(const Value: Integer);
  public
      constructor Create; reintroduce;

      property Barang: TBarang read FBarang write FBarang;
      property Harga: double read FHarga write FHarga;
      property ID: Integer read FID write FID;
      property Qty: integer read FQty write FQty;
      property Total: double read FTotal write FTotal;

  end;

  TPembelianY = class(TObject)
  private
    FID: Integer;
    FNoBukti: string;
    FPembeli: TPembeli;
    FTanggal: Tdatetime;
  public
    property ID: Integer read FID write FID;
    function Simpan: Boolean;
    property NoBukti: string read FNoBukti write FNoBukti;
    property Pembeli: TPembeli read FPembeli write FPembeli;
    property Tanggal: Tdatetime read FTanggal write FTanggal;
  end;


implementation
uses
  DBClient;

constructor TPembelianItemY.Create;
begin
  inherited;
//  Self.ID := 0;

end;

function TPembelianY.Simpan: Boolean;
var
  sSQL : string;

begin
  Result := False;
  if ID = 0 then
  begin
    sSQL := 'insert into TPembelian (id, No_Bukti, Tanggal, Pembeli) values ('+
            IntToStr(ID) + ',' +
            QuotedStr(NoBukti) + ',' +
            QuotedStr(FormatDateTime('yyyy/mm/dd',Tanggal)) + ',' +
            IntToStr(Pembeli.ID) + ')';

  end else begin
   sSQL:= 'update TPembelian set ' +
           ' No_Bukti = ' + QuotedStr(NoBukti) + ',' +
           ' Tanggal = ' + DateToStr(Tanggal) + ',' +
           ' Pembeli = ' + IntToStr(Pembeli.ID) + ',' +
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
