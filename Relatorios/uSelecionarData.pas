unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  Vcl.Buttons, System.DateUtils;

type
  TfrmSelecionarData = class(TForm)
    dteDataInicial: TDateEdit;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dteDataFinal: TDateEdit;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;

implementation

{$R *.dfm}

procedure TfrmSelecionarData.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  dteDataInicial.Date := StartOfTheMonth(Date);
  dteDataFinal.Date := EndOfTheMonth(Date);
end;

end.
