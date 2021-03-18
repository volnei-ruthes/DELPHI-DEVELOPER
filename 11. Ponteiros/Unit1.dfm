object Form1: TForm1
  Left = 192
  Top = 125
  Width = 357
  Height = 220
  Caption = 'Ponteiros'
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
    Left = 216
    Top = 104
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Exemplo 01'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 112
    Top = 8
    Width = 217
    Height = 161
    Lines.Strings = (
      'Os ponteiros s'#227'o um tipo especial de '
      'vari'#225'vel. Como uma metavari'#225'vel. '
      'Eles podem apontar para outras vari'#225'veis ou '
      'para a mem'#243'ria. '
      ''
      'Voc'#234' pode usar um ponteiro '
      'de registro, por exemplo, para apontar para '
      'um bloco de mem'#243'ria onde armazenou '
      'muitos dados de registro. Em seguida, voc'#234' '
      'usaria o ponteiro como se fosse uma '
      'vari'#225'vel de registro.')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Exemplo 02'
    TabOrder = 2
    OnClick = Button2Click
  end
end
