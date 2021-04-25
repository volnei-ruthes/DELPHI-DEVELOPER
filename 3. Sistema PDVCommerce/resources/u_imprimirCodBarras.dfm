object FrmImprimirCodBarras: TFrmImprimirCodBarras
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Impress'#227'o de Codigo de Barras'
  ClientHeight = 1071
  ClientWidth = 792
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object imgCodBarra: TImage
    Left = 22
    Top = 48
    Width = 160
    Height = 65
    Stretch = True
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Altura'
  end
  object Label2: TLabel
    Left = 95
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Largura'
  end
  object Image1: TImage
    Left = 270
    Top = 48
    Width = 160
    Height = 65
    Stretch = True
  end
  object Image2: TImage
    Left = 518
    Top = 48
    Width = 160
    Height = 65
    Stretch = True
  end
  object edt_altura: TEdit
    Left = 43
    Top = 4
    Width = 46
    Height = 21
    TabOrder = 0
    OnChange = edt_alturaChange
    OnKeyPress = edt_alturaKeyPress
  end
  object edt_largura: TEdit
    Left = 136
    Top = 4
    Width = 46
    Height = 21
    TabOrder = 1
    OnChange = edt_larguraChange
    OnKeyPress = edt_larguraKeyPress
  end
  object Button1: TButton
    Left = 188
    Top = 2
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object PrintDialog1: TPrintDialog
    Left = 280
  end
end
