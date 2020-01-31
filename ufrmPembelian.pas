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
  ClassPembeli, classbarang, cxTextEdit, cxDropDownEdit, uConnection, StrUtils, ufrmPembeli, cxLabel;

type
  TfrmPembelian = class(TForm)
    edNoBukti : TEdit;
    edPembeliKode : TEdit;
    edPembeliNama : TEdit;
    lblNoPembelian : TLabel;
    lblTgl : TLabel;
    lblPembeli : TLabel;
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
    pnlAtas: TPanel;
    pnlButon: TPanel;

    procedure FormCreate(Sender: TObject);
    procedure autocode;
    procedure BaruClick(Sender: TObject);
    procedure btnhapusClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure cxGridColKodeBarangPropertiesValidate(Sender: TObject; var
        DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridColQtyPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edNoBuktiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPembeliKodeKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FPembeli: Tpembeli;
    FID : Integer;
    Fnopembeli: string;
    function GetPembeli: Tpembeli;
    function IsDataValid: Boolean;
    property Pembeli: Tpembeli read GetPembeli write FPembeli;

  public
    property nopembeli: string read Fnopembeli write Fnopembeli;
  end;

var
  frmPembelian: TfrmPembelian;

implementation

uses
  ClassPembelian0;
{$R *.dfm}

procedure TfrmPembelian.FormCreate(Sender: TObject);
begin
//autocode;

    if edNoBukti.Text = '' then
    begin

       autocode;

    end;

end;


procedure TfrmPembelian.autocode;
var
  hasil, nilai, total : String ;
  i : Integer;
  lcds : TClientDataSet;
  sPrefix: string;
  sSQL : string;

begin
//  lpembelian := TPembelian.Create;
  nilai := '0000';

  sPrefix := 'P/' + FormatDateTime('YYYY/', dtptanggal.Date);

  sSQL := ' select max(no_bukti) as max_no from TPembelian ' +
          ' where no_bukti like ' + QuotedStr(sPrefix + '%'); //memanggil

  lcds := TConnection.OpenQuery(sSQL);

    try
      while not lcds.Eof do begin

      nopembeli := lcds.FieldByName('max_no').AsString;

      edNoBukti.Text := nopembeli;
      lcds.Next;

      hasil := RightStr(nopembeli,4);

      i     := StrToInt(hasil) + 1;

      total := nilai + IntToStr(i);

      ednobukti.Text := sPrefix + RightStr(total,4);

      end;
    finally
      lcds.Free;
    end;
  end;


procedure TfrmPembelian.BaruClick(Sender: TObject);
begin
  ednobukti.Text := '';
  edpembelikode.Text := '';
  edpembelinama.Text := '';

  cxGridTablePembelianItem.DataController.RecordCount := 0;
  autocode;

end;

procedure TfrmPembelian.btnhapusClick(Sender: TObject);
var
  lpembelian : TPembelian;
begin
  lpembelian := TPembelian.Create;
  try
    lpembelian.LoadByID(FID);

    if MessageDlg('Apakah ingin dihapus?',mtConfirmation,mbYesNo,0) = mrYes then
    begin
      if lpembelian.Hapus then
        ShowMessage('Berhasil Hapus');
        Baru.Click;

    end;
  finally
    lpembelian.Free;
  end;
end;

procedure TfrmPembelian.btnsimpanClick(Sender: TObject);
var
  I              : Integer;
  lBarang        : TBarang;
  lPembelian     : TPembelian;
  lPembelianItem : TPembelianItem;
begin
  if not IsDataValid then
    Exit;

  lPembelian         := TPembelian.Create;
  lPembelian.noBukti := edNoBukti.Text;
  lPembelian.Pembeli := Pembeli;
  lPembelian.Tgl     := dtptanggal.Date;
  lPembelian.ID      := FID;

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
      ednobukti.Text := '';
      edpembelikode.Text := '';
      edpembelinama.Text := '';

      cxGridTablePembelianItem.DataController.RecordCount := 0;

      autocode;
  end else begin
//      ShowMessage('Gagal Simpan');
      btnsimpan.Enabled:=False;
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
//  iColumn := cxGridColKodeBarang.Index;

  sKode   := DisplayValue;
  lBarang := TBarang.Create;
  try
    lBarang.LoadByKode(sKode);
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColNamaBarang.Index]
      := lBarang.Nama;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColQty.Index]
      := 1;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColHarga.Index]
      := lBarang.Harga;
    cxGridTablePembelianItem.DataController.Values[iRecord, cxGridColTotal.Index]
      := lBarang.Harga;



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
//   cxGridTablePembelianItem.Controller.EditingController
  iRecord := cxGridTablePembelianItem.DataController.FocusedRecordIndex;
  iQty    := StrToInt(DisplayValue);
  vHarga  := cxGridTablePembelianItem.DataController.GetValue(iRecord, cxGridColHarga.Index);

  if VarIsNull(DisplayValue)then Exit;
  if DisplayValue = '' then Exit;
  if VarIsNull(vHarga) then Exit;

  dTotal  := iQty * vHarga;
  cxGridTablePembelianItem.DataController.SetValue(iRecord, cxGridColTotal.Index, dTotal);
end;

procedure TfrmPembelian.edNoBuktiKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  lPembelian : TPembelian;
  sNo: string;
  I: Integer;
begin
  if Key = VK_RETURN then
  begin
    sNo := edNoBukti.Text;
    lPembelian := TPembelian.Create;
    try
      lPembelian.LoadByCode(sNo);

      if lPembelian.noBukti <> '' then
      begin
        FID                            := lPembelian.ID;
        edNoBukti.Text                 := lPembelian.noBukti;
        dtptanggal.Date                := lpembelian.Tgl;

        edPembeliKode.Text             := lPembelian.Pembeli.Kode;
        edPembeliNama.Text             := lPembelian.Pembeli.Nama;


        // Isi grid
        cxGridTablePembelianItem.DataController.RecordCount := 0;
        for I := 0 to lPembelian.PembelianItems.Count - 1 do
        begin
          cxGridTablePembelianItem.DataController.AppendRecord;
          cxGridTablePembelianItem.DataController.Values[i, cxGridColKodeBarang.Index] := lPembelian.PembelianItems[i].Barang.Kode;
          cxGridTablePembelianItem.DataController.Values[i, cxGridColNamaBarang.Index] := lPembelian.PembelianItems[i].Barang.Nama;
          cxGridTablePembelianItem.DataController.Values[i, cxGridColHarga.index]      := lPembelian.PembelianItems[i].harga;
          cxGridTablePembelianItem.DataController.Values[i, cxGridColQty.Index]        := lPembelian.PembelianItems[i].Qty;
          cxGridTablePembelianItem.DataController.Values[i, cxGridColTotal.Index]      := lPembelian.PembelianItems[i].Qty * lPembelian.PembelianItems[i].harga;


        end;

      end;

    finally
      lPembelian.Free;
    end;
  end;

end;

procedure TfrmPembelian.edPembeliKodeKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin

  if Key = VK_RETURN then begin
     Pembeli.LoadbyKode(edPembeliKode.Text); //:= edPembeliKode.Text;
     edPembeliNama.Text := Pembeli.Nama;
     cxgrd1.SetFocus;



  end;
//
//  if Key = VK_RETURN then begin
//     lpembelian.IsKodeBelumAda(edPembeliKode.Text);
//     if MessageDlg('Kode Pembeli tidak ditemukan, apakah ingin mendaftar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//     begin
//       frmPembeli.Show;
//     end;
//
//  end;

end;

procedure TfrmPembelian.FormShow(Sender: TObject);
begin
  edPembeliKode.SetFocus;
end;

function TfrmPembelian.GetPembeli: Tpembeli;
begin
  if FPembeli = nil then
    FPembeli := TPembeli.Create;
   Result := FPembeli;
end;

function TfrmPembelian.IsDataValid: Boolean;
var
  str : string;
begin
  Result := False;
  str := '';
  if (edNoBukti.Text = '') then
  begin
    str := 'Kode belum diisi.' + sLineBreak;
    edNoBukti.SetFocus;
  end;
  if (edPembeliNama.Text = '') then
  begin
    str := str + 'Nama Pembeli belum diisi.' + sLineBreak;
    edPembeliNama.SetFocus;
  end;
  if (edPembeliKode.Text = '') then
  begin
    str := str + 'Kode Pembeli belum diisi.' + sLineBreak;
    edPembeliKode.SetFocus;
  end;

   if cxGridTablePembelianItem.DataController.RowCount = 0 then begin
     str := str + 'Data pembelian belum diisi.' + sLineBreak;
     cxgrd1.SetFocus;
  end;

  str := StringReplace(StringReplace(str, '', ' ', [rfReplaceAll]), #13, ' ', [rfReplaceAll]);



  if str <> '' then
  begin
    showMessage(str);
    exit;
  end;

  Result := True;
end;

end.
