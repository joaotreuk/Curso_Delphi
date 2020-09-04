object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 150
  Width = 310
  object qryProdutos: TZQuery
    Connection = dtmConexao.zcConexao
    SQL.Strings = (
      
        'SELECT CAST(ID AS varchar) + '#39' - '#39' + Nome AS Label, Quantidade A' +
        'S Value'
      'FROM Produtos')
    Params = <>
    Left = 57
    Top = 38
    object qryProdutosLabel: TWideStringField
      FieldName = 'Label'
      ReadOnly = True
      Size = 93
    end
    object qryProdutosValue: TFloatField
      FieldName = 'Value'
    end
  end
  object dsProdutos: TDataSource
    Left = 129
    Top = 41
  end
end
