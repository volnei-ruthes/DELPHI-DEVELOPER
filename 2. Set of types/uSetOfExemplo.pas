unit uSetOfExemplo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, typinfo;

type
  TDiasSemana = (Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado);
  
  TAlfabeto = (a, b, c, d, e, f);
  TConjunto = set of TAlfabeto;

  TCLetras = set of char;



  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
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

procedure TForm1.FormShow(Sender: TObject);

var
 consoantes : array of string;
 i:integer;
begin
  SetLength(consoantes, 50); 
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  conjunto1, conjunto2, conjuntoResultado: TCLetras;
  resultado:boolean;
begin
  conjunto1:=['a','b','c'];
  conjunto2:=['a','m','c'];

  //--OPERAÇÕES--//
  //Operação: + UNIAO retorna um CONJUNTO cujos elementos estao contidos em quanquer dos elementos.
  conjuntoResultado:= conjunto1+conjunto2;
  //Operação: - DIFERENÇA retorna um CONJUNTO cujos elementos estao contidos no primeiro E NAO no segundo.
  conjuntoResultado:= conjunto1-conjunto2;  //so retorna B, pq o B nao esta no segundo.
  conjuntoResultado:= conjunto2-conjunto1;  //so retorna M, pq o sendo conj.2 o primeiro M nao esta no segundo conj.1.
  //Operação: * INTERCEÇÃO retorna um CONJUNTO cujos elementos estao obrigatoriamente nos dois elementos.
  conjuntoResultado:= conjunto1*conjunto2; //retorna 'a' e 'c'.
  //Operação: <= SUBCONJUNTO (esta contido) retorna true/false se o primeiro conjunto é ou não um subconjunto do segundo.
  /// isto é se todo e qualquer elemento do primeiro está no segundo conjunto.
  resultado:= conjunto1<=conjunto2; //retorna false pq tem que ter TODOS os elemntos do primeiro no segundo.
  showmessage(BoolToStr(resultado));
  //Operação: >= SUPERCONJUNT0 (contem) retorna true/false se o primeiro conjunto é ou não um superconjunto do segundo.
  /// isto é se todo e qualquer elemento do segundo está presente no primeiro conjunto.
  resultado:= conjunto1>=conjunto2; //retorna false pq tem que ter TODOS os elemntos do segundo no primeiro.
  showmessage(BoolToStr(resultado));
  //Operação: = IGUALDADE retorna true/false retorna true se todo o elemento do primeiro esta no segundo e vice e versa.
  resultado:= conjunto1=conjunto2;
  //Operação: <> DESIGUALDADE retorna true/false retorna true se ao menos um do elemento do primeiro não estiver no segundo e vice e versa.
  resultado:= conjunto1=conjunto2;
  //Operação: = IN retorna true/false retorna true se o operador esta presente no conjunto2.
  resultado:= conjunto1=conjunto2;
  //Exemplo IN.
  if 'a' in conjunto1 then begin
     showmessage('vogais E estao dentro de consoantes');
  end else begin
    showmessage('NAO esta E dentro de consoantes');
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
const
  FIM_DE_SEMANA : Set of TDiasSemana = [Sabado, Domingo];
var
  DiasExpediente : Set of TDiasSemana;
begin

   if Segunda in FIM_DE_SEMANA then
    ShowMessage('Folga!')
  else
    ShowMessage('Dia de trabalhar');

  //ou

  DiasExpediente := [Segunda..Sexta];
  if Domingo in DiasExpediente then
    ShowMessage('É dia de trabalhar')
  else
    ShowMessage('Folga!');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  I: TAlfabeto;
  ConjB:  TConjunto;
begin
  ConjB := [d, b, f];

   //Varre alfabeto.
   for I := Low(I) to High(I) do begin
       //verifica se I esta no conjuntoB
       if I in ConjB then begin
          //Trata se I estar no conjunto.
          Showmessage('o Valor: '+GetEnumName(TypeInfo(TAlfabeto),integer(I))+ ' - esta no conjunto B!');
       end;
   end;
end;

end.
