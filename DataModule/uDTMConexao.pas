unit uDTMConexao;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TdtmConexao = class(TDataModule)
    zcConexao: TZConnection;
    qryScriptCategorias: TZQuery;
    qryScriptProdutos: TZQuery;
    qryScriptClientes: TZQuery;
    qryScriptVendas: TZQuery;
    qryScriptItensVenda: TZQuery;
    qryScriptUsuarios: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
