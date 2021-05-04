object frmX1102_F1: TfrmX1102_F1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  ClientHeight = 256
  ClientWidth = 492
  Color = clBtnFace
  Constraints.MinHeight = 295
  Constraints.MinWidth = 425
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TPanel
    Left = 0
    Top = 41
    Width = 492
    Height = 174
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 509
    ExplicitHeight = 176
    object pagControl: TcxPageControl
      Left = 1
      Top = 1
      Width = 490
      Height = 172
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = TabDadosContato
      Properties.CustomButtons.Buttons = <>
      ExplicitTop = -3
      ClientRectBottom = 168
      ClientRectLeft = 4
      ClientRectRight = 486
      ClientRectTop = 24
      object TabDados: TcxTabSheet
        Caption = 'Dados'
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 499
        ExplicitHeight = 177
        object Label3: TLabel
          Left = 32
          Top = 18
          Width = 10
          Height = 13
          Alignment = taRightJustify
          Caption = 'Id'
        end
        object Label4: TLabel
          Left = 15
          Top = 61
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome'
        end
        object Label5: TLabel
          Left = 11
          Top = 104
          Width = 31
          Height = 13
          Caption = 'Status'
        end
        object edtId: TcxDBTextEdit
          Left = 48
          Top = 15
          Cursor = crNo
          DataBinding.DataField = 'ID'
          DataBinding.DataSource = dtsFornecedor
          Enabled = False
          TabOrder = 0
          Width = 57
        end
        object edtNome: TcxDBTextEdit
          Left = 48
          Top = 58
          Cursor = crIBeam
          DataBinding.DataField = 'NOME'
          DataBinding.DataSource = dtsFornecedor
          TabOrder = 1
          Width = 324
        end
        object cbxStatus: TcxComboBox
          Left = 48
          Top = 101
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'Ativo'
            'Bloqueado'
            'Inativo')
          Properties.ReadOnly = False
          TabOrder = 2
          Text = 'Ativo'
          Width = 121
        end
      end
      object TabDadosContato: TcxTabSheet
        Caption = 'Contatos'
        ImageIndex = 0
        ExplicitLeft = 8
        ExplicitTop = 28
        ExplicitWidth = 0
        ExplicitHeight = 146
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 482
          Height = 41
          Align = alTop
          TabOrder = 0
          object btnNovo: TButton
            Left = 1
            Top = 1
            Width = 66
            Height = 39
            Cursor = crHandPoint
            Hint = 'novo'
            Align = alLeft
            Caption = 'Novo'
            TabOrder = 0
            OnClick = btnNovoClick
          end
          object btnEditar: TButton
            Left = 67
            Top = 1
            Width = 66
            Height = 39
            Cursor = crHandPoint
            Hint = 'editar'
            Align = alLeft
            Caption = 'Editar'
            TabOrder = 1
            OnClick = btnEditarClick
          end
          object btnExcluir: TButton
            Left = 133
            Top = 1
            Width = 66
            Height = 39
            Cursor = crHandPoint
            Hint = 'excluir'
            Align = alLeft
            Caption = 'Excluir'
            TabOrder = 2
            OnClick = btnExcluirClick
          end
          object btnVisualizar: TButton
            Left = 199
            Top = 1
            Width = 66
            Height = 39
            Cursor = crHandPoint
            Hint = 'visualizar'
            Align = alLeft
            Caption = 'Visualizar'
            TabOrder = 3
            OnClick = btnVisualizarClick
          end
        end
        object grdContato: TcxGrid
          Left = 0
          Top = 41
          Width = 482
          Height = 103
          Align = alClient
          TabOrder = 1
          ExplicitHeight = 105
          object grdContatoDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            ScrollbarAnnotations.CustomAnnotations = <>
            OnCellDblClick = grdContatoDBTableView1CellDblClick
            DataController.DataSource = dtsContato
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Editing = False
            OptionsSelection.CellSelect = False
            OptionsSelection.InvertSelect = False
            OptionsView.GroupByBox = False
            object grdContatoDBTableView1ID: TcxGridDBColumn
              Caption = 'Id'
              DataBinding.FieldName = 'ID'
              Width = 40
            end
            object grdContatoDBTableView1NOME: TcxGridDBColumn
              Caption = 'Nome'
              DataBinding.FieldName = 'NOME'
              Width = 138
            end
            object grdContatoDBTableView1FONE: TcxGridDBColumn
              Caption = 'Fone'
              DataBinding.FieldName = 'FONE'
              Width = 100
            end
            object grdContatoDBTableView1EMAIL: TcxGridDBColumn
              Caption = 'E-mail'
              DataBinding.FieldName = 'EMAIL'
              Width = 138
            end
            object grdContatoDBTableView1DM_STATUS: TcxGridDBColumn
              Caption = 'Status'
              DataBinding.FieldName = 'DM_STATUS'
              HeaderAlignmentHorz = taCenter
            end
          end
          object grdContatoLevel1: TcxGridLevel
            GridView = grdContatoDBTableView1
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 509
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 91
      Height = 19
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 215
    Width = 492
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 494
    ExplicitWidth = 509
    object btnSalvar: TButton
      Left = 1
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnFechar: TButton
      Left = 89
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnFecharClick
    end
  end
  object dtsFornecedor: TDataSource
    AutoEdit = False
    DataSet = qryFornecedor
    Left = 224
    Top = 24
  end
  object dtsContato: TDataSource
    AutoEdit = False
    DataSet = qryContato
    Left = 353
    Top = 23
  end
  object qryFornecedor: TUniQuery
    Connection = frmDAO.UniConnection1
    SQL.Strings = (
      'SELECT T.* FROM X1102 T')
    Left = 264
    Top = 24
    object qryFornecedorID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object qryFornecedorNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object qryFornecedorDM_STATUS: TByteField
      FieldName = 'DM_STATUS'
      Required = True
    end
  end
  object qryContato: TUniQuery
    Connection = frmDAO.UniConnection1
    SQL.Strings = (
      'SELECT T.* FROM X1104 T')
    Left = 393
    Top = 23
    object qryContatoID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object qryContatoFK_X1102: TIntegerField
      FieldName = 'FK_X1102'
      Required = True
    end
    object qryContatoNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object qryContatoFONE: TStringField
      FieldName = 'FONE'
    end
    object qryContatoEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object qryContatoDM_STATUS: TByteField
      Alignment = taCenter
      FieldName = 'DM_STATUS'
      Required = True
      OnGetText = qryContatoDM_STATUSGetText
    end
  end
end
