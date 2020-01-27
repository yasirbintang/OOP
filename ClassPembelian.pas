unit ClassPembelian;

interface
uses
  uConnection, SysUtils, ClassPembeli;

  type
  TPembelian = class
  private
    FID: Integer;
    FPembeli: TPembeli;
  public
    function Simpan: Boolean;
    property ID: Integer read FID write FID;
    property Pembeli: TPembeli read FPembeli write FPembeli;
  end;

implementation

function TPembelian.Simpan: Boolean;
var
  sSQL: string;
begin
  Result := False;

  // SQL utk insert tpembelian
  // SQL u/ hapus tpembelian item
  // sql u/ insert tpembelianiem (looping)

  //sSQL := '';


  // TODO -cMM: TPembelian.Simpan default body inserted
end;

end.
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
