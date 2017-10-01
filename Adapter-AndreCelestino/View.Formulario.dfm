object fFormulario: TfFormulario
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Adapter - Andr'#233' Celestino'
  ClientHeight = 89
  ClientWidth = 709
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
  object lbCEP: TLabel
    Left = 10
    Top = 37
    Width = 23
    Height = 13
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbCidade: TLabel
    Left = 402
    Top = 62
    Width = 41
    Height = 13
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbBairro: TLabel
    Left = 406
    Top = 36
    Width = 37
    Height = 13
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbLogradouro: TLabel
    Left = 375
    Top = 9
    Width = 68
    Height = 13
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EditCidade: TEdit
    Left = 448
    Top = 57
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 5
  end
  object EditBairro: TEdit
    Left = 448
    Top = 32
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 4
  end
  object btnViaCEP: TBitBtn
    Left = 136
    Top = 13
    Width = 220
    Height = 25
    Caption = 'Consultar CEP pelo ViaCEP'
    TabOrder = 1
    OnClick = btnViaCEPClick
  end
  object btnCorreios: TBitBtn
    Left = 136
    Top = 45
    Width = 220
    Height = 25
    Caption = 'Consultar CEP pelos Correios (Adaptado)'
    TabOrder = 2
    OnClick = btnCorreiosClick
  end
  object EditCEP: TMaskEdit
    Left = 40
    Top = 33
    Width = 73
    Height = 21
    EditMask = '99999-999;0;_'
    MaxLength = 9
    TabOrder = 0
    Text = ''
  end
  object EditLogradouro: TEdit
    Left = 448
    Top = 6
    Width = 249
    Height = 21
    Color = 13828095
    ReadOnly = True
    TabOrder = 3
  end
end
