object Form1: TForm1
  Left = 192
  Top = 125
  Width = 499
  Height = 381
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
    Width = 483
    Height = 342
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
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 104
        Width = 113
        Height = 25
        Caption = 'Files Datas'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 8
        Top = 136
        Width = 113
        Height = 25
        Caption = 'FileSize'
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 8
        Top = 168
        Width = 113
        Height = 25
        Caption = 'DiskFree/Size'
        TabOrder = 5
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 128
        Top = 8
        Width = 113
        Height = 25
        Caption = 'IO Result'
        TabOrder = 6
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 128
        Top = 40
        Width = 113
        Height = 25
        Caption = 'PromptForFileName'
        TabOrder = 7
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 128
        Top = 72
        Width = 113
        Height = 25
        Caption = 'InputBox'
        TabOrder = 8
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 128
        Top = 104
        Width = 113
        Height = 25
        Caption = 'InputQuery'
        TabOrder = 9
        OnClick = Button10Click
      end
      object Button11: TButton
        Left = 128
        Top = 136
        Width = 113
        Height = 25
        Caption = 'ShowMessageFmt'
        TabOrder = 10
        OnClick = Button11Click
      end
      object Button12: TButton
        Left = 128
        Top = 168
        Width = 113
        Height = 25
        Caption = 'ShowMessagePos'
        TabOrder = 11
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 8
        Top = 200
        Width = 113
        Height = 25
        Caption = 'TOpenDialog single'
        TabOrder = 12
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 8
        Top = 232
        Width = 113
        Height = 25
        Caption = 'TOpenDialog MultFiles'
        TabOrder = 13
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 8
        Top = 264
        Width = 113
        Height = 25
        Caption = 'TSaveDialog'
        TabOrder = 14
        OnClick = Button15Click
      end
    end
  end
end
