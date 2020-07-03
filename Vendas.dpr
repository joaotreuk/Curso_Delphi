program Vendas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uDTMConexao in 'DataModule\uDTMConexao.pas' {dtmConexao: TDataModule},
  uTelaHeranca in 'Heranca\uTelaHeranca.pas' {frmTelaHeranca},
  uCadCategorias in 'Cadastros\uCadCategorias.pas' {frmCadCategorias},
  Enter in 'Terceiros\Enter.pas',
  uEnum in 'Heranca\uEnum.pas',
  Categoria in 'Models\Categoria.pas',
  uCadCliente in 'Cadastros\uCadCliente.pas' {frmCliente},
  Cliente in 'Models\Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.