object Form1: TForm1
  Left = 317
  Top = 195
  Width = 268
  Height = 244
  Caption = 'TIPs Enumerado in Delphi'
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
    Left = 20
    Top = 16
    Width = 216
    Height = 13
    Caption = 'EXEMPLO DE TIPOS ENUMERADOS '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 88
    Width = 193
    Height = 25
    Caption = 'Tipo Enumerado simples'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 40
    Top = 48
    Width = 161
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'ComboBox1'
  end
  object Button2: TButton
    Left = 24
    Top = 128
    Width = 193
    Height = 25
    Caption = 'Verifica se e weekend '
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 168
    Width = 193
    Height = 25
    Caption = 'Verifica is weekend com case '
    TabOrder = 3
    OnClick = Button3Click
  end
end
