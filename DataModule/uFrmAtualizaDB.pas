unit uFrmAtualizaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmAtualizaDB = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    cbConexao: TCheckBox;
    cbCategorias: TCheckBox;
    cbProdutos: TCheckBox;
    cbClientes: TCheckBox;
    cbVendas: TCheckBox;
    cbItensVenda: TCheckBox;
    cbUsuarios: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizaDB: TfrmAtualizaDB;

implementation

{$R *.dfm}

end.