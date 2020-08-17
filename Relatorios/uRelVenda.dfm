object frmRelVenda: TfrmRelVenda
  Left = 0
  Top = 0
  Caption = 'frmRelVenda'
  ClientHeight = 660
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object relPrincipal: TRLReport
    Left = -4
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object bCabecalho: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 3
        Top = 16
        Width = 69
        Height = 24
        Caption = 'Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 45
        Width = 718
        Height = 22
        Align = faBottom
        DrawKind = dkLine
        Pen.Width = 2
      end
    end
    object bRodape: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 40
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 22
        Align = faTop
        DrawKind = dkLine
        Pen.Width = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 21
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object siA: TRLSystemInfo
        Left = 648
        Top = 21
        Width = 21
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 689
        Top = 21
        Width = 26
        Height = 16
        Alignment = taRightJustify
        Info = itLastPageNumber
        Text = ''
      end
      object RLLabel2: TRLLabel
        Left = 675
        Top = 21
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLLabel3: TRLLabel
        Left = 594
        Top = 21
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
      end
    end
    object gVenda: TRLGroup
      Left = 38
      Top = 105
      Width = 718
      Height = 80
      DataFields = 'DataVenda'
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = clSilver
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 3
          Top = 0
          Width = 49
          Height = 16
          Caption = 'Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText4: TRLDBText
          Left = 58
          Top = 1
          Width = 16
          Height = 16
          DataField = 'ID'
          DataSource = dsVendas
          Text = ''
        end
      end
      object RLBand1: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 16
        object RLDBText2: TRLDBText
          Left = 58
          Top = 0
          Width = 38
          Height = 16
          DataField = 'Nome'
          DataSource = dsVendas
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 646
          Top = 1
          Width = 68
          Height = 16
          Alignment = taRightJustify
          DataField = 'DataVenda'
          DataSource = dsVendas
          Text = ''
        end
        object RLLabel5: TRLLabel
          Left = 3
          Top = 0
          Width = 53
          Height = 16
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 540
          Top = 1
          Width = 102
          Height = 16
          Alignment = taRightJustify
          Caption = 'Data da Venda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 33
        Width = 718
        Height = 64
        DataSource = dsItens
        object RLBand2: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 16
          BandType = btHeader
          object RLLabel8: TRLLabel
            Left = 2
            Top = 1
            Width = 54
            Height = 16
            Caption = 'Produto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object RLBand4: TRLBand
          Left = 0
          Top = 16
          Width = 718
          Height = 16
          object RLDBText1: TRLDBText
            Left = 3
            Top = 0
            Width = 38
            Height = 16
            DataField = 'Nome'
            DataSource = dsItens
            Text = ''
          end
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 185
      Width = 718
      Height = 16
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 606
        Top = 0
        Width = 108
        Height = 16
        Alignment = taRightJustify
        DataField = 'TotalVenda'
        DataSource = dsVendas
        Info = riSum
        Text = ''
      end
      object RLLabel4: TRLLabel
        Left = 498
        Top = -2
        Width = 105
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total da Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object qryVendas: TZQuery
    Connection = dtmConexao.zcConexao
    Active = True
    SQL.Strings = (
      'SELECT V.ID, V.IDCliente, C.Nome, V.DataVenda, V.TotalVenda'
      'FROM Vendas AS V WITH (NOLOCK)'
      'INNER JOIN Clientes AS C WITH (NOLOCK) ON V.IDCliente = C.ID'
      'WHERE V.ID = :IDVenda')
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVenda'
        ParamType = ptInput
        Value = 4
      end>
    Left = 432
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDVenda'
        ParamType = ptInput
        Value = 4
      end>
    object qryVendasIDCliente: TIntegerField
      FieldName = 'IDCliente'
      Required = True
    end
    object qryVendasNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 60
    end
    object qryVendasDataVenda: TDateTimeField
      FieldName = 'DataVenda'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryVendasTotalVenda: TFloatField
      FieldName = 'TotalVenda'
      Required = True
      DisplayFormat = '#0.00'
    end
    object qryVendasID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 504
    Top = 416
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 436
    Top = 352
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 636
    Top = 352
  end
  object RLXLSXFilter1: TRLXLSXFilter
    DisplayName = 'Planilha Excel'
    Left = 580
    Top = 352
  end
  object RLHTMLFilter1: TRLHTMLFilter
    DocumentStyle = dsCSS2
    DisplayName = 'P'#225'gina da Web'
    Left = 508
    Top = 352
  end
  object qryVendaItens: TZQuery
    Connection = dtmConexao.zcConexao
    Active = True
    SQL.Strings = (
      
        'SELECT P.ID, P.Nome, VI.Quantidade, VI.ValorUnitario, VI.TotalPr' +
        'oduto'
      'FROM Vendas_Itens AS VI WITH (NOLOCK)'
      'INNER JOIN Produtos AS P WITH (NOLOCK) ON VI.IDProduto = P.ID'
      'WHERE VI.IDVenda = :IDVenda'
      'ORDER BY P.Nome')
    Params = <
      item
        DataType = ftInteger
        Name = 'IDVenda'
        ParamType = ptInput
        Value = '4'
      end>
    Left = 432
    Top = 480
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDVenda'
        ParamType = ptInput
        Value = '4'
      end>
    object qryVendaItensID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryVendaItensNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryVendaItensQuantidade: TFloatField
      FieldName = 'Quantidade'
      Required = True
    end
    object qryVendaItensValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
      Required = True
      DisplayFormat = '#0.00'
    end
    object qryVendaItensTotalProduto: TFloatField
      FieldName = 'TotalProduto'
      Required = True
      DisplayFormat = '#0.00'
    end
  end
  object dsItens: TDataSource
    DataSet = qryVendaItens
    Left = 504
    Top = 480
  end
end
