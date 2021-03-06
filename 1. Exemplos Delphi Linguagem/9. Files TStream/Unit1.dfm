object Form1: TForm1
  Left = 192
  Top = 125
  Width = 657
  Height = 459
  Caption = 'EXAMPLES TYPES FILES - TSream (Binaries are of type FILE) '
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
    Width = 641
    Height = 420
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet3: TTabSheet
      Caption = 'Introdu'#231#227'o'
      ImageIndex = 2
      object Memo2: TMemo
        Left = 88
        Top = 32
        Width = 401
        Height = 337
        Lines.Strings = (
          
            'Streams s'#227'o objetos que remetem ao in'#237'cio dos tempos da programa' +
            #231#227'o, '
          'quando a manipula'#231#227'o de dados era feita byte a byte. '
          
            'Com o surgimento de novas tecnologias, a utiliza'#231#227'o dos Streams ' +
            'ficou'
          ' restrita a situa'#231#245'es em que os mesmos s'#227'o imprescind'#237'veis.'
          ''
          
            'No Delphi existe uma classe base TStream e dela descendem as dem' +
            'ais'
          
            ' classes de manipula'#231#227'o de Streams: TMemoryStream, TFileStream, ' +
            'TBlobStream. '
          'Essas tr'#234's classes que citei s'#227'o as mais importantes '
          'na manipula'#231#227'o de Streams em Delphi.'
          ''
          
            '|--------------------------------TStream|-----------------------' +
            '-----|'
          
            '            |                           |                       ' +
            '|'
          'TMemoryStream --- TFileStream --- TBlobStream'
          ''
          ''
          ''
          
            'conclus'#227'o: Streams s'#227'o um excelente recurso disponibilizado pelo' +
            ' Delphi quando '
          
            'necessitamos utilizar t'#233'cnicas avan'#231'adas de manipula'#231#227'o de arqui' +
            'vos em disco '
          'sendo carregados em mem'#243'ria.')
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Ex. 1 FileStream'
      object Label1: TLabel
        Left = 88
        Top = 8
        Width = 336
        Height = 20
        Caption = 'Exemplo TFileStream (dados n'#227'o leg'#237'veis)'
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
      object Memo3: TMemo
        Left = 184
        Top = 56
        Width = 441
        Height = 329
        Lines.Strings = (
          
            'A classe TFileStream, descendente de TStream, manipula arquivos ' +
            'em disco na forma de '
          
            'Streams. Em geral utilizamos essa forma de Stream para manipular' +
            ' arquivos de texto, mas a '
          
            'utiliza'#231#227'o da mesma para outros tipos de arquivos '#233' perfeitament' +
            'e poss'#237'vel.'
          ''
          
            'Quando criamos um objeto FileStream no construtor do mesmo temos' +
            ' de informar al'#233'm do '
          
            'caminho do arquivo o modo de abertura desse arquivo. FileStream ' +
            'nos possibilita quatro '
          'formas de abertura que s'#227'o:'
          ''
          
            '> Fmcreate- Caso o arquivo n'#227'o exista, ser'#225' criado. Caso exista,' +
            ' ser'#225' zerado e a escrita no '
          'mesmo ir'#225' sobrescrever seu conte'#250'do atual;'
          '> Fmopenread- Abre o arquivo apenas para leitura;'
          '> Fmopenwrite-  Abre o arquivo apenas para escrita;'
          '> Fmopenreadwrite- Abre o arquivo para leitura e escrita.')
        TabOrder = 4
      end
      object Button11: TButton
        Left = 32
        Top = 208
        Width = 121
        Height = 25
        Caption = 'Modifica Data Arquivo'
        TabOrder = 5
        OnClick = Button11Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Ex. 2 FileStream'
      ImageIndex = 1
      object Label4: TLabel
        Left = 88
        Top = 8
        Width = 336
        Height = 20
        Caption = 'Exemplo TFileStream (dados n'#227'o leg'#237'veis)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Button3: TButton
        Left = 32
        Top = 48
        Width = 121
        Height = 25
        Caption = 'Escrevendo Arquivo'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 32
        Top = 80
        Width = 121
        Height = 25
        Caption = 'Lendo Arquivo'
        TabOrder = 1
        OnClick = Button4Click
      end
      object Memo1: TMemo
        Left = 232
        Top = 48
        Width = 361
        Height = 321
        TabOrder = 2
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Ex. 3 FileStream'
      ImageIndex = 3
      object Label5: TLabel
        Left = 32
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Caminho:'
      end
      object edtCaminho: TEdit
        Left = 80
        Top = 8
        Width = 377
        Height = 21
        TabOrder = 0
      end
      object Button5: TButton
        Left = 80
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Carregar '
        TabOrder = 1
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 168
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Exibir'
        TabOrder = 2
        OnClick = Button6Click
      end
      object memoExe3: TMemo
        Left = 80
        Top = 72
        Width = 377
        Height = 161
        TabOrder = 3
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Ex. 4 BlobStream IMG'
      ImageIndex = 4
      object Image1: TImage
        Left = 32
        Top = 56
        Width = 417
        Height = 297
      end
      object Button7: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 0
        OnClick = Button7Click
      end
      object Button8: TButton
        Left = 88
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = Button8Click
      end
      object edtCaminho4: TEdit
        Left = 168
        Top = 8
        Width = 329
        Height = 21
        TabOrder = 2
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Buffers'
      ImageIndex = 5
      object Button9: TButton
        Left = 24
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 0
        OnClick = Button9Click
      end
      object Button10: TButton
        Left = 24
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Copiar'
        TabOrder = 1
        OnClick = Button10Click
      end
      object EdtBuffer: TEdit
        Left = 112
        Top = 16
        Width = 345
        Height = 21
        TabOrder = 2
      end
      object memobuffer: TMemo
        Left = 24
        Top = 80
        Width = 425
        Height = 265
        Lines.Strings = (
          'memobuffer')
        TabOrder = 3
      end
      object ProgressBar1: TProgressBar
        Left = 32
        Top = 360
        Width = 497
        Height = 17
        TabOrder = 4
      end
    end
  end
  object odFile: TOpenDialog
    Left = 564
    Top = 24
  end
  object sdFile: TSaveDialog
    Left = 596
    Top = 24
  end
  object cdsblob: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 24
    Data = {
      3E0000009619E0BD0100000018000000010000000000030000003E0006496D61
      67656D04004B0000000100075355425459504502004900070042696E61727900
      0000}
    object cdsblobimagem: TBlobField
      FieldName = 'imagem'
    end
  end
end
