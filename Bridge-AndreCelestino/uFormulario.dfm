object fFormulario: TfFormulario
  Left = 5
  Top = 83
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Bridge - Andr'#233' Celestino'
  ClientHeight = 259
  ClientWidth = 817
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
  object Bevel: TBevel
    Left = 408
    Top = 24
    Width = 12
    Height = 227
    Shape = bsLeftLine
  end
  object LabelClientes: TLabel
    Left = 8
    Top = 8
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
  object LabelProdutos: TLabel
    Left = 424
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Produtos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridClientes: TDBGrid
    Left = 8
    Top = 24
    Width = 385
    Height = 200
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Title.Alignment = taCenter
        Width = 135
        Visible = True
      end>
  end
  object BitBtnExportarClientesXLS: TBitBtn
    Left = 8
    Top = 226
    Width = 120
    Height = 25
    Caption = 'Exportar para XLS'
    TabOrder = 1
    OnClick = BitBtnExportarClientesXLSClick
  end
  object BitBtnExportarClientesHTML: TBitBtn
    Left = 136
    Top = 226
    Width = 120
    Height = 25
    Caption = 'Exportar para HTML'
    TabOrder = 2
    OnClick = BitBtnExportarClientesHTMLClick
  end
  object DBGridProdutos: TDBGrid
    Left = 424
    Top = 24
    Width = 385
    Height = 200
    DataSource = DataSourceProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 205
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Estoque'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end>
  end
  object BitBtnExportarProdutosXLS: TBitBtn
    Left = 424
    Top = 226
    Width = 120
    Height = 25
    Caption = 'Exportar para XLS'
    TabOrder = 4
    OnClick = BitBtnExportarProdutosXLSClick
  end
  object BitBtnExportarProdutosHTML: TBitBtn
    Left = 552
    Top = 226
    Width = 120
    Height = 25
    Caption = 'Exportar para HTML'
    TabOrder = 5
    OnClick = BitBtnExportarProdutosHTMLClick
  end
  object ClientDataSetClientes: TClientDataSet
    PersistDataPacket.Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D0006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      0200320006436964616465010049000000010005574944544802000200320000
      00}
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Codigo'
    Params = <>
    Left = 12
    Top = 189
    object ClientDataSetClientesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSetClientesNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetClientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 44
    Top = 189
  end
  object ClientDataSetProdutos: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD010000001800000003000000000003000000570006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      445448020002003200074573746F71756504000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 190
    object ClientDataSetProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSetProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ClientDataSetProdutosEstoque: TIntegerField
      FieldName = 'Estoque'
    end
  end
  object DataSourceProdutos: TDataSource
    DataSet = ClientDataSetProdutos
    Left = 464
    Top = 190
  end
end
