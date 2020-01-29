unit classbrg;

interface
type
  TBarang=class
    private
      ID: Integer;
      Kode: String;
      Nama: String;
      Harga: string;
    public

      procedure setID(a:Integer);
      procedure setKode(b: string);
      procedure setNama(c: string);
      procedure setHarga(d: string);
      function getID:integer;
      function getKode:string;
      function getNama:string;
      function getHarga:string;

  end;
implementation

procedure TBarang.setID(a: Integer);
begin
  ID:=a;
end;

procedure TBarang.setKode(b: string);
begin
  Kode:=b;
end;

procedure TBarang.setNama(c: string);
begin
  Nama:=c;
end;

Procedure TBarang.setHarga(d: string);
begin
  Harga:=d;
end;

function TBarang.getID;
begin
  result:=ID;
end;

function TBarang.getKode;
begin
  result:=Kode;
end;

Function TBarang.getNama;
begin
  result:=Nama;
end;

function TBarang.getHarga;
begin
  result:=Harga;
end;


end.
