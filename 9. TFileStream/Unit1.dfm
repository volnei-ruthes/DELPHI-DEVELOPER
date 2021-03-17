object Form1: TForm1
  Left = 192
  Top = 125
  Width = 545
  Height = 415
  Caption = 'Exemplo TFileStream'
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
    Width = 529
    Height = 376
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Exemplo 1'
      object Label1: TLabel
        Left = 176
        Top = 8
        Width = 171
        Height = 20
        Caption = 'Exemplo TFileStream'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 32
        Top = 40
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 33
        Top = 84
        Width = 24
        Height = 13
        Caption = 'Fone'
      end
      object Button1: TButton
        Left = 32
        Top = 133
        Width = 121
        Height = 25
        Caption = 'Escreve no Arquivo'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 32
        Top = 56
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 32
        Top = 104
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object Button2: TButton
        Left = 32
        Top = 168
        Width = 121
        Height = 25
        Caption = 'L'#234' o Arquivo'
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Exemplo 2'
      ImageIndex = 1
    end
  end
  object odFile: TOpenDialog
    Left = 164
    Top = 192
  end
  object sdFile: TSaveDialog
    Left = 164
    Top = 152
  end
end
