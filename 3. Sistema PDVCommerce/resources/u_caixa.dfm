object frm_caixa: Tfrm_caixa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Caixa PDV'
  ClientHeight = 332
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 87
    Height = 13
    Caption = 'Usu'#225'rio Gerencial:'
  end
  object Valor: TLabel
    Left = 381
    Top = 53
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object btn_novo: TSpeedButton
    Left = 111
    Top = 287
    Width = 69
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
    Visible = False
    OnClick = btn_novoClick
  end
  object btn_fechar: TSpeedButton
    Left = 269
    Top = 288
    Width = 69
    Height = 46
    Cursor = crHandPoint
    Caption = 'Fechar'
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
    OnClick = btn_fecharClick
  end
  object btn_abrir: TSpeedButton
    Left = 186
    Top = 288
    Width = 73
    Height = 46
    Cursor = crHandPoint
    Caption = 'Abrir'
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
    OnClick = btn_abrirClick
  end
  object Label6: TLabel
    Left = 263
    Top = 53
    Width = 81
    Height = 13
    Caption = 'Senha Gerencial:'
  end
  object Label1: TLabel
    Left = 429
    Top = 11
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object Label3: TLabel
    Left = 465
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Caixa:'
  end
  object btn_Relatorio: TSpeedButton
    Left = 350
    Top = 288
    Width = 104
    Height = 46
    Cursor = crHandPoint
    Caption = 'Relatorio'
    Flat = True
    Glyph.Data = {
      A2070000424DA207000000000000360000002800000019000000190000000100
      1800000000006C070000120B0000120B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCED0CEC0C6C3C4CA
      C7C1C7C3C7CBC8F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCDEDD7982
      7B324437001202000C00001000000D00000F001F36276A756BCDD0CDFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFAFDFC70797307180B000000000700001B0A011E0D001C0C011E0D001C0C00
      0D00000000000D005F675FE2E7E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
      FFFFFFFFFFFFFFFFFFFFD0D7D32A372C000000000000000B00000B00000C0000
      0D00000D00000D00000D00000D00000E00000400000000101B13B8C2BCFFFFFF
      FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFD6DCD90D1B11000000011E0C26
      3C2E384D413C5347364B3E33483B34493C34493C34493C354A3D32483C283E2F
      032211000400000500B6C0BAFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFF7F7F624
      392B0000000017050D2717E5E6E6FFFFFFEDE2E0EBDAD5EADAD6EADAD6EADAD6
      EADAD6E8D8D4F9EAE7FCF2EF2B4134001103000700001106DADDDBFFFFFFFFFF
      FF00FFFFFFFFFFFF728278000000042210001302122D1EF3F6F7FCF9F9B6AAA4
      BEAFAABFB2ADBFB1ADBFB1ADBFB1ADB4A7A2E9D5D1FFFFFE394C400009000524
      130000003D5547FFFFFFFFFFFF00FFFFFFE4E6E5011808001104062212001403
      102A1BE9ECEBF3F0F0AEA49FB4A9A3B5AAA5B5AAA5B5AAA5B5AAA5AA9F9ADECE
      CAFEF6F333483A000B00052111011C0B000000BCC1BEFFFFFFFFFFFFFF7E8A82
      000000042311052111001403102A1BECF0EFEEEBEA9A8D86A1938CA3958EA397
      91A39892A39892948983D6C6C1FEF8F633473A000B000521110523130000004A
      5C51FFFFFFFFFAFAF92B4235000800062212052111001403102B1BE8ECECF2EE
      EEAFA7A2B4ADAAB7B3AFC0B3A6BDADA1B5A8A3AB9E98DFCEC9FEF6F433473B00
      0B000521110521110012020B2817F0F0EF00CCD0CD000F00001C090521110521
      11001403102B1BDEE0DFFFFFFFFCFEFFFFFFFFFFFFF8FFEEE7FFF6E6FFFFE6FF
      F6EAFDE8E9FEEDE933483B000B00052111052111001D0C000C00B9C0BBFFC0C6
      C2000C00001E0D052111052111001403102B1BE0E2E1FFFFFFFFFFF3DDE0ED64
      70E03249E43D54E68E97E2FAEEDBFCEDE1FEEDEB33483B000B00052111052111
      011F0F000800AAB4AF00C5CAC7001000001C0C052111052111001403102B1BDE
      E1E1FFFFFFD9DEF01A35E60021EB324FF32444F00003EB506AFDFFFEF6FEF1E7
      33483B000B00052111052111011E0E000B00B0B9B400C1C7C4000D00001D0D05
      2111052111001403102B1BE3E5E1FFFFFF576CEA0324E98D9AEFE2E1E5C4C3E8
      798CFFA6A3CAF5DFC1FFF4F1324739000B00052111052111011F0F000900ADB6
      B100C6CBC8000C00001D0A052111052111001403102B1BEFF0E2FBFBFF1331E6
      1E3CF1EDDDEAFFFFD2FFF2F1FFF2C1F2A704E6AF47FFFBFF344A3C000B000521
      11052111011F0E000900AFB7B300F3F3F21A3325000E00052111052111001403
      102B1BEDEEE2F9FAFF3B4DF19A99FFFEF5EFFFE5E2F4EBFBECCA7BD08100E8B5
      58FFFFFF394F43000900052111052111001503051F0FE4E5E4FFFFFFFF6C7B72
      000000042312052111001403102B1BE0E2E1FEFEFFC8E0DE62D0815CCB8CCCE2
      E5FCD7B2DAA016D18200F2DDBAFFFFFF384D4100090005211106221300010039
      4E42FFFFFF00FFFFFFD5D9D7000B00001807052111001403102B1BDFE1E1FFFF
      FFE5F8E115AC5600922236CBA0F4C16BD16E00E3C473FFFFFFFFFFFF41564A00
      060005211102200D000000A9B1ABFFFFFF00FFFFFFFFFFFF4E63560000000524
      12001403112D1CE3E4E3FFFFFFFFF7FEF6F4F779C89964CCA2E8D8ACECCC9BF9
      FFFFFFFFFFB5C9B415251A01160705251300000020392AFEFDFDFFFFFF00FFFF
      FFFFFFFFE9EBEA081B0F000500001604102819FBFBFBFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB6C9B2001602000C00062716001103000400
      C0C6C3FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFB9C2BD000500000500041F0F4E
      61566B7A716A7A716A7A706A7A716D7B726A7A716B7A706B7B72112A1C000700
      0627150011010000008B9991FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
      FFFFB5BFB807130B000000000000000000000000000000000000000000000000
      00000000000000160502241100000000060084928AFFFFFFFFFFFFFFFFFFFFFF
      FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3DAD6444E45000000000000001200
      011E0E021F0E011E0E021E0E021F0F001504000000000000303C34BAC3BEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFB3B7B34E595015281B000A00000800000B000009000007000A1F11424D
      45A8ABA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEBEAB1B9B4ADB5B0B0B9
      B4ADB7B1AFB6B1E0E0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF00}
    Visible = False
  end
  object edt_usuario: TEdit
    Left = 8
    Top = 72
    Width = 249
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edt_caixa: TEdit
    Left = 465
    Top = 72
    Width = 72
    Height = 21
    Enabled = False
    TabOrder = 3
    OnExit = edt_caixaExit
  end
  object GridCaixa: TDBGrid
    Left = 7
    Top = 107
    Width = 585
    Height = 174
    DataSource = DM.DataSourceCaixa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edt_senha: TEdit
    Left = 263
    Top = 72
    Width = 112
    Height = 21
    Enabled = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object DateTimePickerAbertura: TDateTimePicker
    Left = 472
    Top = 8
    Width = 120
    Height = 21
    Date = 44316.000000000000000000
    Time = 0.375547534720681100
    TabOrder = 5
    OnChange = DateTimePickerAberturaChange
  end
  object edt_valor: TEdit
    Left = 381
    Top = 72
    Width = 78
    Height = 21
    Enabled = False
    TabOrder = 2
  end
end