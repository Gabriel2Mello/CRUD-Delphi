object frmX1101_F1: TfrmX1101_F1
  Left = 0
  Top = 0
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  ClientHeight = 215
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MinHeight = 230
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'System'
  Font.Style = [fsBold]
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  StyleElements = [seFont, seClient]
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pagControl: TcxPageControl
    Left = 0
    Top = 41
    Width = 384
    Height = 133
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = tabDados
    Properties.CustomButtons.Buttons = <>
    Properties.Style = 1
    ClientRectBottom = 129
    ClientRectLeft = 4
    ClientRectRight = 380
    ClientRectTop = 24
    object tabDados: TcxTabSheet
      Caption = 'Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      object Label2: TLabel
        Left = 33
        Top = 18
        Width = 10
        Height = 13
        Alignment = taRightJustify
        Caption = 'Id'
      end
      object Label3: TLabel
        Left = 16
        Top = 49
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 124
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status'
      end
      object edtNome: TcxDBTextEdit
        Left = 49
        Top = 46
        Cursor = crIBeam
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = dtsMaster
        TabOrder = 0
        Width = 324
      end
      object edtId: TcxDBTextEdit
        Left = 49
        Top = 15
        Cursor = crNo
        DataBinding.DataField = 'ID'
        DataBinding.DataSource = dtsMaster
        Enabled = False
        TabOrder = 1
        Width = 57
      end
      object cbxStatus: TcxComboBox
        Left = 164
        Top = 15
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 384
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 94
      Height = 19
      Caption = 'Funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 174
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 2
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
  object dtsMaster: TDataSource
    AutoEdit = False
    DataSet = qryMaster
    Left = 192
    Top = 16
  end
  object qryMaster: TUniQuery
    Connection = frmDAO.UniConnection1
    SQL.Strings = (
      'SELECT T.* FROM X1101 T')
    Left = 224
    Top = 16
    object qryMasterID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      ReadOnly = True
      Required = True
    end
    object qryMasterNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object qryMasterDM_STATUS: TByteField
      FieldName = 'DM_STATUS'
      Required = True
    end
  end
end
