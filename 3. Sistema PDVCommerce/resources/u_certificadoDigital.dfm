object frm_certificadoDigital: Tfrm_certificadoDigital
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Certificado Digital'
  ClientHeight = 309
  ClientWidth = 828
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StringGridCertificados: TStringGrid
    Left = 0
    Top = 0
    Width = 828
    Height = 264
    Align = alClient
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goRowSelect]
    TabOrder = 0
    OnClick = StringGridCertificadosClick
    ExplicitLeft = -13
    ExplicitWidth = 658
    ExplicitHeight = 192
  end
  object Panel1: TPanel
    Left = 0
    Top = 264
    Width = 828
    Height = 45
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -13
    ExplicitTop = 192
    ExplicitWidth = 658
    DesignSize = (
      828
      45)
    object BitBtnCancela: TBitBtn
      Left = 606
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 0
      ExplicitLeft = 436
    end
    object BitBtnOk: TBitBtn
      Left = 718
      Top = 5
      Width = 88
      Height = 30
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      Visible = False
      ExplicitLeft = 548
    end
  end
end
