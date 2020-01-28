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
    procedure BaruClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure edkodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridColKodeBarangPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColKodeBarangPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColQtyPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
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

procedure TfrmPembelian.BaruClick(Sender: TObject);
begin
  ednopembelian.Text := '';
  edkode.Text := '';
  edNama.Text := '';

  with cxGridTablePembelianItem.DataController do
  begin
    BeginUpdate;
    try
      while RecordCount > 0 do
      DeleteRecord(0);
    finally
      EndUpdate;
    end;
  end;

end;

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
  // iColumn := cxGridColKodeBarang.Index;

  sKode := DisplayValue;
  lBarang := TBarang.Create;
  try
    lBarang.LoadByCode(sKode);

    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColNamaBarang.Index]  := lBarang.Nama;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColQty.Index]         := 1;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColHarga.Index]       := lBarang.Harga;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColTotal.Index]       := lBarang.Harga;
  finally
    lBarang.Free;
  end;

end;

procedure TfrmPembelian.cxGridColQtyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  dHarga: Double;
  dQty: Double;
  sqty :string;
  dTotal : double;
  iRecord : Integer;
begin
   sQTy := DisplayValue;
   iRecord := cxGridTablePembelianItem.DataController.FocusedRecordIndex;

   dHarga := cxGridTablePembelianItem.DataController.GetValue(iRecord, cxGridColHarga.Index);
   dQty   := StrToFloat(DisplayValue);

   dTotal := dQty * dHarga;
   cxGridTablePembelianItem.DataController.SetValue(iRecord, cxGridColTotal.Index, dTotal);


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
