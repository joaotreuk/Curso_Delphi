object frmRelProduto: TfrmRelProduto
  Left = 0
  Top = 0
  Caption = 'frmRelProduto'
  ClientHeight = 660
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object relPrincipal: TRLReport
    Left = -4
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsProdutos
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
        Width = 229
        Height = 24
        Caption = 'Listagem de Produtos'
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
      Top = 163
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
    object RLBand1: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 34
      object RLDBText1: TRLDBText
        Left = 3
        Top = 16
        Width = 16
        Height = 16
        DataField = 'ID'
        DataSource = dsProdutos
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 53
        Top = 15
        Width = 38
        Height = 16
        DataField = 'Nome'
        DataSource = dsProdutos
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 397
        Top = 12
        Width = 70
        Height = 16
        DataField = 'Quantidade'
        DataSource = dsProdutos
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 24
      BandType = btColumnHeader
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        Align = faClient
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel4: TRLLabel
          Left = 3
          Top = 3
          Width = 49
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 53
          Top = 3
          Width = 41
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 397
          Top = 6
          Width = 156
          Height = 16
          Caption = 'Quantidade em Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object qryProdutos: TZQuery
    Connection = dtmConexao.zcConexao
    Active = True
    SQL.Strings = (
      'SELECT ID, Nome, Descricao, Valor, Quantidade'
      'FROM Produtos WITH (NOLOCK)')
    Params = <>
    Left = 512
    Top = 288
    object qryProdutosID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryProdutosDescricao: TWideStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qryProdutosNome: TWideStringField
      FieldName = 'Nome'
      Size = 60
    end
    object qryProdutosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = '#0.00'
    end
    object qryProdutosQuantidade: TFloatField
      FieldName = 'Quantidade'
      DisplayFormat = '#0.00'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 592
    Top = 288
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 436
    Top = 288
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel 97-2013'
    Left = 436
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
end
