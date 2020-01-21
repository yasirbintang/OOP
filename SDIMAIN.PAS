unit SDIMAIN;

interface

uses Windows, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, StdActns,
  ActnList, ToolWin;

type
  TSDIAppForm = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
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
    StatusBar: TStatusBar;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    Help1: TMenuItem;
    HelpAboutItem: TMenuItem;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure FileSave1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
  private
    FHarga: string;
    FID: Integer;
    FKode: string;
    FNama: string;
    procedure SetHarga(const Value: string);
    procedure SetNama(const Value: string);
    { Private declarations }
  public
    function Hapus: Boolean;
    function Load: Boolean;
    function Simpan: Boolean;
    property Harga: string read FHarga write SetHarga;
    property ID: Integer read FID write FID;
    property Kode: string read FKode write FKode;
    property Nama: string read FNama write SetNama;
    { Public declarations }
  end;

var
  SDIAppForm: TSDIAppForm;


implementation

uses about;

{$R *.dfm}
type
barang=class(Tobject)
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

function TSDIAppForm.Hapus: Boolean;
begin
  Result := true;
  // TODO -cMM: TSDIAppForm.Hapus default body inserted
end;

procedure TSDIAppForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

function TSDIAppForm.Load: Boolean;
begin
  Result := true;
  // TODO -cMM: TSDIAppForm.Load default body inserted
end;

procedure TSDIAppForm.SetHarga(const Value: string);
begin
  FHarga := Value;
end;

procedure TSDIAppForm.SetNama(const Value: string);
begin
  FNama := Value;
end;

function TSDIAppForm.Simpan: Boolean;
begin
  Result := true;

  // TODO -cMM: TSDIAppForm.Simpan default body inserted
end;


end.
