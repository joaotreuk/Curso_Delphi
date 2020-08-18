﻿unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, cCadUsuario,
  uDTMConexao;

type
  TfrmLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnAcessar: TBitBtn;
    btnFechar: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
  private
    bFechar: Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uPrincipal;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario: TUsuario;
begin
  Try
    oUsuario := TUsuario.Create(dtmConexao.zcConexao);

    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then begin
       oUsuarioLogado.codigo := oUsuario.codigo;
       oUsuarioLogado.nome := oUsuario.nome;
       oUsuarioLogado.senha := oUsuario.senha;

       bFechar := True;
       Close
    end
    else begin
      MessageDlg('Usuário Inválido!', mtInformation, [mbok], 0);
      edtUsuario.SetFocus;
    end;

  Finally
    if Assigned(oUsuario) then FreeAndNil(oUsuario);
  End;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  bFechar := True;
  Application.Terminate;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  bFechar := False;
end;

end.
