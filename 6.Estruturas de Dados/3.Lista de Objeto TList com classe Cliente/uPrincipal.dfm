object Form1: TForm1
  Left = 497
  Top = 139
  Width = 343
  Height = 224
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdicionar: TButton
    Left = 48
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnAdicionar'
    TabOrder = 0
    OnClick = btnAdicionarClick
  end
  object btnRemover: TButton
    Left = 128
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnRemover'
    TabOrder = 1
    OnClick = btnRemoverClick
  end
  object btnContar: TButton
    Left = 208
    Top = 16
    Width = 75
    Height = 25
    Caption = 'btnContar'
    TabOrder = 2
    OnClick = btnContarClick
  end
  object edtIDCliente: TEdit
    Left = 56
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edtIDCliente'
  end
  object edtNome: TEdit
    Left = 56
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edtNome'
  end
  object edtCNPJ: TEdit
    Left = 56
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'edtCNPJ'
  end
end
