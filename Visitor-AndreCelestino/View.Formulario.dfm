object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Visitor - Andr'#233' Celestino'
  ClientHeight = 310
  ClientWidth = 596
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid: TStringGrid
    Tag = 5
    Left = 0
    Top = 65
    Width = 596
    Height = 204
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ColWidths = (
      200
      80
      90
      90
      110)
    RowHeights = (
      24
      24)
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 596
    Height = 65
    Align = alTop
    TabOrder = 0
    object LabelFuncao: TLabel
      Left = 167
      Top = 8
      Width = 39
      Height = 13
      Caption = 'Fun'#231#227'o:'
    end
    object LabelAdmissao: TLabel
      Left = 255
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Admiss'#227'o:'
    end
    object LabelSalario: TLabel
      Left = 366
      Top = 8
      Width = 36
      Height = 13
      Caption = 'Sal'#225'rio:'
    end
    object Bevel: TBevel
      Left = 489
      Top = 8
      Width = 7
      Height = 48
      Shape = bsRightLine
    end
    object LabelNome: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object EditNome: TEdit
      Left = 8
      Top = 23
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object DateTimePickerAdmissao: TDateTimePicker
      Left = 255
      Top = 23
      Width = 105
      Height = 21
      Date = 43001.982247476850000000
      Time = 43001.982247476850000000
      TabOrder = 2
    end
    object EditSalario: TEdit
      Left = 366
      Top = 23
      Width = 113
      Height = 21
      TabOrder = 3
    end
    object BitBtnAdicionar: TBitBtn
      Left = 511
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 4
      OnClick = BitBtnAdicionarClick
    end
    object ComboBoxFuncao: TComboBox
      Left = 167
      Top = 23
      Width = 82
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Funcion'#225'rio'
        'Gerente')
    end
  end
  object PanelBotoes: TPanel
    Left = 0
    Top = 269
    Width = 596
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtnSalario: TBitBtn
      Left = 111
      Top = 8
      Width = 185
      Height = 25
      Caption = 'Calcular Novos Sal'#225'rios'
      TabOrder = 0
      OnClick = BitBtnSalarioClick
    end
    object BitBtnSenioridade: TBitBtn
      Left = 302
      Top = 8
      Width = 185
      Height = 25
      Caption = 'Identificar Senioridade'
      TabOrder = 1
      OnClick = BitBtnSenioridadeClick
    end
  end
  object AdapterBindSource: TAdapterBindSource
    AutoActivate = True
    OnCreateAdapter = AdapterBindSourceCreateAdapter
    ScopeMappings = <>
    Left = 40
    Top = 216
  end
  object BindingsList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 124
    Top = 217
    object LinkGridToDataSourceAdapterBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource
      GridControl = StringGrid
      Columns = <
        item
          MemberName = 'Nome'
          Width = 200
        end
        item
          MemberName = 'Funcao'
          Header = 'Fun'#231#227'o'
          Width = 80
        end
        item
          MemberName = 'Admissao'
          Header = 'Admiss'#227'o'
          Width = 90
          CustomFormat = 'FormatDateTime('#39'dd/mm/yyyy'#39', %s)'
        end
        item
          MemberName = 'Salario'
          Header = 'Sal'#225'rio'
          Width = 90
          CustomFormat = 'Format('#39'%%.2f'#39', %s)'
        end
        item
          MemberName = 'Senioridade'
          Width = 110
        end>
    end
  end
end
