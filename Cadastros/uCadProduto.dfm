inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produtos'
  ClientHeight = 396
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 345
    inherited dbnNavegador: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Height = 345
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      inherited grdListagem: TDBGrid
        Height = 244
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Width = 283
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Valor'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 856
      ExplicitHeight = 548
      object lblDescricao: TLabel
        Left = 11
        Top = 125
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblValor: TLabel
        Left = 11
        Top = 253
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidade: TLabel
        Left = 184
        Top = 253
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object lblCategoria: TLabel
        Left = 440
        Top = 69
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object edtID: TLabeledEdit
        Tag = 2
        Left = 11
        Top = 38
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 88
        Width = 406
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object edtDescricao: TMemo
        Left = 11
        Top = 144
        Width = 822
        Height = 89
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 3
      end
      object cueValor: TCurrencyEdit
        Left = 11
        Top = 272
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object cueQuantidade: TCurrencyEdit
        Left = 184
        Top = 272
        Width = 121
        Height = 21
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 5
      end
      object lcbCategoria: TDBLookupComboBox
        Left = 440
        Top = 88
        Width = 393
        Height = 21
        KeyField = 'ID'
        ListField = 'Descricao'
        ListSource = dtsCategorias
        TabOrder = 2
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      
        'SELECT P.ID, P.Nome, P.Descricao, P.Valor, P.Quantidade, C.ID AS' +
        ' IDCategoria, C.Descricao AS DescricaoCategoria'
      'FROM Produtos AS P WITH (NOLOCK)'
      'LEFT JOIN Categorias AS C WITH (NOLOCK) ON P.IDCategoria = C.ID')
    object qryListagemID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryListagemNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 255
    end
    object qryListagemValor: TFloatField
      FieldName = 'Valor'
    end
    object qryListagemQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryListagemIDCategoria: TIntegerField
      DisplayLabel = 'Cod. Categoria'
      FieldName = 'IDCategoria'
      ReadOnly = True
    end
    object qryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Categoria'
      FieldName = 'DescricaoCategoria'
      Size = 50
    end
  end
  object qryCategorias: TZQuery
    Connection = dtmConexao.zcConexao
    SQL.Strings = (
      'SELECT * FROM Categorias WITH (NOLOCK)')
    Params = <>
    Left = 676
    Top = 48
    object qryCategoriasID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryCategoriasDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dtsCategorias: TDataSource
    DataSet = qryCategorias
    Left = 752
    Top = 48
  end
end
