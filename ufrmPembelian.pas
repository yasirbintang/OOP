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
    edNoBukti: TEdit;
    edPembeliKode: TEdit;
    edPembeliNama: TEdit;
    DSbelian: TClientDataSet;
    DSpembelian: TDataSource;
    dtptanggal: TDateTimePicker;
    lblNoPembelian: TLabel;
    lblPembeli: TLabel;
    lblTgl: TLabel;
    pnlAtas: TPanel;
    pnlButon: TPanel;
    procedure BaruClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure cxGridColKodeBarangPropertiesValidate(Sender: TObject; var
        DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColQtyPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edNoBuktiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPembeliKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FID: Integer;
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

procedure TfrmPembelian.BaruClick(Sender: TObject);
begin
  FID := 0;
  edNoBukti.Text := '';
  dtptanggal.date := Now;
  edPembeliKode.Text := '';
  edPembeliNama.Text := '';

  cxGridTablePembelianItem.DataController.RecordCount := 0;
end;

procedure TfrmPembelian.btnhapusClick(Sender: TObject);
var
  lPembelian: TPembelian;

begin
  lPembelian := TPembelian.Create;
  lPembelian.LoadByID(FID);
  if Dialogs.MessageDlg('Hapus?',mtConfirmation,
      [mbYes, mbNo], 0, mbYes) = mrYes then begin
    lPembelian.Hapus;
    if lPembelian.ID > 0 then begin
      ShowMessage(lPembelian.noBukti + ' Berhasil dihapus');
    end else begin
      ShowMessage(lPembelian.noBukti + ' Gagal dihapus');
    end;
  end;
end;

procedure TfrmPembelian.btnsimpanClick(Sender: TObject);
var
  I              : Integer;
  lPembelian     : TPembelian;
  lPembelianItem : TPembelianItem;
begin
  lPembelian         := TPembelian.Create;
  lPembelian.ID      := FID;
  lPembelian.noBukti := edNoBukti.Text;
  lPembelian.Pembeli.LoadbyKode(edPembeliKode.Text);

  lPembelian.Tgl     := dtptanggal.Date;

  for I := 0 to cxGridTablePembelianItem.DataController.RecordCount - 1 do begin
    lPembelianItem := TPembelianItem.Create;
    lPembelianItem.Barang.LoadbyKode(cxGridTablePembelianItem.DataController.Values[i, cxGridColKodeBarang.index]);
    lPembelianItem.harga  := cxGridTablePembelianItem.DataController.Values[i, cxGridColHarga.Index];
    lPembelianItem.Qty    := cxGridTablePembelianItem.DataController.Values[i, cxGridColQty.Index];
    lPembelianItem.Total  := cxGridTablePembelianItem.DataController.Values[i, cxGridColTotal.Index];

    lPembelian.PembelianItems.Add(lPembelianItem);

  end;

  if lPembelian.Simpan then begin
      ShowMessage('Berhasil Simpan');
  end else begin
      ShowMessage('Gagal Simpan');
//      btnsimpan.Enabled:=False;
  end;
end;

procedure TfrmPembelian.cxGridColKodeBarangPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  iRecord : Integer;
  lBarang : TBarang;
  sKode   : string;
begin
  iRecord := cxGridTablePembelianItem.DataController.FocusedRecordIndex;
  sKode   := DisplayValue;
  lBarang := TBarang.Create;
  try
    lBarang.LoadByKode(sKode);
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColNamaBarang.Index] := lBarang.Nama;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColQty.Index]        := 1;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColHarga.Index]      := lBarang.Harga;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColTotal.Index]      := lBarang.Harga;
  finally
    lBarang.Free;
  end;

end;

procedure TfrmPembelian.cxGridColQtyPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  dTotal  : Double;
  iRecord : Integer;
  iQty    : Integer;
  vHarga  : Variant;
begin
  if (DisplayValue = '') or VarIsNull(DisplayValue) then Exit;
  iRecord := cxGridTablePembelianItem.DataController.FocusedRecordIndex;
  iQty    := StrToInt(DisplayValue);
  if not (iQty >= 1) then ShowMessage('Hanya Bilangan Positif');

  vHarga  := cxGridTablePembelianItem.DataController.GetValue(iRecord, cxGridColHarga.Index);
  if VarIsNull(vHarga) then Exit;

  dTotal  := iQty * vHarga;
  cxGridTablePembelianItem.DataController.SetValue(iRecord, cxGridColTotal.Index, dTotal);
end;

procedure TfrmPembelian.edNoBuktiKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  lPembelian: Tpembelian;
  //lpembelianitem: TPembelianItem;
  I, II: integer;
begin
  if Key = VK_RETURN then begin
     lPembelian := TPembelian.Create;
     try
       lPembelian.LoadbyNoBukti(edNoBukti.Text);
       if lPembelian.noBukti  <> '' then begin
         FID := lPembelian.ID;
         edNoBukti.Text := lPembelian.noBukti;
         dtptanggal.date := lPembelian.Tgl;

         Pembeli.LoadbyKode(lPembelian.Pembeli.Kode);
         edPembeliKode.Text := lPembelian.Pembeli.Kode;
         edPembeliNama.Text := lPembelian.Pembeli.Nama;

         II := lPembelian.PembelianItems.Count - 1;
         cxGridTablePembelianItem.DataController.RecordCount := 0;

         for i := 0 to ii do begin
           cxGridTablePembelianItem.DataController.AppendRecord;
             cxGridTablePembelianItem.DataController.Values[i, cxGridColKodeBarang.Index]
             := lpembelian.PembelianItems[i].Barang.Kode;
           cxGridTablePembelianItem.DataController.Values[i, cxGridColNamaBarang.Index]
             :=lpembelian.PembelianItems[i].Barang.Nama;
           cxGridTablePembelianItem.DataController.Values[i, cxGridColQty.Index]
             :=lpembelian.PembelianItems[i].Qty;
           cxGridTablePembelianItem.DataController.Values[i, cxGridColHarga.Index]
             :=lPembelian.PembelianItems[i].harga;
           cxGridTablePembelianItem.DataController.Values[i, cxGridColTotal.Index]
             :=lPembelian.PembelianItems[i].Total;
         end;
       end;
     finally
       lPembelian.Free;
     end;
  end;
end;

procedure TfrmPembelian.edPembeliKodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then begin
     Pembeli.LoadbyKode(edPembeliKode.Text);
     edPembeliNama.Text := Pembeli.Nama;
  end
end;

function TfrmPembelian.GetPembeli: Tpembeli;
begin
  if FPembeli = nil then
    FPembeli := TPembeli.Create;

   Result := FPembeli;
end;

end.

