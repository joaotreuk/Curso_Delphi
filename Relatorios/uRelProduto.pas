unit uRelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter,
  RLHTMLFilter, RLXLSXFilter, RLXLSFilter;

type
  TfrmRelProduto = class(TForm)
    qryProdutos: TZQuery;
    dsProdutos: TDataSource;
    qryProdutosID: TIntegerField;
    qryProdutosDescricao: TWideStringField;
    relPrincipal: TRLReport;
    bCabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    bRodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    siA: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    qryProdutosNome: TWideStringField;
    qryProdutosValor: TFloatField;
    qryProdutosQuantidade: TFloatField;
    RLLabel6: TRLLabel;
    RLDBText3: TRLDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProduto: TfrmRelProduto;

implementation

{$R *.dfm}

procedure TfrmRelProduto.FormCreate(Sender: TObject);
begin
  qryProdutos.Open;
end;

procedure TfrmRelProduto.FormDestroy(Sender: TObject);
begin
  qryProdutos.Close;
end;

end.
