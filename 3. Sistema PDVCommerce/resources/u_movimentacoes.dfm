object frm_movimentacoes: Tfrm_movimentacoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 350
  ClientWidth = 711
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 352
    Top = 27
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel
    Left = 538
    Top = 27
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  object Label3: TLabel
    Left = 112
    Top = 27
    Width = 74
    Height = 13
    Caption = 'Entrada / Sa'#237'da'
  end
  object Label4: TLabel
    Left = 600
    Top = 327
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object lblTotal: TLabel
    Left = 634
    Top = 327
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label7: TLabel
    Left = 16
    Top = 327
    Width = 47
    Height = 13
    Caption = 'Entradas:'
  end
  object lblVlrEntradas: TLabel
    Left = 66
    Top = 327
    Width = 6
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 139
    Top = 327
    Width = 35
    Height = 13
    Caption = 'Sa'#237'das:'
  end
  object lblVlrSaidas: TLabel
    Left = 180
    Top = 327
    Width = 6
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dataInicial: TDateTimePicker
    Left = 411
    Top = 24
    Width = 95
    Height = 21
    Date = 43535.000000000000000000
    Time = 0.808893749999697300
    TabOrder = 0
    OnChange = dataInicialChange
  end
  object gridMovimentos: TDBGrid
    Left = 16
    Top = 64
    Width = 680
    Height = 257
    DataSource = DM.DataSourceMovimentos
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dataFinal: TDateTimePicker
    Left = 592
    Top = 24
    Width = 95
    Height = 21
    Date = 43535.000000000000000000
    Time = 0.808893749999697300
    TabOrder = 2
    OnChange = dataFinalChange
  end
  object cbEntradaSaida: TComboBox
    Left = 192
    Top = 24
    Width = 105
    Height = 21
    ItemIndex = 0
    TabOrder = 3
    Text = 'Tudo'
    OnChange = cbEntradaSaidaChange
    Items.Strings = (
      'Tudo'
      'Entrada'
      'Sa'#237'da')
  end
end
