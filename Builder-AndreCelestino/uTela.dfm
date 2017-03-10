object fTela: TfTela
  Left = 328
  Top = 182
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Builder - Andr'#233' Celestino'
  ClientHeight = 276
  ClientWidth = 749
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
  object LabelTipoCesta: TLabel
    Left = 5
    Top = 10
    Width = 70
    Height = 13
    Caption = 'Tipo da Cesta:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LabelProdutos: TLabel
    Left = 381
    Top = 16
    Width = 223
    Height = 13
    Caption = 'Produtos cadastrados (apenas para consulta):'
  end
  object DBGrid: TDBGrid
    Left = 380
    Top = 32
    Width = 364
    Height = 240
    DataSource = DataSourceProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 78
        Visible = True
      end>
  end
  object MemoDadosCesta: TMemo
    Left = 4
    Top = 32
    Width = 361
    Height = 240
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ComboBoxTipoCestas: TComboBox
    Left = 80
    Top = 6
    Width = 145
    Height = 21
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      'Cesta B'#225'sica'
      'Cesta Completa'
      'Cesta Especial')
  end
  object BitBtnMontarCesta: TBitBtn
    Left = 236
    Top = 4
    Width = 100
    Height = 25
    Caption = 'Montar Cesta!'
    TabOrder = 3
    OnClick = BitBtnMontarCestaClick
  end
  object DataSourceProdutos: TDataSource
    DataSet = DataModuleProdutos.ClientDataSetProdutos
    Left = 428
    Top = 224
  end
end
