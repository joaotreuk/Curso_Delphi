unit Produto;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  ZAbstractConnection,
  ZConnection,
  ZDataset,
  System.SysUtils;

type
  TProduto = class
  private
    ConexaoDB: TZConnection;
    FID: Integer;
    FNome: String;
    FDescricao: String;
    FValor: Double;
    FQuantidade: Double;
    FIDCategoria: Integer;
  public
    constructor Create(AConexao: TZConnection);
    function Inserir:Boolean;
    function Atualizar:Boolean;
    function Excluir:Boolean;
    function Selecionar(id: Integer):Boolean;
  published
    property ID: Integer read FID write FID;
    property Nome: String read FNome write FNome;
    property Descricao: String read FDescricao write FDescricao;
    property Valor: Double read FValor write FValor;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property IDCategoria: Integer read FIDCategoria write FIDCategoria;
  end;

implementation

{$region 'Constructor and Destructor'}

constructor TProduto.Create(aConexao: TZConnection);
begin
  ConexaoDB := aConexao;
end;

{$endRegion}

{$region 'CRUD'}

function TProduto.Excluir: Boolean;
var query: TZQuery;
begin
  Result := False;

  if MessageDlg(
    'Apagar o Registro: ' + #13 + #13 +
    'C�digo: ' + IntToStr(FID) + #13 +
    'Nome: ' + FNome,
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) = mrNo then Abort;

  query := TZQuery.Create(nil);

  try
    query.Connection := ConexaoDB;
    query.SQL.Clear;

    query.SQL.Add('DELETE FROM Produtos WHERE ID = :ID');
    query.ParamByName('ID').AsInteger := FID;

    Try
      ConexaoDB.StartTransaction;
      query.ExecSQL;
      ConexaoDB.Commit;

      Result := True;
      ShowMessage('Produto deletado com sucesso!');
    Except
      ConexaoDB.Rollback;
    End;
  finally
    if Assigned(query) then FreeAndNil(query);
  end;
end;

function TProduto.Atualizar: Boolean;
var query: TZQuery;
begin
  Result := False;
  query := TZQuery.Create(nil);

  try
    query.Connection := ConexaoDB;
    query.SQL.Clear;

    query.SQL.Add(
      'UPDATE Produtos SET Nome = :Nome, Descricao = :Descricao,' +
      ' Valor = :Valor, Quantidade = :Quantidade, IDCategoria = :IDCategoria ' +
      'WHERE ID = :ID'
    );

    query.ParamByName('Nome').AsString := Self.FNome;
    query.ParamByName('Descricao').AsString := Self.FDescricao;
    query.ParamByName('Valor').AsFloat := Self.FValor;
    query.ParamByName('Quantidade').AsFloat := Self.FQuantidade;
    query.ParamByName('IDCategoria').AsInteger := Self.FIDCategoria;
    query.ParamByName('ID').AsInteger := Self.FID;

    Try
      ConexaoDB.StartTransaction;
      query.ExecSQL;
      ConexaoDB.Commit;

      Result := True;
      ShowMessage('Produto atualizado com sucesso!');
    Except
      ConexaoDB.Rollback;
    End;

  finally
    if Assigned(query) then FreeAndNil(query);
  end;
end;

function TProduto.Inserir: Boolean;
var query: TZQuery;
begin
  Result := False;
  query := TZQuery.Create(nil);

  try
    query.Connection := ConexaoDB;
    query.SQL.Clear;

    query.SQL.Add(
      'INSERT INTO Produtos (Nome, Descricao, Valor, Quantidade, IDCategoria) ' +
      'VALUES (:Nome, :Descricao, :Valor, :Quantidade, :IDCategoria)'
    );

    query.ParamByName('Nome').AsString := Self.FNome;
    query.ParamByName('Descricao').AsString := Self.FDescricao;
    query.ParamByName('Valor').AsFloat := Self.FValor;
    query.ParamByName('Quantidade').AsFloat := Self.FQuantidade;
    query.ParamByName('IDCategoria').AsInteger := Self.FIDCategoria;

    Try
      ConexaoDB.StartTransaction;
      query.ExecSQL;
      ConexaoDB.Commit;

      Result := True;
      ShowMessage('Produto salvo com sucesso!');
    Except
      ConexaoDB.Rollback;
    End;

  finally
    if Assigned(query) then FreeAndNil(query);
  end;
end;

function TProduto.Selecionar(id: Integer): Boolean;
var query: TZQuery;
begin
  Result := False;
  query := TZQuery.Create(nil);

  try
    query.Connection := ConexaoDB;
    query.SQL.Clear;

    query.SQL.Add(
      'SELECT Nome, Descricao, Valor, Quantidade, IDCategoria ' +
      'FROM Produtos WITH (NOLOCK)' +
      'WHERE ID = :ID'
    );

    query.ParamByName('ID').AsInteger := id;
    query.Open;

    Self.FID := id;
    Self.FNome := query.FieldByName('Nome').AsString;
    Self.FDescricao := query.FieldByName('Descricao').AsString;
    Self.FValor := query.FieldByName('Valor').AsFloat;
    Self.FQuantidade := query.FieldByName('Quantidade').AsFloat;
    Self.FIDCategoria := query.FieldByName('IDCategoria').AsInteger;

    Result := True
  finally
    if Assigned(query) then FreeAndNil(query);
  end;
end;

{$endregion}

end.
