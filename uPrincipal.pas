unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, uDTMConexao, Enter;

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
    procedure menuFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientes1Click(Sender: TObject);
  private
    teclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadCategorias, uCadCliente;

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

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(teclaEnter);
  FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
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

  teclaEnter := TMREnter.Create(Self);
  teclaEnter.FocusEnabled := true;
  teclaEnter.FocusColor := clInfoBk;
end;

procedure TfrmPrincipal.menuFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
