object Form1: TForm1
  Left = 192
  Top = 125
  Width = 293
  Height = 228
  Caption = 'TYPES ARRAYS DELPHI'
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
    Left = 40
    Top = 8
    Width = 207
    Height = 20
    Caption = 'TYPES ARRAYS DELPHI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 48
    Width = 225
    Height = 25
    Caption = 'DEFINITION'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 80
    Width = 225
    Height = 25
    Caption = '1. STATIC ARRAY'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 112
    Width = 225
    Height = 25
    Caption = '2. DYNAMIC ARRAY'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 144
    Width = 225
    Height = 25
    Caption = '3. OPEN ARRAY'
    TabOrder = 3
    OnClick = Button4Click
  end
end
