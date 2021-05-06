object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Programa-X'
  ClientHeight = 695
  ClientWidth = 1189
  Color = clBtnFace
  Constraints.MinHeight = 550
  Constraints.MinWidth = 739
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
  object pgControl: TPageControl
    Left = 185
    Top = 0
    Width = 1004
    Height = 695
    Cursor = crHandPoint
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 695
    Align = alLeft
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Cursor = crHandPoint
      Align = alTop
      TabOrder = 0
      object btnFuncionario: TButton
        Left = 1
        Top = 1
        Width = 181
        Height = 39
        Cursor = crHandPoint
        Align = alClient
        Caption = 'TST - Funcion'#225'rio'
        TabOrder = 0
        OnClick = btnFuncionarioClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 42
      Width = 183
      Height = 41
      Cursor = crHandPoint
      Align = alTop
      TabOrder = 1
      object btnFornecedor: TButton
        Left = 1
        Top = 1
        Width = 181
        Height = 39
        Cursor = crHandPoint
        Align = alClient
        Caption = 'TST - Fornecedor'
        TabOrder = 0
        OnClick = btnFornecedorClick
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 83
      Width = 183
      Height = 41
      Cursor = crHandPoint
      Align = alTop
      TabOrder = 2
      object btnHorse: TButton
        Left = 1
        Top = 1
        Width = 181
        Height = 39
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Teste Horse'
        TabOrder = 0
        OnClick = btnHorseClick
      end
    end
  end
end
