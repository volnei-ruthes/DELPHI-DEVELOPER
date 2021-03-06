program SistemaClienteCRUD;

uses
  Vcl.Forms,
  u_principal in 'fontes\u_principal.pas' {frm_principal},
  u_clientes in 'fontes\u_clientes.pas' {frm_clientes},
  u_dm in 'fontes\u_dm.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(Tfrm_clientes, frm_clientes);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
