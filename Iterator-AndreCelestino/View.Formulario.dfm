object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Iterator - Andr'#233' Celestino'
  ClientHeight = 232
  ClientWidth = 596
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
  object LabelClientes: TLabel
    Left = 5
    Top = 47
    Width = 48
    Height = 13
    Caption = 'Clientes:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDados: TLabel
    Left = 164
    Top = 47
    Width = 38
    Height = 13
    Caption = 'Dados:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel: TBevel
    Left = 8
    Top = 34
    Width = 580
    Height = 7
    Shape = bsTopLine
  end
  object ListBoxClientes: TListBox
    Left = 5
    Top = 63
    Width = 153
    Height = 161
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxClientesClick
  end
  object PanelCampos: TPanel
    Left = 164
    Top = 63
    Width = 426
    Height = 161
    TabOrder = 1
    object LabelNome: TLabel
      Left = 8
      Top = 60
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object LabelSobrenome: TLabel
      Left = 164
      Top = 60
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object LabelCodigo: TLabel
      Left = 8
      Top = 11
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object LabelPais: TLabel
      Left = 8
      Top = 109
      Width = 23
      Height = 13
      Caption = 'Pa'#237's:'
    end
    object LabelEmail: TLabel
      Left = 164
      Top = 109
      Width = 32
      Height = 13
      Caption = 'E-mail:'
    end
    object EditCodigo: TEdit
      Left = 8
      Top = 28
      Width = 73
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object EditNome: TEdit
      Left = 8
      Top = 74
      Width = 150
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EditEndereco: TEdit
      Left = 164
      Top = 74
      Width = 237
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object EditPais: TEdit
      Left = 8
      Top = 124
      Width = 150
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object EditEmail: TEdit
      Left = 164
      Top = 124
      Width = 237
      Height = 21
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object BitBtnAbrirCSV: TBitBtn
    Left = 8
    Top = 5
    Width = 120
    Height = 25
    Caption = 'Abrir CSV'
    TabOrder = 2
    OnClick = BitBtnAbrirCSVClick
  end
  object BitBtnAbrirXML: TBitBtn
    Left = 134
    Top = 5
    Width = 120
    Height = 25
    Caption = 'Abrir XML'
    TabOrder = 3
    OnClick = BitBtnAbrirXMLClick
  end
  object OpenDialog: TOpenDialog
    Left = 280
  end
end
