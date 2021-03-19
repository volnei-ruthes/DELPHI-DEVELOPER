object Form1: TForm1
  Left = 192
  Top = 125
  Width = 330
  Height = 298
  Caption = 'FILES'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 314
    Height = 259
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'FILES'
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 113
        Height = 25
        Caption = 'ExtractFiles'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 40
        Width = 113
        Height = 25
        Caption = 'ProcessPath'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 72
        Width = 113
        Height = 25
        Caption = 'Files Operations'
        TabOrder = 2
      end
    end
  end
end
