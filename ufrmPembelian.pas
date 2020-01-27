unit ufrmPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TfrmPembelian = class(TForm)
    Label1: TLabel;
    ednopembelian: TEdit;
    lbl1: TLabel;
    edtanggal: TEdit;
    Label2: TLabel;
    edpembeli: TEdit;
    dtptanggal: TDateTimePicker;
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
