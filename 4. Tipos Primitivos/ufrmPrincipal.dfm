object Form1: TForm1
  Left = 355
  Top = 214
  Width = 317
  Height = 270
  Caption = 'TIPOS PRIMITIVOS DE DADOS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 259
    Height = 20
    Caption = 'TIPOS PRIMITIVOS DE DADOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 128
    Width = 161
    Height = 25
    Caption = 'NUMBERS TYPES '
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 160
    Width = 161
    Height = 25
    Caption = 'TEXT TYPES'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 32
    Width = 161
    Height = 25
    Caption = 'STRING, CHAR TYPES'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 64
    Width = 161
    Height = 25
    Caption = 'STRINGS OPERATIONS'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 96
    Width = 161
    Height = 25
    Caption = 'CONVERSIONS FROM / TO'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 192
    Width = 161
    Height = 25
    Caption = 'FILES TYPES'
    TabOrder = 5
    OnClick = Button6Click
  end
end
