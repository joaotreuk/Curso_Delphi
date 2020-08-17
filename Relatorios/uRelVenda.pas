unit uRelVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, uDTMConexao, RLReport, RLFilters, RLPDFFilter,
  RLHTMLFilter, RLXLSXFilter, RLXLSFilter;

type
  TfrmRelVenda = class(TForm)
    qryVendas: TZQuery;
    dsVendas: TDataSource;
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
    gVenda: TRLGroup;
    RLBand3: TRLBand;
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText4: TRLDBText;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    qryVendasIDCliente: TIntegerField;
    qryVendasNome: TWideStringField;
    qryVendasDataVenda: TDateTimeField;
    qryVendasTotalVenda: TFloatField;
    qryVendaItens: TZQuery;
    dsItens: TDataSource;
    qryVendaItensID: TIntegerField;
    qryVendaItensNome: TWideStringField;
    qryVendaItensQuantidade: TFloatField;
    qryVendaItensValorUnitario: TFloatField;
    qryVendaItensTotalProduto: TFloatField;
    qryVendasID: TIntegerField;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel4: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel8: TRLLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelVenda: TfrmRelVenda;

implementation

{$R *.dfm}

procedure TfrmRelVenda.FormDestroy(Sender: TObject);
begin
  qryVendas.Close;
  qryVendaItens.Close;
end;

end.
