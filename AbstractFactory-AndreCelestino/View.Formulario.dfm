object fFormulario: TfFormulario
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abstract Factory'
  ClientHeight = 314
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbDadosNotebook: TGroupBox
    Left = 24
    Top = 72
    Width = 321
    Height = 105
    Caption = 'Dados do Notebook: '
    TabOrder = 0
    object lbNomeNotebook: TLabel
      Left = 61
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lbTela: TLabel
      Left = 67
      Top = 52
      Width = 24
      Height = 13
      Caption = 'Tela:'
    end
    object lbMemoriaRAM: TLabel
      Left = 21
      Top = 75
      Width = 69
      Height = 13
      Caption = 'Mem'#243'ria RAM:'
    end
    object edtNomeNotebook: TEdit
      Left = 96
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtTela: TEdit
      Left = 96
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtMemoriaRAM: TEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBoxMarcas: TRadioGroup
    Left = 24
    Top = 8
    Width = 321
    Height = 49
    Caption = 'Selecione a marca: '
    Columns = 3
    Items.Strings = (
      'Dell'
      'Apple'
      'Lenovo')
    TabOrder = 1
    OnClick = GroupBoxMarcasClick
  end
  object gbDadosDesktop: TGroupBox
    Left = 24
    Top = 192
    Width = 321
    Height = 105
    Caption = 'Dados do Desktop: '
    TabOrder = 2
    object lbNomeDesktop: TLabel
      Left = 60
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object lbProcessador: TLabel
      Left = 29
      Top = 51
      Width = 63
      Height = 13
      Caption = 'Processador:'
    end
    object lbHD: TLabel
      Left = 73
      Top = 76
      Width = 18
      Height = 13
      Caption = 'HD:'
    end
    object edtNomeDesktop: TEdit
      Left = 96
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtProcessador: TEdit
      Left = 96
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtHD: TEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
end
