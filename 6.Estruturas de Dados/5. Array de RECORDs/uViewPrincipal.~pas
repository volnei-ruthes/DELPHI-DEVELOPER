unit uViewPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type //Meu Record.
  TPessoa = record
    Nome : string;
  end;

var
  Form1: TForm1;
  ListaPessoa: array[0..2] of TPessoa;   //Minha Lista tipo RECORD.

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 i:integer;

       procedure mostrarDadosRecord(const campos: array of string);
       var
         texto: string;
         i: integer;
       begin
          //mostra os campos
          for i:=0 to length(campos) -1 do
          begin
             texto:= texto + campos[i] + #10#13;
             memo1.Lines.Add(texto);
          end;
       end;


begin
  //Preencho meu record da posicao 1 da lista.
  with ListaPessoa[0] do
  begin
    Nome := 'Volnei'
  end;

  ListaPessoa[1] :=  ListaPessoa[0];  //Se quiser posso copiar um record e jogar em outro.
  ListaPessoa[1].Nome := 'Mario'; // substituo o nome se quiser..
  ListaPessoa[2].Nome := 'julio';

  //varrer minha lista de record
  for i:=0 to 2 do
  begin
     with ListaPessoa[i] do
     begin
        mostrarDadosRecord([nome]); //mostrarDadosRecord([nome, endereco, idade, etc]);
     end;
  end;

end;

end.
