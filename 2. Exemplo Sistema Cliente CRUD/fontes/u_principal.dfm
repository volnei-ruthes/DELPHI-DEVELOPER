object frm_principal: Tfrm_principal
  Left = 0
  Top = 0
  Caption = 'Sistema CRUD Cliente'
  ClientHeight = 515
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 496
    Width = 1070
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Sistema Gerenciamento de Clientes'
        Width = 210
      end
      item
        Alignment = taCenter
        Text = 'Desenvolvido por Volnei R. Ruthes'
        Width = 220
      end
      item
        Alignment = taCenter
        Text = 'Usu'#225'rio: Volnei R. Ruthes'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Data        '
        Width = 330
      end
      item
        Alignment = taCenter
        Text = 'Hora        '
        Width = 50
      end>
  end
  object pnl_topo: TPanel
    Left = 0
    Top = 0
    Width = 1070
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 16
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Abrir1: TMenuItem
        Caption = 'Abrir'
      end
      object Salvar1: TMenuItem
        Caption = 'Salvar'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 1024
    Top = 456
  end
end
