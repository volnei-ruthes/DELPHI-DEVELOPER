unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
var nome:string;
    retorno:string;


    procedure deBoasVindas(   pNome:string;   out pSaida:string   );
    begin
       showmessage('Bem vindo: '+pNome);

       if (pNome = 'volnei') then
         pSaida := 'esse ? um programador b?o!'
       else
         pSaida := 'esse n?o ? um programador bao!'
    end;


begin
  nome := 'julio';

  deBoasVindas(nome,retorno);

  showmessage(nome+' '+retorno);


end;
procedure TForm1.Button2Click(Sender: TObject);
VAR
  texto, resultado:string;

    function FinalStr(const Str:String;const n:integer):String;
    begin
      Result:='';
      if Length(Str)>=(n) then Result:=Copy(Str,n,Length(Str)-n+1);
    end;

begin
 texto:= 'o rato roeu a roupa do rei de roma';

 resultado := finalStr(texto,12);

 showmessage(resultado);

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  valor1: integer;
  resultado: integer;


    procedure alteraUmValor(number:integer; var retorno: integer);
    begin

      if (number = 5) then begin
         retorno := 10;
      end else begin
         retorno := 0;
      end;
    
      showmessage(inttostr(number));

    end;








begin
  //inicializa o dado
  valor1 := 5;



  //processa o dado
  alteraUmValor(valor1, resultado);

  showmessage(inttostr(resultado));





end;

end.
