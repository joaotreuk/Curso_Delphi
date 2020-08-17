unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter, uFrmAtualizaDB,
  uRelCategoria, uRelCliente, uRelFichaCliente, uRelProduto,
  uRelProdutoPorCategoria, uSelecionarData, uRelVendaPorData;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Movimentaes1: TMenuItem;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    N1: TMenuItem;
    Categorias1: TMenuItem;
    Produtos1: TMenuItem;
    N2: TMenuItem;
    menuFechar: TMenuItem;
    Vendas1: TMenuItem;
    Clientes2: TMenuItem;
    N3: TMenuItem;
    Produtos2: TMenuItem;
    N4: TMenuItem;
    VendasporData1: TMenuItem;
    Categoria1: TMenuItem;
    FichadeClientes1: TMenuItem;
    ProdutosporCategoria1: TMenuItem;
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Categoria1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure FichadeClientes1Click(Sender: TObject);
    procedure Produtos2Click(Sender: TObject);
    procedure ProdutosporCategoria1Click(Sender: TObject);
    procedure VendasporData1Click(Sender: TObject);
  private
    teclaEnter: TMREnter;
    procedure AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias, uCadCliente, uCadProduto, uProVendas;

procedure TfrmPrincipal.Categoria1Click(Sender: TObject);
begin
  frmRelCategoria := TfrmRelCategoria.Create(Self);
  frmRelCategoria.relPrincipal.PreviewModal;
  frmRelCategoria.Release;
end;

procedure TfrmPrincipal.Categorias1Click(Sender: TObject);
begin
  frmCadCategorias := TfrmCadCategorias.Create(Self);
  frmCadCategorias.ShowModal;
  frmCadCategorias.Release;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  frmCliente := TfrmCliente.Create(Self);
  frmCliente.ShowModal;
  frmCliente.Release;
end;

procedure TfrmPrincipal.Clientes2Click(Sender: TObject);
begin
  frmRelCliente := TfrmRelCliente.Create(Self);
  frmRelCliente.relPrincipal.PreviewModal;
  frmRelCliente.Release;
end;

procedure TfrmPrincipal.FichadeClientes1Click(Sender: TObject);
begin
  frmRelFichaCliente := TfrmRelFichaCliente.Create(Self);
  frmRelFichaCliente.relPrincipal.PreviewModal;
  frmRelFichaCliente.Release;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(teclaEnter);
  FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmAtualizaDB := TfrmAtualizaDB.Create(Self);
  frmAtualizaDB.Show;
  frmAtualizaDB.Refresh;

  dtmConexao := TdtmConexao.Create(Self);

  with dtmConexao.zcConexao do
  begin
    SQLHourGlass := True;
    Protocol := 'mssql';
    LibraryLocation := 'D:\GitHub\Delphi\Curso_Delphi\ntwdblib.dll';
    HostName := 'DESKTOP-BLHGJR3';
    Port := 1433;
    User := 'Joao';
    Password := '1234';
    Database := 'Curso_Delphi';
    Connected := True;
  end;

  AtualizacaoBancoDados(frmAtualizaDB);
  frmAtualizaDB.Free;

  teclaEnter := TMREnter.Create(Self);
  teclaEnter.FocusEnabled := true;
  teclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  frmCadProduto := TfrmCadProduto.Create(Self);
  frmCadProduto.ShowModal;
  frmCadProduto.Release;
end;

procedure TfrmPrincipal.Produtos2Click(Sender: TObject);
begin
  frmRelProduto := TfrmRelProduto.Create(Self);
  frmRelProduto.relPrincipal.PreviewModal;
  frmRelProduto.Release;
end;

procedure TfrmPrincipal.ProdutosporCategoria1Click(Sender: TObject);
begin
  frmRelProdutoPorCateg := TfrmRelProdutoPorCateg.Create(Self);
  frmRelProdutoPorCateg.relPrincipal.PreviewModal;
  frmRelProdutoPorCateg.Release;
end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
begin
  frmProVenda := TfrmProVenda.Create(Self);
  frmProVenda.ShowModal;
  frmProVenda.Release;
end;

procedure TfrmPrincipal.VendasporData1Click(Sender: TObject);
begin
  Try
    frmSelecionarData := TfrmSelecionarData.Create(Self);
    frmSelecionarData.ShowModal;

    frmRelVendaPorData := TfrmRelVendaPorData.Create(Self);
    frmRelVendaPorData.qryVendas.Close;
    frmRelVendaPorData.qryVendas.ParamByName('DataInicial').AsDate := frmSelecionarData.dteDataInicial.Date;
    frmRelVendaPorData.qryVendas.ParamByName('DataFinal').AsDate := frmSelecionarData.dteDataFinal.Date;
    frmRelVendaPorData.qryVendas.Open;
    frmRelVendaPorData.relPrincipal.PreviewModal;
  Finally
    frmSelecionarData.Release;
    frmRelVendaPorData.Release;
  End;
end;

procedure TfrmPrincipal.AtualizacaoBancoDados(aForm: TfrmAtualizaDB);
begin
  aForm.cbConexao.Checked := true;
  aForm.Refresh;

  dtmConexao.qryScriptCategorias.ExecSQL;
  aForm.cbCategorias.Checked := true;
  aForm.Refresh;
  Sleep(100);

  dtmConexao.qryScriptProdutos.ExecSQL;
  aForm.cbProdutos.Checked := true;
  aForm.Refresh;
  Sleep(100);

  dtmConexao.qryScriptClientes.ExecSQL;
  aForm.cbClientes.Checked := true;
  aForm.Refresh;
  Sleep(100);

  dtmConexao.qryScriptVendas.ExecSQL;
  aForm.cbVendas.Checked := true;
  aForm.Refresh;
  Sleep(100);

  dtmConexao.qryScriptItensVenda.ExecSQL;
  aForm.cbItensVenda.Checked := true;
  aForm.Refresh;
  Sleep(100);

  dtmConexao.qryScriptUsuarios.ExecSQL;
  aForm.cbUsuarios.Checked := true;
  aForm.Refresh;
  Sleep(100);
end;

end.
