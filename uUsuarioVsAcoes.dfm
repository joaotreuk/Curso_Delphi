object frmUsuariosAcoes: TfrmUsuariosAcoes
  Left = 0
  Top = 0
  Caption = 'Usu'#225'rios X A'#231#245'es'
  ClientHeight = 546
  ClientWidth = 908
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sSeparador: TSplitter
    Left = 313
    Top = 0
    Height = 505
    ExplicitLeft = 456
    ExplicitTop = 216
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 505
    Width = 908
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 440
    ExplicitTop = 200
    ExplicitWidth = 185
    DesignSize = (
      908
      41)
    object btnFechar: TButton
      Left = 820
      Top = 8
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
      ExplicitLeft = 830
    end
  end
  object Panel2: TPanel
    Left = 316
    Top = 0
    Width = 592
    Height = 505
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 520
    ExplicitTop = 392
    ExplicitWidth = 185
    ExplicitHeight = 41
    object gAcoes: TDBGrid
      Left = 1
      Top = 1
      Width = 590
      Height = 503
      Align = alClient
      DataSource = dsAcoes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = gAcoesDrawColumnCell
      OnDblClick = gAcoesDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'usuarioId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'acaoAcessoId'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ativo'
          Visible = False
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 505
    Align = alLeft
    TabOrder = 2
    object gUsuarios: TDBGrid
      Left = 1
      Top = 1
      Width = 311
      Height = 503
      Align = alClient
      DataSource = dsUsuarios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Visible = True
        end>
    end
  end
  object qryUsuarios: TZQuery
    Connection = dtmConexao.zcConexao
    AfterScroll = qryUsuariosAfterScroll
    SQL.Strings = (
      'SELECT ID, Nome'
      'FROM Usuarios AS U WITH (NOLOCK)')
    Params = <>
    Left = 116
    Top = 344
    object qryUsuariosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryUsuariosNome: TWideStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
  end
  object qryAcoes: TZQuery
    Connection = dtmConexao.zcConexao
    SQL.Strings = (
      'SELECT UAA.usuarioId, AA.acaoAcessoId, AA.descricao, UAA.ativo'
      'FROM usuariosAcaoAcesso AS UAA WITH (NOLOCK)'
      
        'INNER JOIN acaoAcesso AS AA WITH (NOLOCK) ON UAA.acaoAcessoId = ' +
        'AA.acaoAcessoId'
      'WHERE UAA.usuarioId = :IDUsuario')
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUsuario'
        ParamType = ptInput
      end>
    Left = 628
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDUsuario'
        ParamType = ptInput
      end>
    object qryAcoesusuarioId: TIntegerField
      FieldName = 'usuarioId'
      Required = True
    end
    object qryAcoesacaoAcessoId: TIntegerField
      FieldName = 'acaoAcessoId'
      Required = True
    end
    object qryAcoesdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryAcoesativo: TBooleanField
      FieldName = 'ativo'
      Required = True
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qryUsuarios
    Left = 180
    Top = 344
  end
  object dsAcoes: TDataSource
    DataSet = qryAcoes
    Left = 692
    Top = 336
  end
end
