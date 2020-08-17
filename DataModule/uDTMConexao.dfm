object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 255
  Width = 470
  object zcConexao: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Connected = True
    HostName = 'DESKTOP-BLHGJR3'
    Port = 1433
    Database = 'Curso_Delphi'
    User = 'Joao'
    Password = '1234'
    Protocol = 'mssql'
    LibraryLocation = 'D:\GitHub\Delphi\Curso_Delphi\ntwdblib.dll'
    Left = 32
    Top = 24
  end
  object qryScriptCategorias: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Categorias'#39') IS NULL'
      'CREATE TABLE Categorias ('
      #9'ID int IDENTITY PRIMARY KEY,'
      #9'Descricao varchar(50)'
      ')')
    Params = <>
    Left = 40
    Top = 88
  end
  object qryScriptProdutos: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Produtos'#39') IS NULL'
      'CREATE TABLE Produtos('
      #9'ID int IDENTITY PRIMARY KEY,'
      #9'Nome varchar(60),'
      #9'Descricao varchar(255),'
      #9'Valor decimal(18, 5) DEFAULT 0.00000,'
      #9'Quantidade decimal(18, 5) DEFAULT 0.00000,'
      #9'IDCategoria int REFERENCES Categorias(ID)'
      ')')
    Params = <>
    Left = 144
    Top = 88
  end
  object qryScriptClientes: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Clientes'#39') IS NULL'
      'CREATE TABLE Clientes ('
      #9'ID int IDENTITY PRIMARY KEY,'
      #9'Nome varchar(60) NOT NULL,'
      #9'Endereco varchar(60),'
      #9'Cidade varchar(50),'
      #9'Bairro varchar(40),'
      #9'Estado char(2),'
      #9'CEP varchar(10),'
      #9'Telefone varchar(14),'
      #9'Email varchar(100),'
      #9'DataNascimento date'
      ')')
    Params = <>
    Left = 248
    Top = 88
  end
  object qryScriptVendas: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Vendas'#39') IS NULL'
      'CREATE TABLE Vendas('
      #9'ID int IDENTITY PRIMARY KEY,'
      #9'IDCliente int NOT NULL REFERENCES Clientes (ID),'
      #9'DataVenda datetime DEFAULT GETDATE(),'
      #9'TotalVenda decimal(18, 5) DEFAULT 0.00000'
      ')')
    Params = <>
    Left = 352
    Top = 88
  end
  object qryScriptItensVenda: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Vendas_Itens'#39') IS NULL'
      'CREATE TABLE Vendas_Itens('
      #9'IDVenda int,'
      #9'IDProduto int NOT NULL REFERENCES Produtos (ID),'
      #9'ValorUnitario decimal(18, 5) DEFAULT 0.00000,'
      #9'Quantidade decimal(18, 5) DEFAULT 0.00000,'
      #9'TotalProduto decimal(18, 5) DEFAULT 0.00000,'
      #9'PRIMARY KEY(IDVenda, IDProduto)'
      ')')
    Params = <>
    Left = 40
    Top = 160
  end
  object qryScriptUsuarios: TZQuery
    Connection = zcConexao
    SQL.Strings = (
      'IF OBJECT_ID('#39'Usuarios'#39') IS NULL'
      'CREATE TABLE Usuarios('
      #9'ID INT IDENTITY PRIMARY KEY,'
      #9'Nome VARCHAR(50) NOT NULL,'
      #9'Senha VARCHAR(30) NOT NULL'
      ')')
    Params = <>
    Left = 144
    Top = 160
  end
end
