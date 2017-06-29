object fCadastroMembro: TfCadastroMembro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adicionar Membro'
  ClientHeight = 99
  ClientWidth = 340
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
  object LabelNome: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object LabelPerfil: TLabel
    Left = 184
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Perfil:'
  end
  object Bevel: TBevel
    Left = 8
    Top = 49
    Width = 321
    Height = 9
    Shape = bsTopLine
  end
  object EditNome: TEdit
    Left = 8
    Top = 22
    Width = 170
    Height = 21
    TabOrder = 0
  end
  object ComboBoxPerfil: TComboBox
    Left = 184
    Top = 22
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'Usu'#225'rio'
    Items.Strings = (
      'Usu'#225'rio'
      'Administrador')
  end
  object BitBtnOK: TBitBtn
    Left = 67
    Top = 66
    Width = 100
    Height = 25
    Caption = 'OK'
    Default = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    TabOrder = 2
    OnClick = BitBtnOKClick
  end
  object BitBtnCancelar: TBitBtn
    Left = 173
    Top = 65
    Width = 100
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
