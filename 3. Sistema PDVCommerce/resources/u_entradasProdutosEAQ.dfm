object frmEntradaProdutosEAQ: TfrmEntradaProdutosEAQ
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Entrada de Produtos EAQ'
  ClientHeight = 395
  ClientWidth = 769
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 616
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Buscar'
  end
  object Label2: TLabel
    Left = 55
    Top = 37
    Width = 42
    Height = 13
    Caption = 'Produto:'
  end
  object btn_novo: TSpeedButton
    Left = 159
    Top = 337
    Width = 75
    Height = 46
    Cursor = crHandPoint
    Caption = 'Novo'
    Flat = True
    Glyph.Data = {
      FA090000424DFA09000000000000360000002800000019000000190000000100
      200000000000C4090000120B0000120B00000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F8
      F700929893007B847D007B857D008D948F00EEF2F000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00C7CC
      C9001C291E000000000000000000000000000000000016211700BAC3BE00FFFF
      FF00FFFFFF00FFFFFF00A0A8A3002E3630002D42350031463900314639003146
      390031463900314639003146390031463900314639002E433500314538009FA5
      A000193222000000000000110400485A4F00516257000011050000010000000C
      0200D3D6D400FFFFFF00FFFFFF001831230000000000000B0000000A0000000A
      0000000A0000000A0000000A0000000A0000000A0000000A000000000000394D
      410056655B000003000000120000000000006A776E007A857E00000000000010
      000000000000485B5000FFFFFF00FFFFFF0028413400000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000004
      00007E8882005A6960000004000046594E00515651009DA6A000A2AAA4005155
      51004B5E5300000E000016312100FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100000500007B867F0059685E000006000075807900878F8800C3C7C400C5C9
      C600878E87007E898100001001001A352600FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      11000521110000060000707D75005E6D630000000000000F0000000000005F6D
      64006D7A710000000000000D000000030000253D2F00FFFFFF00FFFFFF002C44
      3700000A00000521110005211100052111000521110005211100052111000521
      110005211100052111000017060024382B0086908900071D0D00001303000009
      020067746C007480780000090100001B0A0000000000969F9900FFFFFF00FFFF
      FF002C443700000A000005211100052111000521110005211100052111000521
      110005211100052111000521110005231200000900005260560086948D000A1A
      0E0000000000001000000013020000030000000000005E6E6400FFFFFF00FFFF
      FF00FFFFFF002C443700000A0000052111000521110005211100052111000521
      110005211100052111000521110005211100052111000420100000090000505B
      5300818A8400616C630054635800505F540054645900999F9A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002C443700000A00000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052212000320
      0F00000B000022352800717F770089918B00828C850060656000D3D7D400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002C443700000A000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000523120000180700000600000005000000020000000000009DA6
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100011D0D000008
      0000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      110005211100052111000521110005211100052111000521110005211100011D
      0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100011D0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF00112C
      1E00000000000005000000050000000500000005000000050000000500000005
      0000000500000005000000050000000500000005000000050000000500000005
      00000005000000010000000000009BA39E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B958F00636E6700707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D7500707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D75006D7A720065706800CFD2D000FFFFFF00FFFFFF00FFFF
      FF00FCFCFC007F8C8400636D65006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A710069786F00636A6500C6CBC800FFFFFF00FFFF
      FF00FFFFFF00F7F8F80005221100000000000006000000060000000600000006
      0000000600000006000000060000000600000006000000060000000600000006
      0000000600000006000000060000000600000002000000000000939D9600FFFF
      FF00FFFFFF00FFFFFF00F7F8F8001C362700000E000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      11000521110005211100052111000521110005211100011F0F000002000098A2
      9B00FFFFFF00FFFFFF00FFFFFF00F9FAFA00132C1D0000000000000500000004
      0000000400000004000000040000000400000004000000040000000400000004
      0000000400000004000000040000000400000004000000040000000000000000
      0000A5ADA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5B0003C443D003D52
      4600405549004055490040554900405549004055490040554900405549004055
      49004055490040554900405549004055490040554900405549003F5549003946
      3B0069786E00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    OnClick = btn_novoClick
  end
  object btn_salvar: TSpeedButton
    Left = 334
    Top = 337
    Width = 75
    Height = 46
    Cursor = crHandPoint
    Caption = 'Salvar'
    Flat = True
    Glyph.Data = {
      FA090000424DFA09000000000000360000002800000019000000190000000100
      200000000000C4090000120B0000120B00000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFEFEF00838A86007A7D7A009CA59F00ECE9E800E2E0DE00E1E0
      DE00E1E0DE00E1E0DE00E1E0DE00E1E0DE00E1E0DE00E1E0DE00E1E0DE00E1E0
      DE00E1E0DE00EEEBEA00A4ACA7007B7E7B007B807A00D9E0DC00FFFFFF00FFFF
      FF00FFFFFF00F4F5F40031463900000000000000000021352500E1D6CC00CAC2
      B800C8C0B600C8C0B600C8C0B600C8C0B600C8C0B600C8C0B600C8C0B600C8C0
      B600C8C0B600C9C0B600E5DBD1003E4E3F0000000000000000000E1F1500D0D4
      D200FFFFFF00FFFFFF00D2D6D300000A0000001806000002000052635800FFFF
      FD00F8F4EF00F7F4EF00F7F4EF00F7F4EF00F7F4EF00F7F4EF00F7F4EF00F7F4
      EF00F7F4EF00F7F5EF00F6F3EE00FFFFFE007A877D0000010000042413000000
      0000838F8800FFFFFF00FFFFFF00D5D9D600001A090000180700000200005364
      5A00FFFFFF00F4F3EF00F3F3F000F3F3F000F3F3F000F3F3F000F3F3F000F3F3
      F000F3F3F000F3F3F000F3F3F000F2F2EF00FFFFFF0079877E00000100000421
      1100000000008F9A9300FFFFFF00FFFFFF00D6DAD700001B0A00001807000002
      000052635900FFFFFF00ECEBE600C5C0BA00C5C1BA00C7C2BC00C7C2BC00C7C2
      BC00C7C2BC00C7C2BC00C7C2BC00C1BCB500E4E1DD00FFFFFF0078857B000001
      00000421110000000000909B9400FFFFFF00FFFFFF00D6DAD700001B0A000018
      07000002000052635900FFFFFF00F1F0EB00E7E5E100E7E5E100E8E6E100E8E6
      E100E8E6E100E8E6E100E8E6E100E8E6E100E6E4E000EEEDE900FFFFFF007886
      7C00000100000421110000000000909B9400FFFFFF00FFFFFF00D6DAD700001B
      0A00001807000001000054655B00FFFFFF00EFEDE900D9D6D100D9D7D200DAD8
      D300DAD8D300DAD8D300DAD8D300DAD8D300DAD8D300D7D4CF00EAE8E400FFFF
      FF0079877C00000100000421110000000000909B9400FFFFFF00FFFFFF00D6DA
      D700001B0A000018070000000000596B6000FFFFFF00EDEBE600CCC8C200CCC8
      C200CDC9C400CDC9C400CDC9C400CDC9C400CDC9C400CDC9C400C9C4BE00E4E2
      DE00FFFFFF0084908700000000000421110000000000909B9400FFFFFF00FFFF
      FF00D6DAD700001B0A0000180700000E020023362A00FCFAF800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0049594D00000600000421110000000000909B9400FFFF
      FF00FFFFFF00D6DAD700001B0A0000180700042210000009000041544700C1C6
      C200C9CCC700C7CBC600C7CBC600C7CBC600C7CBC600C7CBC600C7CBC600C7CB
      C600C8CBC600CBCFCB0067766B00000B0000031F0E000421110000000000909B
      9400FFFFFF00FFFFFF00D6DAD700001B0A00001807000622120005221100000A
      0000001000000018080000170700001707000017070000170700001707000017
      070000170700001808000014030000060000021E0E0006231300042111000000
      0000909B9400FFFFFF00FFFFFF00D6DAD700001B0A0000180700052111000521
      110005211100001C0C00001A0A00001B0A00001B0A00001B0A00001B0A00001B
      0A00001B0A00001B0A00001A0A00001B0B000420100005221100052111000421
      110000000000909B9400FFFFFF00FFFFFF00D6DAD700001B0A00001807000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      11000421110000000000909B9400FFFFFF00FFFFFF00D6DAD700001B0A000018
      0700052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000421110000000000909B9400FFFFFF00FFFFFF00D6DAD700001B
      0A000018070005211100052111000521110005221200001C0C00001807000019
      08000019080000190800001908000019080000180700001B0A00052111000521
      110005211100052111000421110000000000909B9400FFFFFF00FFFFFF00D6DA
      D700001B0A0000180700052111000521110005241300000A0000001100000923
      140006201000041F0F00021C0C00021D0C00021D0C0006200F00001403000007
      00000421110006221200052111000421110000000000909B9400FFFFFF00FFFF
      FF00D6DAD700001B0A000018070005211100052312000008000036493C00CACE
      CA00D3D4CF00CED0CB00D4D6D200D5D7D300CBCDC700CDD0CA00D1D3CD00CACE
      CA00556559000009000003210F00052111000421110000000000909B9400FFFF
      FF00FFFFFF00D6DAD700001B0A0000180700052111000015060012241800E7E8
      E400F1EBE200C1BEB000C8C5B800C4C1B400F8F4EF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002D3F3200000C0100052111000524140000000000808D
      8500FFFFFF00FFFFFF00D6DAD700001B0A000018070005211100000900003F56
      4A00FEF9F6009F9D8A009B9A88009F9E8D008C8B7700BFBDB100FFFFFF00F0EF
      EB00F1F0EC00F3F1ED00FFFFFF005D6E62000000000006241300000F00000000
      0000B3BAB500FFFFFF00FFFFFF00D1D5D20000130100001A080005211100000B
      00003C514500F1EEEA00A3A290009D9C8B00A1A18F0091917C00C1C1B300FFFF
      FD00F0EFEB00F1F0EC00F4F3EF00FFFFFF005466590000030000000E00000005
      0000A8B3AC00FFFFFF00FFFFFF00FFFFFF00E1E3E10000150400000100000017
      0600000000002C443600F3F0EC00B5B1A500ADAC9E00B1AFA200A3A09300CAC8
      BF00FCFBF800EFEEEA00F0EFEB00F3F2EE00FFFFFF004B5E5000000000000004
      0000A4AEA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9B0AC000D17
      0E00011C0C00000C0000394D4000FBF7F500D8D3CF00D1CCC800D2CECA00CBC6
      C200DEDBD800F8F8F400F2F1EE00F2F1EE00F5F4F100FFFFFF00506255000005
      0000A4AFA800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ECF0EE00E1E3E100E2E4E200EBEDEB00FFFFFF00FCFCFC00FCFCFB00FCFC
      FB00FCFBFB00FDFDFC00FFFFFE00FEFEFE00FEFEFE00FFFFFE00FFFFFF00EBEC
      EB00E2E6E200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    Visible = False
    OnClick = btn_salvarClick
  end
  object btn_excluir: TSpeedButton
    Left = 503
    Top = 337
    Width = 75
    Height = 46
    Cursor = crHandPoint
    Caption = 'Excluir'
    Flat = True
    Glyph.Data = {
      FA090000424DFA09000000000000360000002800000019000000190000000100
      200000000000C4090000120B0000120B00000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F8
      F700929893007B847D007B857D008D948F00EEF2F000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00C7CC
      C9001C291E000000000000000000000000000000000016211700BAC3BE00FFFF
      FF00FFFFFF00FFFFFF00A0A8A3002E3630002D42350031463900314639003146
      390031463900314639003146390031463900314639002E433500314538009FA5
      A000193222000000000000110400485A4F00516257000011050000010000000C
      0200D3D6D400FFFFFF00FFFFFF001831230000000000000B0000000A0000000A
      0000000A0000000A0000000A0000000A0000000A0000000A000000000000394D
      410056655B000003000000120000000000006A776E007A857E00000000000010
      000000000000485B5000FFFFFF00FFFFFF0028413400000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000004
      00007E8882005A6960000004000046594E00515651009DA6A000A2AAA4005155
      51004B5E5300000E000016312100FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100000500007B867F0059685E000006000075807900878F8800C3C7C400C5C9
      C600878E87007E898100001001001A352600FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      11000521110000060000707D75005E6D630000000000000F0000000000005F6D
      64006D7A710000000000000D000000030000253D2F00FFFFFF00FFFFFF002C44
      3700000A00000521110005211100052111000521110005211100052111000521
      110005211100052111000017060024382B0086908900071D0D00001303000009
      020067746C007480780000090100001B0A0000000000969F9900FFFFFF00FFFF
      FF002C443700000A000005211100052111000521110005211100052111000521
      110005211100052111000521110005231200000900005260560086948D000A1A
      0E0000000000001000000013020000030000000000005E6E6400FFFFFF00FFFF
      FF00FFFFFF002C443700000A0000052111000521110005211100052111000521
      110005211100052111000521110005211100052111000420100000090000505B
      5300818A8400616C630054635800505F540054645900999F9A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002C443700000A00000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052212000320
      0F00000B000022352800717F770089918B00828C850060656000D3D7D400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002C443700000A000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000523120000180700000600000005000000020000000000009DA6
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100011D0D000008
      0000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      110005211100052111000521110005211100052111000521110005211100011D
      0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100011D0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF00112C
      1E00000000000005000000050000000500000005000000050000000500000005
      0000000500000005000000050000000500000005000000050000000500000005
      00000005000000010000000000009BA39E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B958F00636E6700707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D7500707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D75006D7A720065706800CFD2D000FFFFFF00FFFFFF00FFFF
      FF00FCFCFC007F8C8400636D65006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A710069786F00636A6500C6CBC800FFFFFF00FFFF
      FF00FFFFFF00F7F8F80005221100000000000006000000060000000600000006
      0000000600000006000000060000000600000006000000060000000600000006
      0000000600000006000000060000000600000002000000000000939D9600FFFF
      FF00FFFFFF00FFFFFF00F7F8F8001C362700000E000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      11000521110005211100052111000521110005211100011F0F000002000098A2
      9B00FFFFFF00FFFFFF00FFFFFF00F9FAFA00132C1D0000000000000500000004
      0000000400000004000000040000000400000004000000040000000400000004
      0000000400000004000000040000000400000004000000040000000000000000
      0000A5ADA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5B0003C443D003D52
      4600405549004055490040554900405549004055490040554900405549004055
      49004055490040554900405549004055490040554900405549003F5549003946
      3B0069786E00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    Visible = False
    OnClick = btn_excluirClick
  end
  object btn_cancelar: TSpeedButton
    Left = 240
    Top = 337
    Width = 75
    Height = 46
    Cursor = crHandPoint
    Caption = 'Cancelar'
    Flat = True
    Glyph.Data = {
      FA090000424DFA09000000000000360000002800000019000000190000000100
      200000000000C4090000120B0000120B00000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F8
      F700929893007B847D007B857D008D948F00EEF2F000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFF00FFFFFF00C7CC
      C9001C291E000000000000000000000000000000000016211700BAC3BE00FFFF
      FF00FFFFFF00FFFFFF00A0A8A3002E3630002D42350031463900314639003146
      390031463900314639003146390031463900314639002E433500314538009FA5
      A000193222000000000000110400485A4F00516257000011050000010000000C
      0200D3D6D400FFFFFF00FFFFFF001831230000000000000B0000000A0000000A
      0000000A0000000A0000000A0000000A0000000A0000000A000000000000394D
      410056655B000003000000120000000000006A776E007A857E00000000000010
      000000000000485B5000FFFFFF00FFFFFF0028413400000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000004
      00007E8882005A6960000004000046594E00515651009DA6A000A2AAA4005155
      51004B5E5300000E000016312100FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100000500007B867F0059685E000006000075807900878F8800C3C7C400C5C9
      C600878E87007E898100001001001A352600FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      11000521110000060000707D75005E6D630000000000000F0000000000005F6D
      64006D7A710000000000000D000000030000253D2F00FFFFFF00FFFFFF002C44
      3700000A00000521110005211100052111000521110005211100052111000521
      110005211100052111000017060024382B0086908900071D0D00001303000009
      020067746C007480780000090100001B0A0000000000969F9900FFFFFF00FFFF
      FF002C443700000A000005211100052111000521110005211100052111000521
      110005211100052111000521110005231200000900005260560086948D000A1A
      0E0000000000001000000013020000030000000000005E6E6400FFFFFF00FFFF
      FF00FFFFFF002C443700000A0000052111000521110005211100052111000521
      110005211100052111000521110005211100052111000420100000090000505B
      5300818A8400616C630054635800505F540054645900999F9A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF002C443700000A00000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052212000320
      0F00000B000022352800717F770089918B00828C850060656000D3D7D400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF002C443700000A000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000523120000180700000600000005000000020000000000009DA6
      A000FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A0000052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100011D0D000008
      0000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A00000521
      1100052111000521110005211100052111000521110005211100052111000521
      110005211100052111000521110005211100052111000521110005211100011D
      0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF002C443700000A
      0000052111000521110005211100052111000521110005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      1100011D0D0000080000A7AEA900FFFFFF00FFFFFF00FFFFFF00FFFFFF00112C
      1E00000000000005000000050000000500000005000000050000000500000005
      0000000500000005000000050000000500000005000000050000000500000005
      00000005000000010000000000009BA39E00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008B958F00636E6700707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D7500707D7500707D7500707D7500707D7500707D7500707D
      7500707D7500707D75006D7A720065706800CFD2D000FFFFFF00FFFFFF00FFFF
      FF00FCFCFC007F8C8400636D65006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A71006B7A
      71006B7A71006B7A71006B7A710069786F00636A6500C6CBC800FFFFFF00FFFF
      FF00FFFFFF00F7F8F80005221100000000000006000000060000000600000006
      0000000600000006000000060000000600000006000000060000000600000006
      0000000600000006000000060000000600000002000000000000939D9600FFFF
      FF00FFFFFF00FFFFFF00F7F8F8001C362700000E000005211100052111000521
      1100052111000521110005211100052111000521110005211100052111000521
      11000521110005211100052111000521110005211100011F0F000002000098A2
      9B00FFFFFF00FFFFFF00FFFFFF00F9FAFA00132C1D0000000000000500000004
      0000000400000004000000040000000400000004000000040000000400000004
      0000000400000004000000040000000400000004000000040000000000000000
      0000A5ADA700FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB5B0003C443D003D52
      4600405549004055490040554900405549004055490040554900405549004055
      49004055490040554900405549004055490040554900405549003F5549003946
      3B0069786E00F8F8F800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    OnClick = btn_cancelarClick
  end
  object btn_buscarProduto: TSpeedButton
    Left = 8
    Top = 44
    Width = 41
    Height = 43
    Cursor = crHandPoint
    Flat = True
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C070000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF5BDE3C092D19779C6806AC07166BE
      6E69C07177C57E91D396B8E2BCEEF5EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDDB268BF705EBB
      665EBB665EBB665EBB665EBB665EBA6661C06961C16950A1584F95559FC8A3F8
      FBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31FFFFFFFFFFFFFFFFFFFFFFFFE0F2
      E277C57D5EBB665EBB665EBB665EBB665EBB665EBB665EBA6661C16960BE684E
      9C55478E4D4A95524B95525DA164D1E4D2FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFDCF0DE5FBB675EBB665EBB665EBB665EBB665EBB665EBB665D
      BA6661C2695FBE674D9A54478D4D4F985644924B2C84343085384B9551CAE1CC
      FFFFFFFFFFFFFFFFFF38FFFFFFFFFFFFE7F5E85FBC675EBB665EBB665EBB665E
      BB665EBB665EBB665EBA6662C36A5DBA654C9752478E4E4F9956388B3F408F47
      93C09782B7883B8C434A9451D5E7D7FFFFFFFFFFFF00FFFFFFFFFFFF72C3795E
      BB665EBB665EBB665EBB665EBB665EBB665EBB6662C36A5DB8654A9551488F4E
      4F995634893C32873ACBE1CDFFFFFFFFFFFF7EB4832F8537539B59FEFEFEFFFF
      FF38FFFFFFBBE2BE5EBB665EBB665EBB665EBB665EBB665EBB665EBB6662C46B
      5BB56349935048904F509957358A3D33883BCEE2D0FFFFFFFFFFFFFFFFFFA0C7
      A327812F4A94519DC7A1FFFFFF00FEFEFE64BE6C5EBB665EBB665EBB665EBB66
      5EBB665FBD6760C2684CAA543887403E8B454B975343914A3E8E45D2E5D4FFFF
      FFFFFFFFFFFFFFD1E4D33D8E4443924B4B96524B9652F3F8F438C8E8CB5EBB66
      5EBB665EBB665EBB6660BC685EBC6646B34F42A04A5D9C636BA670539B5A2D85
      350E72179DC6A1FFFFFFFFFFFFFFFFFFCEE2D0328739378B3F4F98564B96524B
      9652ADD0B00097D39C5EBB665EBB665EBB6660BC6857B85F3EAE488ECC93DFE9
      E0E9F0EAE3EFE4EBF4ECCCE1CE509957C7DFCAFFFFFFFFFFFFCDE2CF33883B34
      893C4F99564B96524B97524991507AB07F1C7CC8835EBB665EBB665EBB665BB9
      6340AE49BFE6C2FFFCFF9FC6A360A3665199586FAB74BDD8BFFFFFFFFFFFFFBB
      D7BE96C29A409048368A3D4F98564B96524B9752488F4E4A945170BC760067BF
      6E5EBB665EBB6660BC683DAD47ABE0B0FFFFFF4E96551E7C273B8D4342914A34
      883B1A792387B98CFFFFFF559C5B10731943914A4F98564B96524B9652478E4D
      4C97535DBA656BC7733862BD6A5EBB665EBB6656B85E5EBC66FFFFFF7FB08320
      7D294F98564B96524B96524C97534B9652187821C9DFCBD3E5D52A83324B9652
      4B97524A9552478E4D4F9D565FBD6761C16A64BC6B0068BF705EBB665EBB6646
      B14FA1DBA6EAEFEA378A3E46944E4B96524B96524B96524B96524C975333883B
      70AC75F6FAF6539B5A4190484A9351478D4D52A35961C26A61C0695EBA6567BF
      6F147EC9855EBB665EBB6642AF4BB8E6BCD4E2D62D85364B96524B96524B9652
      4B96524B96524B965243914A4D9754ECF4ED74AF7A36873D478F4E55AB5D62C2
      6A60BE685EBA665EBB6675C57C009BD5A05EBB665EBB6644B04DADE1B1E0E9E1
      32873A4A95514B96524B96524B96524B96524B96523B8D425FA265F2F8F3609D
      653A894259B16062C46B5FBD675EBA665EBB665EBB668CCE921CCEEAD15EBB66
      5EBB6650B55975C77CFFFFFF5B9D623187394E98554B96524B96524B96524F98
      551B7923ABCEAEECEFED31863959B56162C36A5EBB665EBB665EBB665EBB665E
      BB66BCE3BF00FFFFFF6AC0715EBB665EBB673DAD47D6F2D8E9EBEA237E2C3287
      3A4995504B965247944E237E2B519858FFFFFF8ABE8F41AB4A63C36B5EBB665E
      BB665EBB665EBB665EBB665FBC67F9FCF91CFFFFFFC2E5C55EBB665FBB6751B6
      5A53B75BF7FFF7E0E7E1579B5D34883C2F8537398B4175AC7AFFFFFFC1E3C43A
      A94461C1695EBA665EBB665EBB665EBB665EBB665EBB66B0DEB4FFFFFF00FFFF
      FFFFFFFF7CC8825EBB6661BD694AB25354B85DCAEDCDF2F9F2D9E6DACFE0D1E1
      EBE2F4FDF4A2DBA840AE4A58BA605FBB675EBB665EBB665EBB665EBB665EBB66
      6EC275FFFFFFFFFFFF1CFFFFFFFFFFFFF0F9F167BF6E5EBB6662BD6951B65A42
      AF4B75C77CA6DEABB3E4B79BD9A061BD6940AE495BBA6360BC685EBB665EBB66
      5EBB665EBB665EBB665FBB67E4F4E5FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE8
      F5E969C0705EBB665FBB675FBB6751B55946B14F44B04D48B25156B85E60BC68
      5EBB665EBB665EBB665EBB665EBB665EBB6660BC68DCF0DDFFFFFFFFFFFFFFFF
      FF1CFFFFFFFFFFFFFFFFFFFFFFFFECF7ED84CB8A5EBB665EBB665EBB665EBB66
      5EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB667AC781E3F3
      E4FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      BDE3C175C57C5EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB
      6670C277B7E1BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCEACF9ED6A382CA886CC17366BE
      6E6BC0727FC9869BD5A0C7E8CAFBFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    OnClick = btn_buscarProdutoClick
  end
  object Label3: TLabel
    Left = 413
    Top = 37
    Width = 28
    Height = 13
    Caption = 'Qtde:'
  end
  object Label4: TLabel
    Left = 302
    Top = 37
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object Label5: TLabel
    Left = 520
    Top = 37
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object btn_BuscarFornecedor: TSpeedButton
    Left = 473
    Top = 45
    Width = 41
    Height = 43
    Cursor = crHandPoint
    Flat = True
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C070000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBF5BDE3C092D19779C6806AC07166BE
      6E69C07177C57E91D396B8E2BCEEF5EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEDDB268BF705EBB
      665EBB665EBB665EBB665EBB665EBA6661C06961C16950A1584F95559FC8A3F8
      FBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31FFFFFFFFFFFFFFFFFFFFFFFFE0F2
      E277C57D5EBB665EBB665EBB665EBB665EBB665EBB665EBA6661C16960BE684E
      9C55478E4D4A95524B95525DA164D1E4D2FFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFDCF0DE5FBB675EBB665EBB665EBB665EBB665EBB665EBB665D
      BA6661C2695FBE674D9A54478D4D4F985644924B2C84343085384B9551CAE1CC
      FFFFFFFFFFFFFFFFFF38FFFFFFFFFFFFE7F5E85FBC675EBB665EBB665EBB665E
      BB665EBB665EBB665EBA6662C36A5DBA654C9752478E4E4F9956388B3F408F47
      93C09782B7883B8C434A9451D5E7D7FFFFFFFFFFFF00FFFFFFFFFFFF72C3795E
      BB665EBB665EBB665EBB665EBB665EBB665EBB6662C36A5DB8654A9551488F4E
      4F995634893C32873ACBE1CDFFFFFFFFFFFF7EB4832F8537539B59FEFEFEFFFF
      FF38FFFFFFBBE2BE5EBB665EBB665EBB665EBB665EBB665EBB665EBB6662C46B
      5BB56349935048904F509957358A3D33883BCEE2D0FFFFFFFFFFFFFFFFFFA0C7
      A327812F4A94519DC7A1FFFFFF00FEFEFE64BE6C5EBB665EBB665EBB665EBB66
      5EBB665FBD6760C2684CAA543887403E8B454B975343914A3E8E45D2E5D4FFFF
      FFFFFFFFFFFFFFD1E4D33D8E4443924B4B96524B9652F3F8F438C8E8CB5EBB66
      5EBB665EBB665EBB6660BC685EBC6646B34F42A04A5D9C636BA670539B5A2D85
      350E72179DC6A1FFFFFFFFFFFFFFFFFFCEE2D0328739378B3F4F98564B96524B
      9652ADD0B00097D39C5EBB665EBB665EBB6660BC6857B85F3EAE488ECC93DFE9
      E0E9F0EAE3EFE4EBF4ECCCE1CE509957C7DFCAFFFFFFFFFFFFCDE2CF33883B34
      893C4F99564B96524B97524991507AB07F1C7CC8835EBB665EBB665EBB665BB9
      6340AE49BFE6C2FFFCFF9FC6A360A3665199586FAB74BDD8BFFFFFFFFFFFFFBB
      D7BE96C29A409048368A3D4F98564B96524B9752488F4E4A945170BC760067BF
      6E5EBB665EBB6660BC683DAD47ABE0B0FFFFFF4E96551E7C273B8D4342914A34
      883B1A792387B98CFFFFFF559C5B10731943914A4F98564B96524B9652478E4D
      4C97535DBA656BC7733862BD6A5EBB665EBB6656B85E5EBC66FFFFFF7FB08320
      7D294F98564B96524B96524C97534B9652187821C9DFCBD3E5D52A83324B9652
      4B97524A9552478E4D4F9D565FBD6761C16A64BC6B0068BF705EBB665EBB6646
      B14FA1DBA6EAEFEA378A3E46944E4B96524B96524B96524B96524C975333883B
      70AC75F6FAF6539B5A4190484A9351478D4D52A35961C26A61C0695EBA6567BF
      6F147EC9855EBB665EBB6642AF4BB8E6BCD4E2D62D85364B96524B96524B9652
      4B96524B96524B965243914A4D9754ECF4ED74AF7A36873D478F4E55AB5D62C2
      6A60BE685EBA665EBB6675C57C009BD5A05EBB665EBB6644B04DADE1B1E0E9E1
      32873A4A95514B96524B96524B96524B96524B96523B8D425FA265F2F8F3609D
      653A894259B16062C46B5FBD675EBA665EBB665EBB668CCE921CCEEAD15EBB66
      5EBB6650B55975C77CFFFFFF5B9D623187394E98554B96524B96524B96524F98
      551B7923ABCEAEECEFED31863959B56162C36A5EBB665EBB665EBB665EBB665E
      BB66BCE3BF00FFFFFF6AC0715EBB665EBB673DAD47D6F2D8E9EBEA237E2C3287
      3A4995504B965247944E237E2B519858FFFFFF8ABE8F41AB4A63C36B5EBB665E
      BB665EBB665EBB665EBB665FBC67F9FCF91CFFFFFFC2E5C55EBB665FBB6751B6
      5A53B75BF7FFF7E0E7E1579B5D34883C2F8537398B4175AC7AFFFFFFC1E3C43A
      A94461C1695EBA665EBB665EBB665EBB665EBB665EBB66B0DEB4FFFFFF00FFFF
      FFFFFFFF7CC8825EBB6661BD694AB25354B85DCAEDCDF2F9F2D9E6DACFE0D1E1
      EBE2F4FDF4A2DBA840AE4A58BA605FBB675EBB665EBB665EBB665EBB665EBB66
      6EC275FFFFFFFFFFFF1CFFFFFFFFFFFFF0F9F167BF6E5EBB6662BD6951B65A42
      AF4B75C77CA6DEABB3E4B79BD9A061BD6940AE495BBA6360BC685EBB665EBB66
      5EBB665EBB665EBB665FBB67E4F4E5FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFE8
      F5E969C0705EBB665FBB675FBB6751B55946B14F44B04D48B25156B85E60BC68
      5EBB665EBB665EBB665EBB665EBB665EBB6660BC68DCF0DDFFFFFFFFFFFFFFFF
      FF1CFFFFFFFFFFFFFFFFFFFFFFFFECF7ED84CB8A5EBB665EBB665EBB665EBB66
      5EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB667AC781E3F3
      E4FFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      BDE3C175C57C5EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB665EBB
      6670C277B7E1BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCEACF9ED6A382CA886CC17366BE
      6E6BC0727FC9869BD5A0C7E8CAFBFDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    OnClick = btn_BuscarFornecedorClick
  end
  object lbl_Totalizador: TLabel
    Left = 754
    Top = 337
    Width = 7
    Height = 16
    Alignment = taRightJustify
    Caption = '0'
    Color = clInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object edt_produto: TEdit
    Left = 55
    Top = 56
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edt_quantidade: TEdit
    Left = 413
    Top = 56
    Width = 60
    Height = 21
    TabOrder = 2
    OnChange = edt_quantidadeChange
  end
  object edt_valor: TEdit
    Left = 302
    Top = 56
    Width = 105
    Height = 21
    TabOrder = 1
    OnChange = edt_valorChange
  end
  object dbGrid_entradaProdutosEAQ: TDBGrid
    Left = 8
    Top = 99
    Width = 753
    Height = 232
    DataSource = DM.DataSourceEntradaProdutos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbGrid_entradaProdutosEAQCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'produto'
        Title.Caption = 'Produto'
        Width = 248
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Fornecedor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'produto_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'quantidade'
        Title.Caption = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fornecedor_id'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Visible = True
      end>
  end
  object edt_fornecedor: TEdit
    Left = 520
    Top = 56
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object DataBuscar: TDateTimePicker
    Left = 655
    Top = 5
    Width = 106
    Height = 21
    Date = 44290.000000000000000000
    Time = 0.416367881945916500
    TabOrder = 5
    OnChange = DataBuscarChange
  end
end
