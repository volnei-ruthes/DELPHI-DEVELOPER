program PDVCommerce;

uses
  Vcl.Forms,
  u_dm in 'resources\u_dm.pas' {DM: TDataModule},
  u_geralHelpers in 'resources\u_geralHelpers.pas' {frm_geralHelpers},
  u_login in 'resources\u_login.pas' {frm_login},
  u_menu in 'resources\u_menu.pas' {frm_menu},
  u_cargos in 'resources\u_cargos.pas' {frm_cargos},
  u_usuarios in 'resources\u_usuarios.pas' {frm_usuarios},
  u_funcionarios in 'resources\u_funcionarios.pas' {frm_funcionarios},
  u_geralHelper in 'resources\u_geralHelper.pas',
  u_fornecedores in 'resources\u_fornecedores.pas' {FrmFornecedores},
  u_produtos in 'resources\u_produtos.pas' {frm_produtos},
  u_imprimirCodBarras in 'resources\u_imprimirCodBarras.pas' {FrmImprimirCodBarras},
  u_entradasProdutosEAQ in 'resources\u_entradasProdutosEAQ.pas' {frmEntradaProdutosEAQ},
  u_saidaProdutosESP in 'resources\u_saidaProdutosESP.pas' {frmSaidaProdutoESP},
  u_estoqueBaixo in 'resources\u_estoqueBaixo.pas' {frmEstoqueBaixo},
  u_vendasPDV in 'resources\u_vendasPDV.pas' {frm_vendasPDV},
  u_cancelaItemPDV in 'resources\u_cancelaItemPDV.pas' {frm__cancelaItemPDV},
  u_loginPDV in 'resources\u_loginPDV.pas' {frm_loginPDV},
  u_movimentacoes in 'resources\u_movimentacoes.pas' {frm_movimentacoes},
  u_gastos in 'resources\u_gastos.pas' {frm_gastos},
  u_listarVendas in 'resources\u_listarVendas.pas' {frm_ListarVendas},
  u_certificadoDigital in 'resources\u_certificadoDigital.pas' {frm_certificadoDigital},
  u_caixa in 'resources\u_caixa.pas' {frm_caixa},
  u_fluxoCaixa in 'resources\u_fluxoCaixa.pas' {frm_fluxoCaixa},
  u_filtroRelatorios in 'resources\u_filtroRelatorios.pas' {frm_filtroRelatorios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_menu, frm_menu);
  Application.CreateForm(Tfrm_vendasPDV, frm_vendasPDV);
  Application.CreateForm(Tfrm_certificadoDigital, frm_certificadoDigital);
  Application.CreateForm(Tfrm_caixa, frm_caixa);
  Application.CreateForm(Tfrm_fluxoCaixa, frm_fluxoCaixa);
  Application.CreateForm(Tfrm_filtroRelatorios, frm_filtroRelatorios);
  Application.Run;
end.
