object fFormulario: TfFormulario
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Flyweight - Andr'#233' Celestino'
  ClientHeight = 305
  ClientWidth = 433
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
  object DBGrid: TDBGrid
    Left = 8
    Top = 8
    Width = 417
    Height = 241
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        Width = 220
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pais'
        Title.Alignment = taCenter
        Title.Caption = 'Pa'#237's'
        Width = 110
        Visible = True
      end>
  end
  object BitBtnExportarComFlyweight: TBitBtn
    Left = 8
    Top = 256
    Width = 205
    Height = 41
    Caption = 'Exportar Cart'#245'es com Flyweight :)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtnExportarComFlyweightClick
  end
  object BitBtnExportarSemFlyweight: TBitBtn
    Left = 219
    Top = 256
    Width = 205
    Height = 41
    Caption = 'Exportar Cart'#245'es sem Flyweight :('
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtnExportarSemFlyweightClick
  end
  object ClientDataSet: TClientDataSet
    PersistDataPacket.Data = {
      5B0000009619E0BD0100000018000000030000000000030000005B0006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      02003200045061697301004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 192
    object ClientDataSetCodigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Codigo'
      DisplayFormat = '000'
    end
    object ClientDataSetNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetPais: TStringField
      FieldName = 'Pais'
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 112
    Top = 192
  end
end
