object FrameAgrupamento: TFrameAgrupamento
  Left = 0
  Top = 0
  Width = 300
  Height = 110
  TabOrder = 0
  object LabelTitulo: TLabel
    Left = 0
    Top = 0
    Width = 300
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = 'D'#233'bitos agrupados por categoria'
    ExplicitWidth = 157
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 13
    Width = 300
    Height = 97
    Align = alClient
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Categoria'
        Title.Alignment = taCenter
        Width = 185
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end>
  end
  object ClientDataSet: TClientDataSet
    PersistDataPacket.Data = {
      460000009619E0BD010000001800000002000000000003000000460009436174
      65676F726961010049000000010005574944544802000200140005546F74616C
      08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Total'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IndexTotal'
        DescFields = 'Total'
        Fields = 'Total'
        Options = [ixDescending]
      end>
    IndexName = 'IndexTotal'
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 64
    object ClientDataSetCategoria: TStringField
      FieldName = 'Categoria'
    end
    object ClientDataSetTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 248
    Top = 64
  end
end
