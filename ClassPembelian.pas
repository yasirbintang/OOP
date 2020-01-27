unit ClassPembelian;

interface
uses
  uConnection, SysUtils;

  type
  tPembelian = class
  private
    FID: Integer;
    FnoBukti: string;
    Ftgl: TDateTime;
    FPembeli: string;
  public
  end;

implementation
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
