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
  ClassPembeli, classbarang, cxTextEdit, cxDropDownEdit;

type
  TfrmPembelian = class(TForm)
    Baru: TBitBtn;
    btnhapus: TButton;
    btnsimpan: TButton;
    con1: TADConnection;
    cxgrd1: TcxGrid;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    cxGridColHarga: TcxGridColumn;
    cxGridColID: TcxGridColumn;
    cxGridColKodeBarang: TcxGridColumn;
    cxGridColNamaBarang: TcxGridColumn;
    cxGridColQty: TcxGridColumn;
    cxGridColTotal: TcxGridColumn;
    cxGridTablePembelianItem: TcxGridTableView;
    DSbelian: TClientDataSet;
    DSpembelian: TDataSource;
    dtptanggal: TDateTimePicker;
    edkode: TEdit;
    edNama: TEdit;
    ednopembelian: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    lbl1: TLabel;
    pnlAtas: TPanel;
    pnlButon: TPanel;
    procedure btnsimpanClick(Sender: TObject);
    procedure cxGridColKodeBarangPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColKodeBarangPropertiesValidate(Sender: TObject; var
        DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColQtyPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edkodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FPembeli: Tpembeli;
    function GetPembeli: Tpembeli;
    property Pembeli: Tpembeli read GetPembeli write FPembeli;
  end;

var
  frmPembelian: TfrmPembelian;

implementation

uses
  ClassPembelian0;
{$R *.dfm}

procedure TfrmPembelian.btnsimpanClick(Sender: TObject);
var
  I              : Integer;
  lBarang        : TBarang;
  lPembelian     : TPembelian;
  lPembelianItem : TPembelianItem;
begin
  lPembelian         := TPembelian.Create;
  lPembelian.noBukti := ednopembelian.Text;
  lPembelian.Pembeli := Pembeli;
  lPembelian.Tgl     := dtptanggal.Date;

  // cxGrid: Writable field hanya KodeBarang & Qty, lainnya read-only

  for I := 0 to cxGridTablePembelianItem.DataController.RecordCount - 1 do begin
    lPembelianItem := TPembelianItem.Create;
    lBarang        := TBarang.Create;
    lBarang.LoadByID(i+1);

    lPembelianItem.Barang := lBarang;
    lPembelianItem.harga  := cxGridTablePembelianItem.DataController.Values[i, cxGridColHarga.Index];
    lPembelianItem.Qty    := cxGridTablePembelianItem.DataController.Values[i, cxGridColQty.Index];
    lPembelianItem.Total  := cxGridTablePembelianItem.DataController.Values[i, cxGridColTotal.Index];

    lPembelian.PembelianItems.Add(lPembelianItem);

  end;

  if lPembelian.Simpan then begin
      ShowMessage('Berhasil Simpan');
  end else begin
//      ShowMessage('Gagal Simpan');
      btnsimpan.Enabled:=False;
  end;
end;

// Cari Nama Pembeli: Ketik Kode Pembeli kemudian tekan tombol Enter
procedure TfrmPembelian.cxGridColKodeBarangPropertiesEditValueChanged(
  Sender: TObject);
var
  iColumn: Integer;
  iRecord: Integer;
  sKode: string;
begin

end;

procedure TfrmPembelian.cxGridColKodeBarangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  iRecord: Integer;
  lBarang: TBarang;
  sKode: string;
begin
  iRecord := cxGridTablePembelianItem.DataController.FocusedRecordIndex;
//  iColumn := cxGridColKodeBarang.Index;

  sKode := DisplayValue;
  lBarang := TBarang.Create;
  try
    lBarang.LoadByID(1);
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColNamaBarang.Index] := lBarang.Nama;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColQty.Index] := 1;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColHarga.Index] := lBarang.Harga;
  finally
    lBarang.Free;
  end;



end;

procedure TfrmPembelian.cxGridColQtyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // hitung total
//  Error := True;
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
