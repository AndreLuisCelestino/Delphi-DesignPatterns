object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Chain of Responsibility - Andr'#233' Celestino'
  ClientHeight = 236
  ClientWidth = 418
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
  object LabelArquivo: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Arquivo:'
  end
  object EditArquivo: TEdit
    Left = 8
    Top = 24
    Width = 401
    Height = 21
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    Text = '< Clique no bot'#227'o abaixo para selecionar o arquivo >'
  end
  object BitBtnProcessarInclusao: TBitBtn
    Left = 136
    Top = 50
    Width = 145
    Height = 25
    Caption = 'Processar Inclus'#227'o'
    TabOrder = 1
    OnClick = BitBtnProcessarInclusaoClick
  end
  object DBGrid: TDBGrid
    Left = 8
    Top = 80
    Width = 401
    Height = 148
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Codigo'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 155
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end>
  end
  object OpenDialog: TOpenDialog
    Left = 176
    Top = 168
  end
  object ClientDataSet: TClientDataSet
    PersistDataPacket.Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D0006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      0200320006436964616465010049000000010005574944544802000200280000
      00}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 168
    object ClientDataSetCodigo: TIntegerField
      FieldName = 'Codigo'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object ClientDataSetNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSetCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 112
    Top = 168
  end
end
