unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, cCadUsuario,
  uEnum, uDTMConexao;

type
  TfrmCadUsuario = class(TfrmTelaHeranca)
    qryListagemID: TIntegerField;
    qryListagemNome: TWideStringField;
    qryListagemSenha: TWideStringField;
    edtID: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    oUsuario: TUsuario;
    function Salvar(EstadoDoCadastro:TEstadoDoCadastro): boolean; override;
    function Excluir: Boolean; override;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses cAcaoAcesso;

{ TfrmCadUsuario }

function TfrmCadUsuario.Excluir: Boolean;
begin
  if oUsuario.Selecionar(QryListagem.FieldByName('ID').AsInteger) then begin
     Result := oUsuario.Apagar;
  end;
end;

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
  if oUsuario.Selecionar(QryListagem.FieldByName('ID').AsInteger) then begin
     edtID.Text := IntToStr(oUsuario.codigo);
     edtNome.Text := oUsuario.nome;
     edtSenha.Text := oUsuario.senha;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.btnSalvarClick(Sender: TObject);
begin
  if oUsuario.UsuarioExiste(edtNome.Text) then begin
    MessageDlg('Usu�rio j� cadastrado', mtInformation, [mbok], 0);
    edtNome.SetFocus;
    abort;
  end;

  if edtID.Text <> EmptyStr then
     oUsuario.codigo:=StrToInt(edtID.Text)
  else
     oUsuario.codigo := 0;

  oUsuario.nome := edtNome.Text;
  oUsuario.senha := edtSenha.Text;

  inherited;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oUsuario) then FreeAndNil(oUsuario);
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  oUsuario := TUsuario.Create(dtmConexao.zcConexao);
  IndiceAtual := 'Nome';
end;

function TfrmCadUsuario.Salvar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if EstadoDoCadastro = ecInserir then
     Result := oUsuario.Inserir
  else if EstadoDoCadastro = ecAlterar then
     Result := oUsuario.Atualizar;

  TAcaoAcesso.PreencherUsuariosVsAcoes(dtmConexao.zcConexao);
end;

end.
