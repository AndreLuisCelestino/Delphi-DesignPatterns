object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Proxy - Andr'#233' Celestino'
  ClientHeight = 350
  ClientWidth = 346
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
  object LabelOrigem: TLabel
    Left = 10
    Top = 20
    Width = 38
    Height = 13
    Caption = 'Origem:'
  end
  object LabelDestino: TLabel
    Left = 8
    Top = 53
    Width = 40
    Height = 13
    Caption = 'Destino:'
  end
  object BitBtnCalcularDistancia: TBitBtn
    Left = 56
    Top = 128
    Width = 244
    Height = 25
    Caption = 'Calcular Dist'#226'ncia'
    TabOrder = 5
    OnClick = BitBtnCalcularDistanciaClick
  end
  object ComboBoxEstadoOrigem: TComboBox
    Left = 240
    Top = 16
    Width = 60
    Height = 21
    MaxLength = 2
    TabOrder = 1
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object EditCidadeOrigem: TEdit
    Left = 56
    Top = 16
    Width = 180
    Height = 21
    MaxLength = 30
    TabOrder = 0
  end
  object EditCidadeDestino: TEdit
    Left = 56
    Top = 48
    Width = 180
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object ComboBoxEstadoDestino: TComboBox
    Left = 240
    Top = 48
    Width = 60
    Height = 21
    MaxLength = 2
    TabOrder = 3
    Items.Strings = (
      'AC'
      'AL'
      'AP'
      'AM'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MT'
      'MS'
      'MG'
      'PA'
      'PB'
      'PR'
      'PE'
      'PI'
      'RJ'
      'RN'
      'RS'
      'RO'
      'RR'
      'SC'
      'SP'
      'SE'
      'TO')
  end
  object MemoHistorico: TMemo
    Left = 8
    Top = 168
    Width = 329
    Height = 177
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object RadioGroupCache: TRadioGroup
    Left = 56
    Top = 80
    Width = 244
    Height = 41
    Caption = 'Usar Cache?'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Sim'
      'N'#227'o')
    TabOrder = 4
  end
end
