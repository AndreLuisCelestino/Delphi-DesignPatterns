object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Memento - Andr'#233' Celestino'
  ClientHeight = 324
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LabelHistoricoAlteracoes: TLabel
    Left = 10
    Top = 6
    Width = 134
    Height = 13
    Caption = 'Hist'#243'rico de Altera'#231#245'es:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelTitulo: TLabel
    Left = 175
    Top = 19
    Width = 35
    Height = 13
    Caption = 'T'#237'tulo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBoxHistoricoAlteracoes: TListBox
    Left = 8
    Top = 22
    Width = 161
    Height = 296
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxHistoricoAlteracoesClick
  end
  object RichEditTexto: TRichEdit
    Left = 175
    Top = 106
    Width = 439
    Height = 175
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Ol'#225'!'
      ''
      
        'Desde 2016, o blog AndreCelestino.com est'#225' publicando alguns art' +
        'igos relacionados a '
      'Design Patterns com a linguagem de programa'#231#227'o Delphi.'
      ''
      
        'Os artigos trazem exemplos mais pr'#243'ximos da realidade para que o' +
        ' desenvolvedor tenha '
      'facilidade de identificar situa'#231#245'es reais para aplic'#225'-los.'
      ''
      
        'A s'#233'rie de artigos j'#225' est'#225' quase no fim. Quando sobrar um tempin' +
        'ho, acesse o site, avalie '
      'os artigos e deixe um coment'#225'rio!')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    Zoom = 100
    OnClick = RichEditTextoClick
    OnKeyUp = RichEditTextoKeyUp
  end
  object EditTitulo: TEdit
    Left = 175
    Top = 35
    Width = 439
    Height = 21
    TabOrder = 2
    Text = 'Dicas de artigos sobre Design Patterns com Delphi'
  end
  object PanelBarraFerramentas: TPanel
    Left = 175
    Top = 62
    Width = 439
    Height = 36
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object SpeedButtonNegrito: TSpeedButton
      Left = 3
      Top = 3
      Width = 32
      Height = 28
      Hint = 'Aplicar negrito'
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButtonNegritoClick
    end
    object SpeedButtonItalico: TSpeedButton
      Left = 37
      Top = 3
      Width = 32
      Height = 28
      Hint = 'Aplicar it'#225'lico'
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButtonItalicoClick
    end
    object SpeedButtonSublinhado: TSpeedButton
      Left = 71
      Top = 3
      Width = 32
      Height = 28
      Hint = 'Aplicar sublinhado'
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButtonSublinhadoClick
    end
    object ColorBoxCor: TColorBox
      Left = 120
      Top = 6
      Width = 105
      Height = 22
      Style = [cbStandardColors, cbExtendedColors]
      TabOrder = 0
      OnSelect = ColorBoxCorSelect
    end
  end
  object BitBtnSalvar: TBitBtn
    Left = 312
    Top = 287
    Width = 161
    Height = 31
    Caption = 'Salvar Altera'#231#245'es'
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      08000000000040020000130B0000130B00000001000000010000942929009431
      31009C3131009C393900A53939009C4242009C4A4A00A54A4A00AD524A00B552
      4A00A5525200AD525200B5525200AD525A00AD5A5A00B55A5A00BD5A5A00C65A
      5A00CE636300CE6B6B00B5737300BD7B73009C7B7B009C848400AD848400B584
      8400C6848400AD8C8C00B58C8C00C6948C00AD949400C6949400A59C9C00B59C
      9C00D69C9C00BDA5A500D6A5A500D6ADA500CEADAD00D6ADAD00DEADAD00CEB5
      B500D6B5B500CEBDBD00DEBDBD00E7C6C600C6CEC600CECEC600CECECE00E7CE
      CE00E7D6CE00D6D6D600DED6D600EFD6D600DEDEDE00E7DEDE00EFEFEF00F7EF
      EF00F7F7EF00F7F7F700FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E3E3E3E3E
      3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E123E3E3E3E3E3E3E3E3E3E3E3E
      3E3E3E3E3E3E3E3E123E3E3E123E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E12
      3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
      0E0B071E2E2F2F2E2E2105050A3E3E3E3E3E3E3E3E3E3E1512130F1723313C3D
      3B290002110E3E3E3E3E3E3E3E3E3E1512120F160514373C3F2A0102100E3E3E
      3E3E3E3E3E3E3E1512120F1803032B383F2D0001100E3E3E3E3E3E3E3E3E3E15
      12120F1C060120333F2D0001100E3E3E3E3E3E3E3E3E3E151212101D1F191B23
      2D280404110E3E3E3E3E3E3E3E3E3E15121212121212121111121212130D3E3E
      3E3E3E3E3E3E3E150C0F1A242725272424252722120B3E3E3E3E3E3E3E3E3E15
      08313B3A3B3B3B3B3B3B3B2C110D3E3E3E3E3E3E3E3E3E1509353C3939393939
      39393B2C110D3E3E3E3E3E3E3E3E3E1509353833333333333333382C110D3E3E
      3E3E3E3E3E3E3E1509353834363636363634382C110D3E3E3E3E3E3E3E3E3E15
      09353A37373737373737382C110D3E3E3E3E3E3E3E3E3E150935383333333333
      3333382C110D3E3E3E3E3E3E3E3E3E1509323C393939393939393C2C110D3E3E
      3E3E3E3E3E3E3E3E082933303030303030303326073E3E3E3E3E3E3E3E3E3E3E
      3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E123E3E3E3E3E3E3E3E3E3E3E
      3E3E3E3E3E3E3E123E3E3E123E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E
      123E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E}
    TabOrder = 4
    OnClick = BitBtnSalvarClick
  end
end
