unit uDTMVendas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, Datasnap.DBClient;

type
  TdtmVendas = class(TDataModule)
    qryClientes: TZQuery;
    qryClientesID: TIntegerField;
    qryClientesNome: TWideStringField;
    qryProdutos: TZQuery;
    qryProdutosID: TIntegerField;
    qryProdutosNome: TWideStringField;
    qryProdutosValor: TFloatField;
    qryProdutosQuantidade: TFloatField;
    cdsItensVenda: TClientDataSet;
    dtsClientes: TDataSource;
    dtsProdutos: TDataSource;
    dtsItensVenda: TDataSource;
    cdsItensVendaIDProduto: TIntegerField;
    cdsItensVendaNomeProduto: TStringField;
    cdsItensVendaQuantidade: TFloatField;
    cdsItensVendaValorUnitario: TFloatField;
    cdsItensVendaValorTotal: TFloatField;
    cdsItensVendaValorTotalVenda: TAggregateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmVendas: TdtmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmVendas.DataModuleCreate(Sender: TObject);
begin
  cdsItensVenda.CreateDataSet;
  qryClientes.Open;
  qryProdutos.Open;
end;

procedure TdtmVendas.DataModuleDestroy(Sender: TObject);
begin
  cdsItensVenda.Close;
  qryClientes.Close;
  qryProdutos.Close;
end;

end.
