program Project1;

uses
  Forms,
  uSetOfExemplo in 'uSetOfExemplo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
