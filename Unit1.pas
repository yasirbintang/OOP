unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables,classbrg;

type
  TfrmBarang = class(TForm)
    Label1: TLabel;
    edID: TEdit;
    Label2: TLabel;
    edKode: TEdit;
    Label3: TLabel;
    edNama: TEdit;
    Label4: TLabel;
    edHarga: TEdit;
    Button2: TButton;
    Button3: TButton;
    Table1: TTable;

    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FHarga: string;
    FID: Integer;
    FKode: string;
    FNama: string;
    property Harga: string read FHarga write FHarga;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write FNama;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBarang: TfrmBarang;
  Barang: TBarang;

implementation

{$R *.dfm}

procedure TfrmBarang.Button2Click(Sender: TObject);
begin
  Barang:= TBarang.Create;
  barang.setID(strtoint(edit1.text));
  barang.setKode(edit2.Text);
  barang.setNama(edit3.text);
  barang.setHarga(edit4.text);
end;

procedure TfrmBarang.Button3Click(Sender: TObject);
begin

  showmessage('ID : '      + IntToStr(Barang.getID) +#13#10+
              'Kode : '    + barang.getKode  +#13#10+
              'Nama : '    + barang.getNama  +#13#10+
              'Harga : '   + barang.getHarga);

  end;

end.
