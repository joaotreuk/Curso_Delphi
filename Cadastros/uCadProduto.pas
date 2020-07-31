unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, RxToolEdit,
  RxCurrEdit, Produto, uEnum, uDTMConexao;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemNome: TWideStringField;
    qryListagemDescricao: TWideStringField;
    qryListagemValor: TFloatField;
    qryListagemQuantidade: TFloatField;
    qryListagemIDCategoria: TIntegerField;
    qryListagemDescricaoCategoria: TWideStringField;
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDescricao: TMemo;
    lblDescricao: TLabel;
    cueValor: TCurrencyEdit;
    cueQuantidade: TCurrencyEdit;
    lblValor: TLabel;
    lblQuantidade: TLabel;
    lcbCategoria: TDBLookupComboBox;
    qryCategorias: TZQuery;
    dtsCategorias: TDataSource;
    qryCategoriasID: TIntegerField;
    qryCategoriasDescricao: TWideStringField;
    lblCategoria: TLabel;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    oProduto: TProduto;
    function Excluir: Boolean; override;
    function Salvar(EstadoDoCadastro:TEstadoDoCadastro): Boolean; override;
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

{$region 'Override'}

function TfrmCadProduto.Excluir: Boolean;
begin
  if oProduto.Selecionar(qryListagem.FieldByName('ID').AsInteger) then
    Result := oProduto.Excluir
  else
    Result := False;
end;

function TfrmCadProduto.Salvar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtID.Text <> EmptyStr then oProduto.ID := StrToInt(edtID.Text);

  oProduto.Nome := edtNome.Text;
  oProduto.Descricao := edtDescricao.Text;
  oProduto.Valor := cueValor.Value;
  oProduto.Quantidade := cueQuantidade.Value;
  oProduto.IDCategoria := lcbCategoria.KeyValue;

  if (EstadoDoCadastro = ecInserir) then
     Result := oProduto.Inserir
  else
     Result := oProduto.Atualizar;
end;

{$endregion}

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
var IDSelecionado: Integer;
begin
  IDSelecionado := qryListagem.FieldByName('ID').AsInteger;

  if oProduto.Selecionar(IDSelecionado) then
  begin
     edtID.Text := IntToStr(IDSelecionado);
     edtNome.Text := oProduto.Nome;
     edtDescricao.Text := oProduto.Descricao;
     cueValor.Value := oProduto.Valor;
     cueQuantidade.Value := oProduto.Quantidade;
     lcbCategoria.KeyValue := oProduto.IDCategoria;
  end
  else
    Abort;

  inherited;
end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oProduto) then FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  oProduto := TProduto.Create(dtmConexao.zcConexao);
  IndiceAtual := 'Nome';
end;

procedure TfrmCadProduto.FormShow(Sender: TObject);
begin
  inherited;
  qryCategorias.Open;
end;

end.
