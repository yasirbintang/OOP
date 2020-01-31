unit SDIMAIN;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus, IWCompLabel,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, StdActns,
  ActnList, ToolWin, uADGUIxIntf, uADGUIxFormsWait, uADStanIntf,
  uADCompGUIx, uConnection, FrmSetKoneksi, ufrmPembeli, ufrmBarang, ufrmpembelian, SysUtils;

type
  TSDIAppForm = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ActionList1: TActionList;
    FileNew1: TAction;
    FileOpen1: TAction;
    FileSave1: TAction;
    FileSaveAs1: TAction;
    FileExit1: TAction;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    HelpAbout1: TAction;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    Pembeli1: TMenuItem;
    Barang1: TMenuItem;
    ransaksi1: TMenuItem;
    Pembelian1: TMenuItem;
    lblstatus : TLabel;

    adgxwtcrsr1: TADGUIxWaitCursor;
    procedure Barang1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure Pembeli1Click(Sender: TObject);
    procedure Pembelian1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;


implementation

uses about;

{$R *.dfm}

procedure TSDIAppForm.Barang1Click(Sender: TObject);
begin
    frmBarang := Tfrmbarang.Create(Self);
    frmbarang.Show;
end;

procedure TSDIAppForm.FormCreate(Sender: TObject);
begin
  if TConnection.ConnectDB('belajar', 'MSSQL', '192.168.0.62','belajar_oop', 'sa', 'it@3Serangkai', '1433') then
  begin
    //lblStatus.Caption := 'Koneksi berhasil'
  end else begin
    Form2 := TForm2.Create(Self);
    Form2.Show;
  end;

end;

procedure TSDIAppForm.FileNew1Execute(Sender: TObject);
begin
  { Do nothing }
end;

procedure TSDIAppForm.FileOpen1Execute(Sender: TObject);
begin
  OpenDialog.Execute;
end;

procedure TSDIAppForm.FileSave1Execute(Sender: TObject);
begin
  SaveDialog.Execute;
end;

procedure TSDIAppForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TSDIAppForm.Pembeli1Click(Sender: TObject);
begin
  frmPembeli := TfrmPembeli.Create(Self);
  frmPembeli.Show;
end;

procedure TSDIAppForm.Pembelian1Click(Sender: TObject);
begin
   frmpembelian := Tfrmpembelian.Create(self);
   frmpembelian.show;
end;

end.
