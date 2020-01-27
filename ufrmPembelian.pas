unit ufrmPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, DB, uADCompClient, Buttons, Grids, DBGrids, DBClient, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView, cxClasses, cxGridLevel, cxGrid, cxCurrencyEdit,
  ClassPembeli, classbarang;

type
  TfrmPembelian = class(TForm)
    con1: TADConnection;
    DSpembelian: TDataSource;
    DSbelian: TClientDataSet;
    pnlAtas: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    Label2: TLabel;
    ednopembelian: TEdit;
    edkode: TEdit;
    dtptanggal: TDateTimePicker;
    edNama: TEdit;
    pnlButon: TPanel;
    btnsimpan: TButton;
    btnhapus: TButton;
    Baru: TBitBtn;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxgrd1: TcxGrid;
    cxGridTablePembelianItem: TcxGridTableView;
    cxGridColKodeBarang: TcxGridColumn;
    cxGridColNamaBarang: TcxGridColumn;
    cxGridColQty: TcxGridColumn;
    cxGridColHarga: TcxGridColumn;
    cxGridColTotal: TcxGridColumn;
    cxGridColID: TcxGridColumn;
    procedure btnsimpanClick(Sender: TObject);
    procedure edkodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPembeli: Tpembeli;
    function GetPembeli: Tpembeli;
    property Pembeli: Tpembeli read GetPembeli write FPembeli;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembelian: TfrmPembelian;

implementation

uses
  ClassPembelian0;

{$R *.dfm}

procedure TfrmPembelian.btnsimpanClick(Sender: TObject);
var
  I: Integer;
  lBarang: tbarang;
  lPembelian: TPembelian;
  lPembelianItem: TPembelianItem;
begin
  lPembelian := TPembelian.Create;
  lPembelian.noBukti := ednopembelian.Text;
  lPembelian.Pembeli := Pembeli;
  //dst ....


  for I := 0 to cxGridTablePembelianItem.DataController.RecordCount - 1 do
  begin
    lPembelianItem := TPembelianItem.Create;
    lBarang := TBarang.Create;
    lBarang.LoadByID(i+1);

    lPembelianItem.Barang := lBarang;
    lPembelianItem.harga  := cxGridTablePembelianItem.DataController.Values[i, cxGridColHarga.Index];
    lPembelianItem.Qty    := cxGridTablePembelianItem.DataController.Values[i, cxGridColQty.Index];
    lPembelianItem.Total  := cxGridTablePembelianItem.DataController.Values[i, cxGridColTotal.Index];

    lPembelian.PembelianItems.Add(lPembelianItem);

  end;

  if lPembelian.Simpan then begin
//      ShowMessage('Berhasil Simpan')
      btnsimpan.Enabled:=False;
    end else begin
      ShowMessage('Gagal Simpan');
    end;

end;

procedure TfrmPembelian.edkodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
if Key = VK_RETURN then begin
     Pembeli.LoadbyKode(edkode.Text);
     edNama.Text := Pembeli.Nama;
  end
end;

function TfrmPembelian.GetPembeli: Tpembeli;
begin
  if FPembeli = nil then
    FPembeli := TPembeli.Create;
   Result := FPembeli;
end;

end.
