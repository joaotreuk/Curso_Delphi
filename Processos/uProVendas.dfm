inherited frmProVenda: TfrmProVenda
  Caption = 'Vendas'
  ClientWidth = 1074
  Position = poDesigned
  ExplicitWidth = 1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Width = 1074
    ExplicitWidth = 1074
    inherited btnFechar: TButton
      Left = 990
      ExplicitLeft = 990
    end
    inherited dbnNavegador: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 1074
    ActivePage = tabManutencao
    ExplicitWidth = 1074
    inherited tabListagem: TTabSheet
      inherited pnlListagem: TPanel
        Width = 1066
        ExplicitWidth = 1066
      end
      inherited grdListagem: TDBGrid
        Width = 1066
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_1'
            Width = 101
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataVenda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TotalVenda'
            Width = 112
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      object lblCliente: TLabel
        Left = 165
        Top = 21
        Width = 33
        Height = 13
        Caption = 'Cliente'
      end
      object lblData: TLabel
        Left = 578
        Top = 21
        Width = 71
        Height = 13
        Caption = 'Data da Venda'
      end
      object edtID: TLabeledEdit
        Tag = 2
        Left = 14
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
      object lcbCliente: TDBLookupComboBox
        Left = 165
        Top = 38
        Width = 393
        Height = 21
        KeyField = 'ID'
        ListField = 'Nome'
        ListSource = dtmVendas.dtsClientes
        TabOrder = 1
      end
      object dteDataVenda: TDateEdit
        Left = 578
        Top = 40
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione uma Data'
        NumGlyphs = 2
        TabOrder = 2
      end
      object Panel1: TPanel
        Left = 0
        Top = 67
        Width = 1066
        Height = 481
        Align = alBottom
        TabOrder = 3
        object Panel2: TPanel
          Left = 1
          Top = 65
          Width = 1064
          Height = 380
          Align = alClient
          TabOrder = 0
          object grdItens: TDBGrid
            Left = 1
            Top = 1
            Width = 1062
            Height = 378
            Align = alClient
            DataSource = dtmVendas.dtsItensVenda
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDblClick = grdItensDblClick
            OnKeyDown = grdItensKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'IDProduto'
                Width = 77
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeProduto'
                Width = 392
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Quantidade'
                Width = 111
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorUnitario'
                Width = 114
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ValorTotalProduto'
                Width = 135
                Visible = True
              end>
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 1064
          Height = 64
          Align = alTop
          TabOrder = 1
          object lblProduto: TLabel
            Left = 13
            Top = 11
            Width = 38
            Height = 13
            Caption = 'Produto'
          end
          object lblValorUnit: TLabel
            Left = 384
            Top = 8
            Width = 64
            Height = 13
            Caption = 'Valor Unit'#225'rio'
          end
          object lblQuantidade: TLabel
            Left = 527
            Top = 8
            Width = 56
            Height = 13
            Caption = 'Quantidade'
          end
          object lblTotalProd: TLabel
            Left = 663
            Top = 8
            Width = 80
            Height = 13
            Caption = 'Total do Produto'
          end
          object cueValorUnit: TCurrencyEdit
            Left = 384
            Top = 27
            Width = 121
            Height = 21
            DisplayFormat = ' ,0.00;- ,0.00'
            TabOrder = 1
          end
          object cueQuantidade: TCurrencyEdit
            Left = 527
            Top = 27
            Width = 121
            Height = 21
            DisplayFormat = ' ,0.00;- ,0.00'
            TabOrder = 2
            OnEnter = cueQuantidadeEnter
            OnExit = cueQuantidadeExit
          end
          object cueTotalProd: TCurrencyEdit
            Left = 663
            Top = 27
            Width = 121
            Height = 21
            TabStop = False
            DisplayFormat = ' ,0.00;- ,0.00'
            ParentColor = True
            ReadOnly = True
            TabOrder = 3
          end
          object btnAdicionarItem: TButton
            Left = 807
            Top = 22
            Width = 114
            Height = 25
            Caption = 'Adicionar'
            TabOrder = 4
            OnClick = btnAdicionarItemClick
          end
          object btnExcluirItem: TButton
            Left = 927
            Top = 22
            Width = 80
            Height = 25
            Caption = '&Remover'
            TabOrder = 5
            TabStop = False
            OnClick = btnExcluirItemClick
          end
          object lcbProduto: TDBLookupComboBox
            Left = 13
            Top = 30
            Width = 347
            Height = 21
            KeyField = 'ID'
            ListField = 'Nome'
            ListSource = dtmVendas.dtsProdutos
            TabOrder = 0
            OnExit = lcbProdutoExit
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 445
          Width = 1064
          Height = 35
          Align = alBottom
          TabOrder = 2
          object lblValor: TLabel
            Left = 611
            Top = 10
            Width = 87
            Height = 13
            Caption = 'Total da Venda:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cueTotalVenda: TCurrencyEdit
            Left = 717
            Top = 6
            Width = 121
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = True
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT V.ID, C.ID, C.Nome, V.DataVenda, V.TotalVenda'
      'FROM Vendas AS V WITH (NOLOCK)'
      'INNER JOIN Clientes AS C WITH (NOLOCK) ON V.IDCliente = C.ID')
    Left = 836
    Top = 32
    object qryListagemID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryListagemID_1: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'ID_1'
      ReadOnly = True
    end
    object qryListagemNome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Nome'
      Required = True
      Size = 60
    end
    object qryListagemDataVenda: TDateTimeField
      DisplayLabel = 'Data da Venda'
      FieldName = 'DataVenda'
      Required = True
    end
    object qryListagemTotalVenda: TFloatField
      DisplayLabel = 'Total da Venda'
      FieldName = 'TotalVenda'
      Required = True
    end
  end
  inherited dtsListagem: TDataSource
    Left = 784
    Top = 32
  end
end
