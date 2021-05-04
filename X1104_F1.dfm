object frmX1104_F1: TfrmX1104_F1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  ClientHeight = 287
  ClientWidth = 421
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 421
    Height = 41
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 9
      Width = 65
      Height = 19
      Caption = 'Contato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pagControl: TcxPageControl
    Left = 0
    Top = 41
    Width = 421
    Height = 205
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabDados
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 201
    ClientRectLeft = 4
    ClientRectRight = 417
    ClientRectTop = 24
    object tabDados: TcxTabSheet
      Caption = 'Dados'
      ImageIndex = 0
      object Label2: TLabel
        Left = 33
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
      object Label3: TLabel
        Left = 124
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Status'
      end
      object Label5: TLabel
        Left = 18
        Top = 101
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fone'
      end
      object Label6: TLabel
        Left = 14
        Top = 141
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'E-mail'
      end
      object edtId: TcxDBTextEdit
        Left = 49
        Top = 15
        Cursor = crNo
        DataBinding.DataField = 'ID'
        DataBinding.DataSource = dtsMaster
        Enabled = False
        TabOrder = 0
        Width = 57
      end
      object edtNome: TcxDBTextEdit
        Left = 48
        Top = 58
        Cursor = crIBeam
        DataBinding.DataField = 'NOME'
        DataBinding.DataSource = dtsMaster
        TabOrder = 1
        Width = 324
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
      object edtFone: TcxDBTextEdit
        Left = 48
        Top = 98
        Cursor = crIBeam
        DataBinding.DataField = 'FONE'
        DataBinding.DataSource = dtsMaster
        TabOrder = 3
        Width = 129
      end
      object edtEmail: TcxDBTextEdit
        Left = 48
        Top = 138
        Cursor = crIBeam
        DataBinding.DataField = 'EMAIL'
        DataBinding.DataSource = dtsMaster
        TabOrder = 4
        Width = 324
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 246
    Width = 421
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
    Top = 24
  end
  object qryMaster: TUniQuery
    Connection = frmDAO.UniConnection1
    SQL.Strings = (
      'SELECT T.* FROM X1104 T')
    Left = 240
    Top = 24
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
    object qryMasterFONE: TStringField
      FieldName = 'FONE'
    end
    object qryMasterEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 250
    end
    object qryMasterDM_STATUS: TByteField
      FieldName = 'DM_STATUS'
      Required = True
    end
    object qryMasterFK_X1102: TIntegerField
      FieldName = 'FK_X1102'
      Required = True
    end
  end
end
