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
  u_gastos in 'resources\u_gastos.pas' {frm_gastos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_login, frm_login);
  Application.CreateForm(Tfrm_menu, frm_menu);
  Application.CreateForm(Tfrm__cancelaItemPDV, frm__cancelaItemPDV);
  Application.CreateForm(Tfrm_loginPDV, frm_loginPDV);
  Application.CreateForm(Tfrm_movimentacoes, frm_movimentacoes);
  Application.CreateForm(Tfrm_gastos, frm_gastos);
  Application.Run;
end.
