object FrameLog: TFrameLog
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
    Caption = 'Log de Opera'#231#245'es'
    ExplicitWidth = 87
  end
  object MemoLog: TMemo
    Left = 0
    Top = 13
    Width = 300
    Height = 97
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
end
