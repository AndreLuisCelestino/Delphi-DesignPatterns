object FrameSaldo: TFrameSaldo
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
    Caption = 'Balan'#231'o Financeiro'
    ExplicitWidth = 89
  end
  object LabelCreditos: TLabel
    Left = 6
    Top = 31
    Width = 50
    Height = 13
    Caption = 'Cr'#233'ditos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelDebitos: TLabel
    Left = 6
    Top = 51
    Width = 46
    Height = 13
    Caption = 'D'#233'bitos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelSaldo: TLabel
    Left = 6
    Top = 72
    Width = 34
    Height = 13
    Caption = 'Saldo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelValorDebitos: TLabel
    Left = 265
    Top = 51
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelValorCreditos: TLabel
    Left = 265
    Top = 31
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelValorSaldo: TLabel
    Left = 265
    Top = 72
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
end
