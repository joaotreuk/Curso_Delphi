unit uDTMGraficos;

interface

uses
  System.SysUtils, System.Classes, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TDataModule1 = class(TDataModule)
    qryProdutos: TZQuery;
    qryProdutosLabel: TWideStringField;
    qryProdutosValue: TFloatField;
    dsProdutos: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
