object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Template Method - Andr'#233' Celestino'
  ClientHeight = 312
  ClientWidth = 541
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
  object DBGrid: TDBGrid
    Left = 2
    Top = 84
    Width = 535
    Height = 224
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel: TPanel
    Left = 2
    Top = 4
    Width = 535
    Height = 74
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object LabelConsulta: TLabel
      Left = 11
      Top = 14
      Width = 46
      Height = 13
      Caption = 'Consulta:'
    end
    object RadioGroupTipo: TRadioGroup
      Left = 196
      Top = 11
      Width = 193
      Height = 48
      Caption = 'Tipo: '
      Columns = 2
      Items.Strings = (
        'Reposit'#243'rios'
        'Usu'#225'rios')
      TabOrder = 1
    end
    object EditConsulta: TEdit
      Left = 11
      Top = 30
      Width = 168
      Height = 21
      MaxLength = 100
      TabOrder = 0
    end
    object BitBtnConsultar: TBitBtn
      Left = 408
      Top = 22
      Width = 97
      Height = 35
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = BitBtnConsultarClick
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 408
    Top = 257
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 480
    Top = 256
  end
end
