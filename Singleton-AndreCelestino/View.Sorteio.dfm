object fSorteio: TfSorteio
  Left = 193
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sorteio'
  ClientHeight = 310
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LabelParticipantes: TLabel
    Left = 8
    Top = 8
    Width = 66
    Height = 13
    Caption = 'Participantes:'
  end
  object LabelSorteado: TLabel
    Left = 8
    Top = 264
    Width = 48
    Height = 13
    Caption = 'Sorteado:'
  end
  object BitBtnSortear: TBitBtn
    Left = 80
    Top = 224
    Width = 130
    Height = 33
    Caption = 'Sortear!'
    TabOrder = 0
    OnClick = BitBtnSortearClick
  end
  object EditSorteado: TEdit
    Left = 8
    Top = 280
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object ListBox: TListBox
    Left = 8
    Top = 24
    Width = 273
    Height = 193
    ItemHeight = 13
    TabOrder = 2
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 96
  end
end
