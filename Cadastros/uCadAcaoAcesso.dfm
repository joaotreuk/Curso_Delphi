inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#245'es de Acesso'
  ClientHeight = 419
  ClientWidth = 812
  ExplicitWidth = 818
  ExplicitHeight = 448
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 368
    Width = 812
    ExplicitTop = 368
    ExplicitWidth = 812
    inherited btnFechar: TButton
      Left = 728
      ExplicitLeft = 728
    end
    inherited dbnNavegador: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited pgcPrincipal: TPageControl
    Width = 812
    Height = 368
    ExplicitWidth = 812
    ExplicitHeight = 368
    inherited tabListagem: TTabSheet
      ExplicitWidth = 804
      ExplicitHeight = 340
      inherited pnlListagem: TPanel
        Width = 804
        ExplicitWidth = 804
      end
      inherited grdListagem: TDBGrid
        Width = 804
        Height = 267
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Width = 416
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Width = 262
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      object edtDescricao: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 88
        Width = 510
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        MaxLength = 50
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 1
        Left = 11
        Top = 136
        Width = 510
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        MaxLength = 50
        TabOrder = 2
      end
    end
  end
  inherited qryListagem: TZQuery
    SQL.Strings = (
      'SELECT * FROM acaoAcesso WITH (NOLOCK)')
    object qryListagemacaoAcessoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoId'
      ReadOnly = True
    end
    object qryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object qryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
end
