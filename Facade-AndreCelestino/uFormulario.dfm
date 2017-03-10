object fFormulario: TfFormulario
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Fa'#231'ade - Andr'#233' Celestino'
  ClientHeight = 433
  ClientWidth = 681
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
  object LabelCliente: TLabel
    Left = 8
    Top = 4
    Width = 119
    Height = 13
    Caption = 'Selecione um cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelProduto: TLabel
    Left = 352
    Top = 4
    Width = 126
    Height = 13
    Caption = 'Selecione um produto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelHistorico: TLabel
    Left = 158
    Top = 172
    Width = 359
    Height = 13
    Caption = 
      '------------------------------ Hist'#243'rico -----------------------' +
      '------- '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object BitBtnCalcularValorDaVenda: TBitBtn
    Left = 247
    Top = 122
    Width = 187
    Height = 38
    Caption = 'Calcular Valor de Venda'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE602AAE602AAE602AAE60
      2AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AAE
      602AAE602AAE602AAE602AAE602AAE602AAE602AAE602AFF00FFBF8200EEB669
      FFC683FFC279FFBF70FFBC66FFB85CFFB552FFB249FFAF3FFFAB35FFA82BFFA5
      22FFA118FF9E0FFF9B05FF9901FF9901FF9901FF9901FF9901FF9901EB8B0BAE
      602ACD921DFFCB92FFC789F2BB7ACD9E65E6AC64FFBA62FFB758E6A44BCD9141
      E69E3AFFAA31FFA627FFA31EFFA015FF9C0AFF9A03FF9901FF9901FF9901FF99
      01FF9901FF9901AE602AD39926FFCC97D9AE7E353537353537353537A78151D9
      A057353537353537353537CD8E35FFA82D423C36353537353537353537353537
      353537353537423B34E68D08FF9901AE602AD59B26FFCD99FFCB94A788669A7D
      5C9A7B57F2B569F2B361A77F4B9A7544A77B40F2A63CFFAA31A775309A6D2C9A
      6B279A69229A681D9A671C9A671CA76D19FF9901FF9901AE602AD79D26FFCD99
      FFCD98E6B784CDA375D9A86FFFC072FFBD69D9A057CD964DD99B47FFAF42FFAC
      38CE9554BF895BCF8D45FF9F11FF9B07CF8631BF8041CF8631FF9901FF9901AE
      602AD99F26FFCD99D9B187353537353537353537A7845ACD9C61353537353537
      353537C08B449F80870033FF0033FF0033FFBF85508F6F780033FF0033FF0033
      FFCF8631FF9901AE602ADBA126FFCD99FFCD99B394749A8065A78765F2BB7AFF
      C175B38A589A784CB3864BF2AB4BEFA84F9F7F84806F999F7B78FFA31CEF9922
      8F6E758067819F7360FF9901FF9901AE602ADDA326FFCD99FFCD99D9B187A78A
      6CCDA375FFC683FFC279CD9C619A784ECE9554FFB552FFB249BF8F6F806F99BF
      8A60FFA522FFA118BF834A806781BF8041FF9901FF9901AE602ADFA526FFCD99
      CEA9823535373535373535379A7E5FCDA16E353537353537353537B3864B9F84
      920033FF0033FF0033FFBF895C9F79730033FF0033FF0033FFBF8041FF9901AE
      602AE1A726FFCD99FFCD99D9B1879A8168C09D79FFC98EFFC684C097669A7A55
      C09259FFB95EFFB552AF8B838071A0BF8E69FFA82DFFA523AF7F62806988BF81
      45FF9901FF9901AE602AE3A926FFCD99FFCD99FFCD99FFCD99FFCD99FFCB94FF
      C88AFFC47FFFC177FFBE6DFFBB63FFB758FFB551FFB146FFAE3CFFAA33FFA729
      FFA41FFFA015FF9D0DFF9A03FF9901AE602AE5AB26FFCD99FFD19EFFDAB3FFDA
      B3FFDAB3FFD9B1FFD6A8FFD6A8FFD19EFFD095FFCD8EFFCB86FFC374FFB34CFF
      AF42FFAC38FFA92EFFA525FFA21BFF9F11FF9C09FF9901AE602AE7AD26FFCD99
      CEA9828FE1D88FE1D88FE1D88FE1D88FE1D88FE1D88FE1D88FE1D88FE1D88FE1
      D8DFE4CAFFB551E6A246D9973DCD8E35CD8B2ECD8826D98D1DFF9D0DFF9A03AE
      602AE9AE26FFCD99BF9A736AD7CB6AD7CB6AD7CB6AD7CB6AD7CB6AD7CB6AD7CB
      6AD7CB6AD7CB6AD7CBDFE4CAFFB656C08B44B3823FA77838B37E329A6E2FCD87
      23FF9F13FF9C09AE602AE7AC1DFFCD99EFC08FBF9A73BF9A73BF9A73BF9A73BF
      9A73BF9971BF976ABF9463BF925CBF8F54EFB973FFB85CF2AD51F2AA47FFAF3F
      E69D36CD8B2EFFA522FFA118FF9E0FAE602AE2A400FAC57CFFCD99FFCD99FFCD
      99FFCD99FFCD99FFCD99FFCD99FFCB92FFC789FFC47FFFC175FFBE6DFFBA62FF
      B758FFB44EFFB146FFAD3BFFAA31FFA627FFA31EE99217A66622FF00FFE4A70A
      EDB339F0B84DEEB64DEEB64DEBB44DE9B24DE9B24DE6AF4BE4AA44E4AA44E1A4
      3BE1A43BDF9F33DD9B2EDC9829DB9525DA9220D88F1BD78C1BC67F18AA6B1AFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 0
    OnClick = BitBtnCalcularValorDaVendaClick
  end
  object DBGridClientes: TDBGrid
    Left = 8
    Top = 20
    Width = 320
    Height = 93
    DataSource = DataSourceClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
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
        FieldName = 'Cliente'
        Title.Alignment = taCenter
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fidelidade'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
      end>
  end
  object DBGridProdutos: TDBGrid
    Left = 353
    Top = 23
    Width = 320
    Height = 93
    DataSource = DataSourceProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        FieldName = 'Produto'
        Title.Alignment = taCenter
        Width = 145
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Preco'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o (USD)'
        Width = 75
        Visible = True
      end>
  end
  object Memo: TMemo
    Left = 142
    Top = 187
    Width = 397
    Height = 237
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object ClientDataSetClientes: TClientDataSet
    PersistDataPacket.Data = {
      580000009619E0BD010000001800000003000000000003000000580006436F64
      69676F040001000000000007436C69656E746501004900000001000557494454
      480200020032000A466964656C696461646502000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 52
    Top = 65
    object ClientDataSetClientesCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSetClientesCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object ClientDataSetClientesFidelidade: TSmallintField
      FieldName = 'Fidelidade'
      OnGetText = ClientDataSetClientesFidelidadeGetText
    end
  end
  object ClientDataSetProdutos: TClientDataSet
    PersistDataPacket.Data = {
      530000009619E0BD010000001800000003000000000003000000530006436F64
      69676F04000100000000000750726F6475746F01004900000001000557494454
      4802000200320005507265636F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 66
    object ClientDataSetProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSetProdutosProduto: TStringField
      FieldName = 'Produto'
      Size = 50
    end
    object ClientDataSetProdutosPreco: TFloatField
      FieldName = 'Preco'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object DataSourceClientes: TDataSource
    DataSet = ClientDataSetClientes
    Left = 163
    Top = 65
  end
  object DataSourceProdutos: TDataSource
    DataSet = ClientDataSetProdutos
    Left = 516
    Top = 66
  end
end
