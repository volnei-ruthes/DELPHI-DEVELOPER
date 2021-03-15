program Project1;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uCliente in 'uCliente.pas',
  uListaCliente in 'uListaCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
