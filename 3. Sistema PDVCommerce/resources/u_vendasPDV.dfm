object frm_vendasPDV: Tfrm_vendasPDV
  Left = 0
  Top = 0
  Caption = 'Vendas (PDV)'
  ClientHeight = 567
  ClientWidth = 1095
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painel_pdv_esquerda: TPanel
    Left = 0
    Top = 0
    Width = 152
    Height = 567
    Align = alClient
    TabOrder = 0
    object db_VendasPDV: TDBGrid
      Left = 1
      Top = 31
      Width = 150
      Height = 535
      Align = alClient
      DataSource = DM.DataSourceVendasD
      Enabled = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vendas_id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto_id'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'funcionaro_id'
          Visible = False
        end>
    end
    object painel_pdv_topo_grid: TPanel
      Left = 1
      Top = 1
      Width = 150
      Height = 30
      Align = alTop
      Caption = 'Itens Adicionados'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object painel_pdv_direita: TPanel
    Left = 744
    Top = 0
    Width = 351
    Height = 567
    Align = alRight
    TabOrder = 1
    object Label6: TLabel
      Left = 38
      Top = 39
      Width = 101
      Height = 16
      Caption = 'TOTAL DO ITEM:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 38
      Top = 127
      Width = 69
      Height = 16
      Caption = 'SUBTOTAL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 38
      Top = 213
      Width = 100
      Height = 16
      Caption = 'DESCONTO (F1):'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 38
      Top = 302
      Width = 127
      Height = 16
      Caption = 'TOTAL DA COMPRA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 38
      Top = 398
      Width = 115
      Height = 16
      Caption = 'VALOR RECEBIDO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 38
      Top = 486
      Width = 47
      Height = 16
      Caption = 'TROCO:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 349
      Height = 30
      Align = alTop
      Caption = 'Itens Adicionados'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object edt_totalDoItem: TEdit
      Left = 38
      Top = 61
      Width = 267
      Height = 48
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object edt_subTotal: TEdit
      Left = 38
      Top = 149
      Width = 267
      Height = 48
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edt_desconto: TEdit
      Left = 38
      Top = 235
      Width = 267
      Height = 48
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnExit = edt_descontoExit
    end
    object edt_totalCompra: TEdit
      Left = 38
      Top = 324
      Width = 267
      Height = 48
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object edt_valorRecebido: TEdit
      Left = 38
      Top = 420
      Width = 267
      Height = 48
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnExit = edt_valorRecebidoExit
    end
    object edt_troco: TEdit
      Left = 38
      Top = 508
      Width = 267
      Height = 48
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
  end
  object painel_pdv_centro: TPanel
    Left = 152
    Top = 0
    Width = 592
    Height = 567
    Align = alRight
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 93
      Width = 63
      Height = 16
      Caption = ' PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 213
      Width = 82
      Height = 16
      Caption = 'QUANTIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 149
      Width = 77
      Height = 16
      Caption = 'DESCRI'#199#195'O '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 269
      Width = 106
      Height = 16
      Caption = 'PRE'#199'O UNIT'#193'RIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 9
      Top = 325
      Width = 55
      Height = 16
      Caption = 'ESTOQUE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_codigoBarra: TEdit
      Left = 9
      Top = 37
      Width = 568
      Height = 48
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = edt_codigoBarraChange
      OnExit = edt_codigoBarraExit
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 590
      Height = 30
      Align = alTop
      Caption = 'C'#243'digo do Produto'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
    end
    object edt_produto: TEdit
      Left = 10
      Top = 115
      Width = 567
      Height = 32
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object edt_descricao: TEdit
      Left = 10
      Top = 171
      Width = 567
      Height = 32
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object edt_qtde: TEdit
      Left = 6
      Top = 235
      Width = 263
      Height = 32
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnExit = edt_qtdeExit
    end
    object edt_precoUnitario: TEdit
      Left = 10
      Top = 291
      Width = 263
      Height = 32
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object edt_estoque: TEdit
      Left = 10
      Top = 347
      Width = 263
      Height = 32
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Panel3: TPanel
      Left = 317
      Top = 232
      Width = 219
      Height = 147
      Color = clSilver
      ParentBackground = False
      TabOrder = 7
      object img_quadro: TImage
        Left = 4
        Top = 0
        Width = 213
        Height = 145
        Stretch = True
      end
    end
    object MediaPlayer1: TMediaPlayer
      Left = 6
      Top = 526
      Width = 253
      Height = 30
      DoubleBuffered = True
      Visible = False
      ParentDoubleBuffered = False
      TabOrder = 8
    end
  end
  object ACBrNFCe: TACBrNFe
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ModeloDF = moNFCe
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'PR'
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.RespTec.IdCSRT = 0
    Left = 168
    Top = 456
  end
end
