object fTela: TfTela
  Left = 193
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Factory Method - Andr'#233' Celestino'
  ClientHeight = 376
  ClientWidth = 456
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
  object lbValor: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Valor Atual:'
  end
  object lbPrazoPagamento: TLabel
    Left = 216
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Prazo de Pagamento:'
  end
  object lbQtdeParcelas: TLabel
    Left = 122
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Qtde Parcelas:'
  end
  object cmbPrazoPagamento: TComboBox
    Left = 216
    Top = 24
    Width = 105
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    Items.Strings = (
      'Mensal'
      'Semestral'
      'Anual')
  end
  object edtValor: TEdit
    Left = 8
    Top = 24
    Width = 100
    Height = 21
    MaxLength = 10
    TabOrder = 0
    OnKeyPress = edtValorKeyPress
  end
  object btnGerarProjecao: TBitBtn
    Left = 332
    Top = 18
    Width = 120
    Height = 25
    Caption = 'Gerar Proje'#231#227'o'
    TabOrder = 3
    OnClick = btnGerarProjecaoClick
  end
  object Memo: TMemo
    Left = 8
    Top = 56
    Width = 443
    Height = 313
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object edtQtdeParcelas: TEdit
    Left = 122
    Top = 24
    Width = 73
    Height = 21
    MaxLength = 2
    TabOrder = 1
    OnKeyPress = edtQtdeParcelasKeyPress
  end
end
