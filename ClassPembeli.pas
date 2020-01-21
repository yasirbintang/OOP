unit ClassPembeli;

interface
type
  TPembeli = class
  private
    FID: Integer;
    FKode: String;
    FNama: String;
    FAlamat: String;
  public
    constructor Create; reintroduce;
    function Simpan: Boolean;
    function ToString: string;
    property ID: Integer read FID write FID;
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Alamat: String read FAlamat write FAlamat;
  end;



implementation

constructor TPembeli.Create;
begin
  inherited;
  Self.ID := 0;
end;

function TPembeli.Simpan: Boolean;
begin
  Result := False;
end;

function TPembeli.ToString: string;
begin
  Result := 'Data Pembeli' + #13 +
            '---------------------' + #13 +
            ' Kode : ' + Self.Kode;
end;

end.

