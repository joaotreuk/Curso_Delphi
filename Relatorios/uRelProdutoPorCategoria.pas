unit uRelProdutoPorCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter,
  RLHTMLFilter, RLXLSXFilter, RLXLSFilter;

type
  TfrmRelProdutoPorCateg = class(TForm)
    qryProdutos: TZQuery;
    dsProdutos: TDataSource;
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
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    qryProdutosID: TIntegerField;
    qryProdutosNome: TWideStringField;
    qryProdutosDescricao: TWideStringField;
    qryProdutosValor: TFloatField;
    qryProdutosQuantidade: TFloatField;
    qryProdutosIDCategoria: TIntegerField;
    qryProdutosDescricaoCategoria: TWideStringField;
    gCategoria: TRLGroup;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProdutoPorCateg: TfrmRelProdutoPorCateg;

implementation

{$R *.dfm}

procedure TfrmRelProdutoPorCateg.FormCreate(Sender: TObject);
begin
  qryProdutos.Open;
end;

procedure TfrmRelProdutoPorCateg.FormDestroy(Sender: TObject);
begin
  qryProdutos.Close;
end;

end.
