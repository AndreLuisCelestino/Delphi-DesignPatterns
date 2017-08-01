object fFormulario: TfFormulario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exemplo de Observer - Andr'#233' Celestino'
  ClientHeight = 364
  ClientWidth = 640
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
  object Bevel1: TBevel
    Left = 334
    Top = 109
    Width = 300
    Height = 10
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 334
    Top = 240
    Width = 300
    Height = 10
    Shape = bsTopLine
  end
  inline FrameCadastroOperacoes: TFrameCadastroOperacoes
    Left = 0
    Top = 0
    Width = 328
    Height = 364
    TabOrder = 0
    ExplicitHeight = 364
  end
  inline FrameSaldo: TFrameSaldo
    Left = 334
    Top = 0
    Width = 300
    Height = 100
    TabOrder = 1
    ExplicitLeft = 334
    ExplicitHeight = 100
  end
  inline FrameLog: TFrameLog
    Left = 334
    Top = 247
    Width = 300
    Height = 110
    TabOrder = 2
    ExplicitLeft = 334
    ExplicitTop = 247
  end
  inline FrameAgrupamento: TFrameAgrupamento
    Left = 334
    Top = 117
    Width = 300
    Height = 110
    TabOrder = 3
    ExplicitLeft = 334
    ExplicitTop = 117
  end
end
