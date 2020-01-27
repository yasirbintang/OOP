unit ufrmPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, DB, uADCompClient, Buttons, Grids, DBGrids, DBClient;

type
  TfrmPembelian = class(TForm)
    Label1: TLabel;
    ednopembelian: TEdit;
    lbl1: TLabel;
    Label2: TLabel;
    edkode: TEdit;
    dtptanggal: TDateTimePicker;
    dbgrdpembelian: TDBGrid;
    btnsimpan: TButton;
    btnhapus: TButton;
    Baru: TBitBtn;
    con1: TADConnection;
    DSpembelian: TDataSource;
    edtnama: TEdit;
    DSbelian: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPembelian: TfrmPembelian;

implementation

{$R *.dfm}

end.
