object frmHorse_F1: TfrmHorse_F1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Teste Horse'
  ClientHeight = 215
  ClientWidth = 384
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
    Width = 384
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
      Width = 46
      Height = 19
      Caption = 'Teste'
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
    Width = 384
    Height = 133
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tabDados
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 129
    ClientRectLeft = 4
    ClientRectRight = 380
    ClientRectTop = 24
    object tabDados: TcxTabSheet
      Caption = 'Dados'
      ImageIndex = 0
      object Label4: TLabel
        Left = 15
        Top = 59
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 9
        Top = 21
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
      end
      object edtCodigo: TEdit
        Left = 48
        Top = 18
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 48
        Top = 56
        Width = 281
        Height = 21
        TabOrder = 1
      end
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
end
