unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

   //Registro Pessoa.
   TPessoa = Record
     nome : String[20];
     idade  : Integer;
   end;
   //Ponteiro Pessoa
   PtrPessoa = ^Tpessoa;
   //o símbolo ^ é usado para remover a referência do tipo, ou seja,
   // estamos dizendo que não temos um tipo TPessoa, mas um ponteiro apontando para um caminho. ( ^RemoveReferencia x AdcionaValor^ )


  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  variavel: integer;
  ponteiro: ^integer;
begin
  variavel := 10;
  ShowMessage('Valor da variável: ' + IntToStr(variavel));
  ponteiro := @variavel;  //atribuindo ao ponteiro o endereço da variável
  ShowMessage('Valor apontado pelo ponteiro: ' + IntToStr(ponteiro^));
  variavel := variavel + 10;
  ShowMessage('Valor apontado pelo ponteiro após a soma: ' + IntToStr(ponteiro^));
  ponteiro^ := ponteiro^ + 5;
  ShowMessage('Valor atual da variável: ' + IntToStr(variavel)); 
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Pessoa:TPessoa;
  PtrPessoa1: ^TPessoa;
  PtrPessoa2: PtrPessoa;
begin

  //1. EXEMPLO

  //1.1 Populando Registro Pessoa do Tipo TPessoa.
  Pessoa.nome:='Carlos';
  Pessoa.idade:=35;

  PtrPessoa1 := @Pessoa; //atribuindo ao ponteiro o endereço da variável

  showmessage(PtrPessoa1.nome);

  //2.EXEMPLO

  //2.1
  PtrPessoa2 := new(PtrPessoa); // Quando for trabalhar com ponteiros é importante usar o new para alocar espaço na memória
  PtrPessoa2^.nome := 'Mario';  // ( ^RemoveReferencia X AdcionaValor^ )
  PtrPessoa2^.idade := 30;

  showmessage(PtrPessoa2^.nome);
end;

end.
