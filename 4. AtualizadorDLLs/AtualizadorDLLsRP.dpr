program AtualizadorDLLsRP;

uses
  Forms,
  u_main in 'u_main.pas' {frm_main};

{$R *.res}
{$R resources.RES}

begin
  Application.Initialize;
  Application.Title := 'AtualizadorDLLsRP';
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
