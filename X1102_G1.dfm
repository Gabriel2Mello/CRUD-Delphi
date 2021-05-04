object frmX1102_G1: TfrmX1102_G1
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'frmX1102_G1'
  ClientHeight = 585
  ClientWidth = 970
  Color = clBtnFace
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnUltimo: TButton
      Left = 705
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = #218'ltimo'
      TabOrder = 11
      OnClick = btnUltimoClick
    end
    object btnPrimeiro: TButton
      Left = 617
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Primeiro'
      TabOrder = 10
      OnClick = btnPrimeiroClick
    end
    object Button2: TButton
      Left = 529
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Anterior'
      TabOrder = 9
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 441
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Pr'#243'ximo'
      TabOrder = 8
      OnClick = Button1Click
    end
    object btnFechar: TButton
      Left = 881
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 5
      OnClick = btnFecharClick
    end
    object btnEsquerda: TButton
      Left = 793
      Top = 1
      Width = 44
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = '<'
      TabOrder = 6
      OnClick = btnEsquerdaClick
    end
    object btnDireita: TButton
      Left = 837
      Top = 1
      Width = 44
      Height = 39
      Cursor = crHandPoint
      Align = alRight
      Caption = '>'
      TabOrder = 7
      OnClick = btnDireitaClick
    end
    object btnVisualizar: TButton
      Left = 353
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Visualizar'
      TabOrder = 4
      OnClick = btnVisualizarClick
    end
    object btnExcluir: TButton
      Left = 265
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnEditar: TButton
      Left = 177
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Editar'
      TabOrder = 2
      OnClick = btnEditarClick
    end
    object btnNovo: TButton
      Left = 89
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
    end
    object btnCarregar: TButton
      Left = 1
      Top = 1
      Width = 88
      Height = 39
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Carregar'
      TabOrder = 0
      OnClick = btnCarregarClick
    end
  end
  object gridMain: TcxGrid
    Left = 170
    Top = 41
    Width = 800
    Height = 544
    Align = alClient
    TabOrder = 1
    object gridMainDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      OnCellDblClick = gridMainDBTableView1CellDblClick
      DataController.DataSource = dtsGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      object gridMainDBTableView1ID: TcxGridDBColumn
        Caption = 'Id'
        DataBinding.FieldName = 'ID'
        Width = 60
      end
      object gridMainDBTableView1NOME: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NOME'
        Width = 150
      end
      object gridMainDBTableView1DM_STATUS: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'DM_STATUS'
        HeaderAlignmentHorz = taCenter
      end
    end
    object gridMainLevel1: TcxGridLevel
      GridView = gridMainDBTableView1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 170
    Height = 544
    Align = alLeft
    TabOrder = 2
    object ckgStatus: TcxCheckGroup
      Left = 1
      Top = 1
      Align = alTop
      BiDiMode = bdLeftToRight
      Caption = 'Status'
      ParentBackground = False
      ParentBiDiMode = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Ativo'
        end
        item
          Caption = 'Bloqueado'
        end
        item
          Caption = 'Inativo'
        end>
      Style.BorderStyle = ebsUltraFlat
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.Shadow = False
      Style.TextStyle = []
      StyleDisabled.BorderStyle = ebsUltraFlat
      TabOrder = 0
      Height = 72
      Width = 168
    end
  end
  object dtsGrid: TDataSource
    AutoEdit = False
    DataSet = qryGrid
    Left = 544
    Top = 40
  end
  object qryGrid: TUniQuery
    Connection = frmDAO.UniConnection1
    SQL.Strings = (
      'SELECT T.* FROM X1102 T')
    Left = 576
    Top = 40
    object qryGridID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object qryGridNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object qryGridDM_STATUS: TByteField
      Alignment = taCenter
      FieldName = 'DM_STATUS'
      Required = True
      OnGetText = qryGridDM_STATUSGetText
    end
  end
end
