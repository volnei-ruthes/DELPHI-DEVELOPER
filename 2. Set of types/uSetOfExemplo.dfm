object Form1: TForm1
  Left = 192
  Top = 125
  Width = 288
  Height = 220
  Caption = 'TIPs Conjuntos Type'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 66
    Top = 16
    Width = 139
    Height = 16
    Caption = 'EXEMPLOS SET OF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 40
    Top = 80
    Width = 193
    Height = 25
    Caption = 'OPERA'#199#213'ES DE CONJUNTOS'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 120
    Width = 193
    Height = 25
    Caption = 'Exemplo Weekend'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 48
    Width = 193
    Height = 25
    Caption = 'FOR varrendo um Conjunto'
    TabOrder = 2
    OnClick = Button3Click
  end
end
