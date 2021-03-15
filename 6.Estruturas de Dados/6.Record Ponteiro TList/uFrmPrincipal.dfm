object Form1: TForm1
  Left = 186
  Top = 125
  Width = 395
  Height = 273
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
  object Label1: TLabel
    Left = 32
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 32
    Top = 63
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label3: TLabel
    Left = 34
    Top = 113
    Width = 82
    Height = 13
    Caption = 'Itens Adcionados'
  end
  object edtNome: TEdit
    Left = 32
    Top = 33
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object edtEmail: TEdit
    Left = 32
    Top = 80
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object btnAdicionar: TButton
    Left = 200
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = btnAdicionarClick
  end
  object btnMostrar: TButton
    Left = 288
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 3
    OnClick = btnMostrarClick
  end
  object btnExcluir: TButton
    Left = 288
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 4
    OnClick = btnExcluirClick
  end
  object btnConferir: TButton
    Left = 288
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Conferir'
    TabOrder = 5
    OnClick = btnConferirClick
  end
  object ListBox1: TListBox
    Left = 32
    Top = 128
    Width = 329
    Height = 97
    ItemHeight = 13
    TabOrder = 6
  end
  object btnModificar: TButton
    Left = 200
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Modificar'
    TabOrder = 7
    OnClick = btnModificarClick
  end
end
