object Form1: TForm1
  Left = 277
  Top = 150
  Width = 928
  Height = 480
  Caption = 'TDATETIME - DATES and TIMES'
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
    Width = 912
    Height = 441
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Introdu'#231#227'o'
      object Label1: TLabel
        Left = 60
        Top = 8
        Width = 781
        Height = 16
        Caption = 
          ' TDateTime is defined in the System unit. Date constants and rou' +
          'tines are defined in: SysUtils and DateUtils units.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 39
        Width = 159
        Height = 13
        Caption = 'Data atual, ontem, Amanha.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 8
        Top = 95
        Width = 116
        Height = 13
        Caption = 'Nomea'#231#227'o de Datas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 143
        Width = 108
        Height = 13
        Caption = 'Nomea'#231#227'o de Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 191
        Width = 219
        Height = 13
        Caption = 'Formatando e mostrando datas e times'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 239
        Width = 152
        Height = 13
        Caption = 'Date and time calculations'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button1: TButton
        Left = 8
        Top = 56
        Width = 169
        Height = 25
        Caption = 'Exemplo no fonte'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 112
        Width = 169
        Height = 25
        Caption = 'Short and long month names'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 8
        Top = 160
        Width = 169
        Height = 25
        Caption = 'Short and long day names'
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 8
        Top = 208
        Width = 169
        Height = 25
        Caption = 'default  formatting options'
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 8
        Top = 256
        Width = 169
        Height = 25
        Caption = 'Exemplos no fonte'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
  end
end
