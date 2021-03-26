program Project1;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uModelTPessoa in 'uModelTPessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
