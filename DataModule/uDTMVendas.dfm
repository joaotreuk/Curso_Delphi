object dtmVendas: TdtmVendas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 180
  Width = 283
  object qryClientes: TZQuery
    Connection = dtmConexao.zcConexao
    SQL.Strings = (
      'SELECT ID, Nome FROM Clientes WITH (NOLOCK)')
    Params = <>
    Left = 32
    Top = 24
    object qryClientesID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryClientesNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 60
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmConexao.zcConexao
    SQL.Strings = (
      'SELECT ID, Nome, Valor, Quantidade FROM Produtos WITH (NOLOCK)')
    Params = <>
    Left = 104
    Top = 24
    object qryProdutosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryProdutosValor: TFloatField
      FieldName = 'Valor'
    end
    object qryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object cdsItensVenda: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 24
    object cdsItensVendaIDProduto: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'IDProduto'
    end
    object cdsItensVendaNomeProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'NomeProduto'
      Size = 60
    end
    object cdsItensVendaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsItensVendaValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      FieldName = 'ValorUnitario'
    end
    object cdsItensVendaValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotalProduto'
    end
    object cdsItensVendaValorTotalVenda: TAggregateField
      FieldName = 'ValorTotalVenda'
      DisplayName = ''
      Expression = 'SUM(ValorTotalProduto)'
    end
  end
  object dtsClientes: TDataSource
    DataSet = qryClientes
    Left = 32
    Top = 104
  end
  object dtsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 104
    Top = 104
  end
  object dtsItensVenda: TDataSource
    DataSet = cdsItensVenda
    Left = 176
    Top = 104
  end
end
