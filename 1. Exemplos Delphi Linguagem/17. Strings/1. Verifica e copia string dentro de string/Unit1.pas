unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, StrUtils, TypInfo;



type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
    function GetNewID(Prefix: String): string;                                  //Fun��o para gerar um ID �nico em String.
    function CaseOfString(s: string; a: array of string): Integer;              //4. CASE COM STRING.
    function CountPos(const subtext: string; Text: string): Integer;            //7. CONTA N� VEZES DE UM TEXTO DENTRO DE UMA STRING.
    function RemoveAcento1(aText : string) : string;                            //8. Fun��o para remover acentos de uma string.
    function RemoveAcento2(const pText: string): string;                        //8. Fun��o para remover acentos de uma string.



  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//10. Reverse String
procedure TForm1.Button10Click(Sender: TObject);
begin
   {Com esta fun��o podemos facilmente inverter ou mesmo
    reverter uma string invertida.

    � necess�rio estar declarado StrUtils na se��o uses,
    em vers�es unicode declare System.StrUtils;

    Fun��o do Delphi: ReverseString(Texto)
    Retorno: String;}

    ShowMessage( ReverseString('Texto') );

    ShowMessage( ReverseString('ihpleD wohS') );
end;


procedure TForm1.Button11Click(Sender: TObject);
begin
   {� necess�rio estar declarado SysUtils na se��o uses,
    em vers�es unicode declare System.SysUtils.}

   { Exemplo 1 }
  ShowMessage(LowerCase('TestE'));
  { Exemplo 2 }
  ShowMessage(UpperCase('show delphi'));
end;

procedure TForm1.Button12Click(Sender: TObject);
//12. Trocar extes�o de arquivo
var
  vMeuArquivo : String;
begin

  vMeuArquivo := 'C:\meuarquivo.xml';
  ShowMessage(vMeuArquivo);

  // trocando a extens�o para pdf
  vMeuArquivo := ChangeFileExt(vMeuArquivo, '.pdf');
  ShowMessage(vMeuArquivo);
end;

//1. VERIFICA UMA STRING E RETORNA A MESMA.
procedure TForm1.Button1Click(Sender: TObject);
var posicao : integer;
    textoQualquer: string;
begin
  textoQualquer := 'O gato roeu a roupa do rei Gato';
  posicao := Pos('gato',textoQualquer);   //POS - verifica se existe o texto e retorna a posi��o encontrada.

  if posicao = 0 then
    showmessage('nao encontrado')
  else
    showmessage('encontrado, posicao: '+inttostr(posicao)+', palavra: '+copy( textoQualquer, Pos('gato',textoQualquer), 4));           //Copy(�texto�, posi��o inicial, quantidade de caractares a serem copiados)

end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage( GetNewID('SD') );                                                //Fun��o para gerar um ID �nico em String
end;

//3. RECUPERA POSI��O DE UMA STRING DENTRO DE UM ARRAY STRING.
procedure TForm1.Button3Click(Sender: TObject);
const
  DFeUF: array[0..26] of String = ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA',
                                   'PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO');
begin
  {Como recuperar a posi��o de uma string dentro de um array de strings?
    As vezes temos um vetor(array) de strings, como por exemplo c�digos contantes,
      e precisamos recuperar a posi��o de um elemento dentro do vetor.

    Para resolver este problema, no caso de strings, pode-se utilizar uma fun��o
      nativa do Delphi. IndexStr ou IndexText
    Sendo necess�rio declarar StrUtils na se��o uses.  (System.StrUtils) em vers�es unicode.}

  ShowMessage( IntToStr( IndexStr('RS', DFeUF))  );

  ShowMessage( IntToStr( IndexStr('SP', DFeUF))  );

  ShowMessage( IntToStr( IndexStr('AC', DFeUF))  );
end;

//4. CASE COM STRING.
procedure TForm1.Button4Click(Sender: TObject);
var
  lista : array[0..2] of string;
  linguagem : String;
begin
  // Preenchendo o vetor.
  lista[0] := 'Object Pascal';
  lista[1] := 'C++';
  lista[2] := 'Java';

  // Simulando uma op��o selecionada pelo usu�rio
  linguagem := 'Java';

  // Neste caso o case � formado com base na posi��o da string no vetor.
  case CaseOfString(linguagem, lista) of
    0 : ShowMessage('Delphi');
    1 : ShowMessage('C Builder');
    2 : ShowMessage('NetBeans');
  end;

end;

//5. ENUM para STRING
procedure TForm1.Button5Click(Sender: TObject);
type
  Language = (Delphi, Lazarus, CBuilder);

var
  StrLanguage: String;
begin
  {Para converter um Tipo Enum uma String, voc� pode usar a fun��o
           GetEnumName declarada na unit TypInfo.}
  StrLanguage := GetEnumName(TypeInfo(Language), Integer(Delphi));
  ShowMessage(StrLanguage);
end;

//6. STRING para ENUM.
procedure TForm1.Button6Click(Sender: TObject);
type
  Language = (Delphi, Lazarus, CBuilder);
var
  aLanguage: Language;
begin
  {Para converter um string em um tipo Enum, voc� pode usar a fun��o
             GetEnumValue declarada na unit TypInfo.}
  aLanguage := Language(GetEnumValue(TypeInfo(Language), 'Delphi'));
end;

//7. CONTA N� VEZES DE UM TEXTO DENTRO DE UMA STRING.
procedure TForm1.Button7Click(Sender: TObject);
var
  teste : String;
  vCount : Integer;
begin
  teste := 'O Show Delphi � uma comunidade que quer compartilhar' +
     ' conhecimento sobre o Delphi.';
  vCount := CountPos('Delphi', teste);

  ShowMessage('Delphi foi encontrado ' + IntToStr(vCount) + ' vez(es)!' );
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  vTexto : String;
begin
   {Quem trabalha com arquivos texto, muitas vezes se depara com a
    necessidade de remover acentos das palavras.
    A boa not�cia � que existe uma fun��o muito pr�tica
    para resolver este problema.

    � necess�rio estar declarado SysUtils na se��o uses,
    em vers�es unicode declare System.SysUtils;}

  { Exemplo 1 - Com vari�veis }
  vTexto := 'Jo�o � um aluno de Delphi.';
  vTexto := RemoveAcento1(vTexto);
  ShowMessage(vTexto);

  { Exemplo 2 - String Est�tica. }
  ShowMessage(RemoveAcento2('A �RVORE � DE MA�A'));
end;

//9. descobrir a posi��o de um car�cter dentro de uma string a partir de uma posi��o inicial
procedure TForm1.Button9Click(Sender: TObject);
begin
  { Esta fun��o � uma extens�o da fun��o Pos, que permite
    procurar ocorr�ncias de texto dentro de uma string,
    depois de determinada posi��o.

    � necess�rio estar declarado StrUtils na se��o uses,
    em vers�es unicode declare System.StrUtils;

    Fun��o do Delphi: PosEx(SubString, String, posi��o inicial)
    Retorno: Integer;}



  { Neste exemplo a fun��o vai procurar a primeira
  ocorr�ncia de "t" a partir da terceira letra. }
  ShowMessage(IntToStr(PosEx('t', 'texto', 3)));

  { Neste caso retorna 0 porque n�o h� ocorr�ncia de
  "w" ap�s o sexto caractere }
  ShowMessage(IntToStr(PosEx('w', 'Show Delphi', 6)));

end;

//4. CASE COM STRING.
function TForm1.CaseOfString(s: string; a: array of string): Integer;
begin
  Result := 0;
  while (Result < Length(a)) and (a[Result] <> s) do
    Inc(Result);

  if (a[Result] <> s) then
    Result := -1;
end;

//7. CONTA N� VEZES DE UM TEXTO DENTRO DE UMA STRING.
function TForm1.CountPos(const subtext: string; Text: string): Integer;
begin
  if (Length(subtext) = 0) or (Length(Text) = 0) or (Pos(subtext, Text) = 0)
  then
    Result := 0
  else
    Result := (Length(Text) - Length(StringReplace(Text, subtext, '',
      [rfReplaceAll]))) div Length(subtext);
end;

//2. GERA ID UNICO PARA STRING.
function TForm1.GetNewID(Prefix: String): string;                               //Fun��o para gerar um ID �nico em String
var
  reg: array [1 .. 7] of word;
  i: integer;
begin
  { how Delphi � Miscel�nea, Object Pascal e Strings � Fun��o para gerar um ID �nico em String
      Fun��o para gerar um ID �nico em String. Muitas vezes � necess�rio criar algum indexificador �nico
      em nossas aplica��es.  Para resolver de modo f�cil este problema, � poss�vel
          fazer uso da fun��o abaixo: Obs: � necess�rio estas declarado System.SysUtils na se��o uses. }

  { EDIT: Vou por mais estas linhas abaixo, para que o prefixo nunca
  tenha mais de 2 caracteres, e assim fique fixo o tamanho 16 bytes  }
  if length(Prefix) > 2 then
    Prefix := Copy(Prefix, 1, 2)
  else
    while length(Prefix) < 2 do
      Prefix := ' ' + Prefix;

  Result := '';
  DecodeDate(Date, reg[1], reg[2], reg[3]);
  reg[1] := StrToInt(Copy(IntToStr(reg[1]), 3, 2));

  { Esta corrige o ano para apenas dois digitos, por forma a ser inferior a
  255. em vez de reg[1] estava a variavel ano. }
  DecodeTime(Time, reg[4], reg[5], reg[6], reg[7]);
  reg[7] := reg[7] div 4; // esta corrige os milisegundos
  randomize;
  for i := 1 to 7 do
  begin
    if (i >= 2) and (i <= 6) then
      reg[i] := reg[i] + random(100);

    { O random � uma seguran�a adicional, pois como o ano e os milisegundos n�o
    s�o usados na totalidade, havia uma pequena possibilidade de sair
    duplicado... Assim � quase impossivel }
    Result := Result + IntToHex(reg[i], 2);
  end;
  Result := Prefix + Result;
end;

function TForm1.RemoveAcento1(aText: string): string;
const
  ComAcento = '��������������������������������';
  SemAcento = 'aaeouaoaeioucunyAAEOUAOAEIOUCUNY';
var
  x: Cardinal;
begin;
  for x := 1 to Length(aText) do
  try
    if (Pos(aText[x], ComAcento) <> 0) then
      aText[x] := SemAcento[ Pos(aText[x], ComAcento) ];
  except on E: Exception do
    raise Exception.Create('Erro no processo.');
  end;

  Result := aText;
end;

//8. REMOVE ACENTO STRING.
function TForm1.RemoveAcento2(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
end;

end.



{  ---- EXEMPLOS (INDICE)

1. VERIFICA UMA STRING E RETORNA A MESMA.
2. GERA ID UNICO PARA STRING.
3. RECUPERA POSI��O DE UMA STRING DENTRO DE UM ARRAY STRING.
4. CASE COM STRING.
5. ENUM para STRING
6. STRING para ENUM.
7. CONTA N� VEZES DE UM TEXTO DENTRO DE UMA STRING.
8. REMOVE ACENTO STRING.
9. DESCOBRIR POSI��O de um car�cter dentro de uma string a partir de uma posi��o inicial
10. Reverse String
11. converter os caracteres de uma string para mai�sculo
12. Trocar extes�o de arquivo



}