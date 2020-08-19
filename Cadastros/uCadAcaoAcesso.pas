unit uCadAcaoAcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, cAcaoAcesso,
  uEnum;

type
  TfrmCadAcaoAcesso = class(TfrmTelaHeranca)
    qryListagemacaoAcessoId: TIntegerField;
    qryListagemdescricao: TWideStringField;
    qryListagemchave: TWideStringField;
    edtID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtChave: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    oAcaoAcesso: TAcaoAcesso;
    function Salvar(EstadoDoCadastro: TEstadoDoCadastro): boolean; override;
    function Excluir: Boolean; override;
  end;

var
  frmCadAcaoAcesso: TfrmCadAcaoAcesso;

implementation

{$R *.dfm}

uses uDTMConexao;

{ TfrmCadAcaoAcesso }

function TfrmCadAcaoAcesso.Excluir: Boolean;
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then begin
     Result := oAcaoAcesso.Apagar;
  end;
end;

function TfrmCadAcaoAcesso.Salvar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro = ecInserir then
     Result := oAcaoAcesso.Inserir
  else if EstadoDoCadastro = ecAlterar then
     Result := oAcaoAcesso.Atualizar;
end;

procedure TfrmCadAcaoAcesso.FormCreate(Sender: TObject);
begin
  inherited;
  oAcaoAcesso := TAcaoAcesso.Create(dtmConexao.zcConexao);
  IndiceAtual := 'descricao';
end;

procedure TfrmCadAcaoAcesso.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  inherited;
  if Assigned(oAcaoAcesso) then FreeAndNil(oAcaoAcesso);
end;

procedure TfrmCadAcaoAcesso.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadAcaoAcesso.btnSalvarClick(Sender: TObject);
begin
  if edtID.Text <> EmptyStr then
     oAcaoAcesso.codigo := StrToInt(edtID.Text)
  else
     oAcaoAcesso.codigo := 0;

  if oAcaoAcesso.ChaveExiste(edtChave.Text, oAcaoAcesso.codigo) then begin
    MessageDlg('Chave j� cadastrado', mtInformation, [mbok], 0);
    edtChave.SetFocus;
    abort;
  end;

  oAcaoAcesso.descricao := edtDescricao.Text;
  oAcaoAcesso.chave := edtChave.Text;

  inherited;
end;

procedure TfrmCadAcaoAcesso.btnAlterarClick(Sender: TObject);
begin
  if oAcaoAcesso.Selecionar(QryListagem.FieldByName('acaoAcessoId').AsInteger) then
  begin
     edtID.Text := oAcaoAcesso.codigo.ToString();
     edtDescricao.Text := oAcaoAcesso.descricao;
     edtChave.Text := oAcaoAcesso.chave;
  end
  else
  begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

end.
