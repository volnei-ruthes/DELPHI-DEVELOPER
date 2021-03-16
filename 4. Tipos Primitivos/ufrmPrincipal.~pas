unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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
   // Integer types :
   Int1 : Byte;     //                        0 to 255
   Int2 : ShortInt; //                     -127 to 127
   Int3 : Word;     //                        0 to 65,535
   Int4 : SmallInt; //                  -32,768 to 32,767
   Int5 : LongWord; //                        0 to 4,294,967,295
   Int6 : Cardinal; //                        0 to 4,294,967,295
   Int7 : LongInt;  //           -2,147,483,648 to 2,147,483,647
   Int8 : Integer;  //           -2,147,483,648 to 2,147,483,647
   Int9 : Int64;    // -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
 
   // Decimal types :
   Dec1 : Single;   //  7  significant digits, exponent   -38 to +38
   Dec2 : Currency; // 50+ significant digits, fixed 4 decimal places
   Dec3 : Double;   // 15  significant digits, exponent  -308 to +308
   Dec4 : Extended; // 19  significant digits, exponent -4932 to +4932

   //EXAMPLE 1.
const
   YOUNG_AGE = 23;         // Small integer constant
   MANY      = 300;        // Bigger integer constant
   RICH      = 100000.00;  // Decimal number : note no thousand commas
 
var
  Age       : Byte;       // Smallest positive integer type
  Books     : SmallInt;   // Bigger signed integer
  Salary    : Currency;   // Decimal used to hold financial amounts
  Expenses  : Currency;
  TakeHome  : Currency;

   //EXAMPLE 2
var
  myInt : Integer;  // Define integer and decimal variables
  myDec : Single;
begin
   //EXAMPLE 1:
   //Assigning to and from number variables
   Age       := YOUNG_AGE; // Assign from a predefined constant
   Books     := MANY + 45; // Assign from a mix of constants (expression)
   Salary    := RICH;      // Assign from a predefined constant
   Expenses  := 12345.67;  // Assign from a literal constant
   TakeHome  := Salary;    // Assign from another variable
   TakeHome  := TakeHome - Expenses;  // Assign from an expression
   { Age       is set to 23
     Books     is set to 345
     Salary    is set to 100000.00
     Expenses  is set to 12345.67
     TakeHome  is set to 87654.33  }

   //************************************************************************

   //EXAMPLE 2:
   //Numerical operators
   { +   : Add one number to another
     -   : Subtract one number from another
     *   : Multiply two numbers
     /   : Divide one decimal number by another
     div : Divide one integer number by another
     mod : Remainder from dividing one integer by }
   myInt := 20;           // myInt is now 20
   myInt := myInt + 10;   // myInt is now 30
   myInt := myInt - 5;    // myInt is now 25
   myInt := myInt * 4;    // myInt is now 100
   myInt := 14 div 3;     // myInt is now 4   (14 / 3 = 4 remainder 2)
   myInt := 14 mod 3;     // myInt is now 2   (14 / 3 = 4 remainder 2)
   myInt := 12 * 3 - 4;   // myInt is now 32  (* comes before -)
   myInt := 12 * (3 - 4); // myInt is now -12 (brackets come before *) 
   myDec := 2.222 / 2.0;  // myDec is now 1.111

   //*************************************************************

   //Numeric NATIVE functions and procedures:

   ///Func: Abs - Gives the absolute value of a number (- sign is removed)
   //---function Abs ( Number : Numeric type ) : Numeric type;
   {
      Example code : Illustrating absolute values of different data types
      var
        float, bigFloat : single;
        int : Integer;
        varVar : Variant;

      begin
        float    := -1.5;       // Small negative floating point number
        bigFloat := -4.56E100;  // Infinite negative floating point number
        int      := -7;         // Negative integer
        varVar   := '-98';      // Variants are converted to floating point!

        ShowMessage('Abs(float) = '+FloatToStr(Abs(float)));
        ShowMessage('Abs(bigFloat) = '+FloatToStr(Abs(bigFloat)));
        ShowMessage('Abs(int) = '+FloatToStr(Abs(int)));

        // Variants are converted into Extended floating types
        float := Abs(varVar);
        ShowMessage('Abs(varVar) = '+FloatToStr(float));
      end; }

    ///Func: Max - Gives the maximum of two integer values
    //---function Max ( const A, B : Integer|Int64|Single|Double|Extended ) : Integer|Int64|Single|Double|Extended;
    { Example code : Illustrate integer use of Max
        var
          int1, int2, int3 : Integer;
        begin
          int1 := 37;
          int2 := 38;
          int3 := Max(int1, int2);
        end;
        Show full unit code
           Max(int1, int2) = 38

        Example code : Illustrating Max of mixed number types
        var
          int1   : Integer;
          float1 : single;
        begin
          int1   := 37;
          float1 := 37.5;
          float1 := Max(float1, int1);
        end;
        Show full unit code
           Max(float1, int1) = 37.5

    }

    ///Func: Min - Gives the minimum of two integer values
    //--- function Min ( const A, B : Integer|Int64|Single|Double|Extended ) : Integer|Int64|Single|Double|Extended;
    {Example code : Illustrate integer use of Min
        var
          int1, int2, int3 : Integer;
        begin
          int1 := 37;
          int2 := 38;
          int3 := Min(int1, int2);
        end;
        Show full unit code
           Min(int1, int2) = 37

        Example code : Illustrating Min of mixed number types
        var
          int1   : Integer;
          float1 : single;
        begin
          int1   := 38;
          float1 := 37.5;
          float1 := Min(float1, int1);
        end;
        Show full unit code
           Min(float1, int1) = 37.5  }

   ///Func: Mean - Gives the average for a set of numbers
   //---function Mean ( const DataArray : array of Double ) : Extended;
   { Example code : Calculate the mean of a set of 5 numbers
        var
          numbers         : array[1..5] of Double;
          aveVal, meanVal : Double;
        begin
          // Set up the array of 5 floating point numbers
          numbers[1] :=  1.0;
          numbers[2] :=  2.5;
          numbers[3] :=  3.0;
          numbers[4] :=  4.5;
          numbers[5] := 25.0;

          // Metodo plus NOOB kkkk - Calculate the average of these numbers
          aveVal := (numbers[1] + numbers[2] + numbers[3] +
                     numbers[4] + numbers[5]) / 5;

          // Metodo Less NOOB - Calculate the mean of these numbers
          meanVal := Mean(numbers);

          // Show these values
          ShowMessage('Average = '+FloatToStr(aveVal));
          ShowMessage('Mean    = '+FloatToStr(meanVal));
        end;
        Show full unit code
           Average = 7.2
           Mean    = 7.2 }

   ///Func
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   Str1 : Char;        // Holds a single character, small alphabet
   Str2 : WideChar;    // Holds a single character, International alphabet
   Str3 : AnsiChar;    // Holds a single character, small alphabet
   Str4 : ShortString; // Holds a string of up to 255 Char's
   Str5 : String;      // Holds strings of Char's of any size desired
   Str6 : AnsiString;  // Holds strings of AnsiChar's any size desired
   Str7 : WideString;  // Holds strings of WideChar's of any size desired

   //String processing routines
   { AnsiLeftStr        Returns leftmost characters of a string
     AnsiMidStr         Returns middle characters of a string
     AnsiRightStr       Returns rightmost characters of a string
     AnsiStartsStr      Does a string start with a substring?
     AnsiContainsStr    Does a string contain another?
     AnsiEndsStr        Does a string end with a substring?
     AnsiIndexStr       Check substring list against a string
     AnsiMatchStr       Check substring list against a string
     AnsiReverseString  Reverses characters in a string
     AnsiReplacStr      Replaces all substring occurences
     DupeString         Repeats a substring n times
     StrScan            Scans a string for a specific character
     StuffString        Replaces part of a string text
     Trim               Removes leading and trailing white space
     TrimLeft           Removes leading white space
     TrimRight          Removes trailing white space

     Examples:
     var
       Source, Target : string;

     begin
       Source := '12345678';
       Target := Copy(Source, 3, 4);    // Target now = '3456'

       Target := '12345678';
       Insert('-+-', Target, 3);        // Target now = '12-+-345678'

       Target := '12345678';
       Delete(Target, 3, 4);            // Target now = '1278'

       Target := StringOfChar('S', 5);  // Target now = 'SSSSS'

       Source := 'This is a way to live A big life';

       // Target set to 'This is THE way to live THE big life'
       Target := StringReplace(before, ' a ', ' THE ',
                               [rfReplaceAll, rfIgnoreCase]);
   }

   //


begin

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  smallString    : string[2];
  smallString2 : ShortString;
begin
  //TYPES STRING AND CHARS
  {
     Type	 	AnsiChar	 	A character type guaranteed to be 8 bits in size
     Type	 	AnsiString	 	A data type that holds a string of AnsiChars
     Type	 	CHAR	 	Variable type holding a single character
     Type	 	ShortString	 	Defines a string of up to 255 characters
     Type	 	STRING	 	A data type that holds a string of characters
     Type	 	WideChar	 	Variable type holding a single International character
     Type	 	WideString	 	A data type that holds a string of WideChars
  }

  //Example: ShortString Type - Defines a string of up to 255 characters

  // Assign to our small string
  smallString := 'ABCD';
  ShowMessageFmt('smallString size = %d',[SizeOf(smallString)]);
  ShowMessageFmt('smallString = %S',[smallString]);
  { Result
    smallString size = 3
    smallString = AB  }

  // Assign to our slightly bigger string
  smallString2 := 'ABCD';
  ShowMessageFmt('smallString2 size = %d',[SizeOf(smallString2)]);
  ShowMessageFmt('smallString2 = %S',[smallString2]);
  { Result
    smallishString size = 256
    smallishString = ABCD  }
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  {  Função	 	AnsiCompareStr	 	Compare duas strings para igualdade (Upper case letters > Lower case letters OU Lower case letters > Numbers
     Função	 	AnsiCompareText	 	Compare duas strings para igualdade, ignorando maiúsculas e minúsculas  oBS. Em delphi Letras> Números
     Função	 	AnsiContainsStr	 	Retorna verdadeiro se uma string contém uma substring, diferencia maiúsculas de minúsculas - A função AnsiContainsStr procura por uma string Needle em uma string Haystack , retornando true se a encontrar. Caso contrário, falso.
     Função	 	AnsiContainsText	 	Retorna verdadeiro se uma string contém uma substring, não diferencia maiúsculas de minúsculas
     Função	 	AnsiEndsStr	 	Retorna verdadeiro se uma string termina com uma substring
     Função	 	AnsiIndexStr	 	Compara uma string com uma lista de strings - retorna o índice de correspondência
     Função	 	AnsiLeftStr	 	Extrai caracteres da esquerda de uma string
     Função	 	AnsiLowerCase	 	Alterar caracteres maiúsculos em uma string para minúsculos
     Função	 	AnsiMatchStr	 	Retorna verdadeiro se uma string corresponder exatamente a uma de uma lista de strings
     Função	 	AnsiMidStr	 	Retorna uma substring dos caracteres do meio de uma string
     Função	 	AnsiPos	 	Encontre a posição de uma corda na outra
     Função	 	AnsiReplaceStr	 	Substitui uma parte de uma string por outra
     Função	 	AnsiReverseString	 	Inverte a sequência de letras em uma string
     Função	 	AnsiRightStr	 	Extrai caracteres da direita de uma string
     Função	 	AnsiStartsStr	 	Retorna verdadeiro se uma string começar com uma substring
     Função	 	AnsiUpperCase	 	Alterar caracteres minúsculos em uma string para maiúsculas
     Procedimento	 	AppendStr	 	Concatene uma corda com a ponta da outra
     Função	 	CompareStr	 	Compare duas strings para ver qual é maior que a outra
     Função	 	CompareText	 	Compare duas strings para igualdade, ignorando maiúsculas e minúsculas
     Função	 	Concat	 	Concatena uma ou mais strings em uma string
     Função	 	cópia de	 	Crie uma cópia de parte de uma string ou array
     Procedimento	 	Excluir	 	Exclua uma seção de caracteres de uma string
     Função	 	DupeString	 	Cria uma string contendo cópias de uma substring
     Função	 	Alto	 	Retorna o maior valor de um tipo ou variável
     Procedimento	 	Inserir	 	Insira uma corda em outra corda
     Função	 	LastDelimiter	 	Encontre a última posição dos caracteres selecionados em uma string
     Função	 	Comprimento	 	Retorna o número de elementos em uma matriz ou string
     Função	 	LowerCase	 	Alterar caracteres maiúsculos em uma string para minúsculos
     Procedimento	 	Jogada	 	Copie bytes de dados de uma fonte para um destino
     Função	 	Pos	 	Encontre a posição de uma corda na outra
     Procedimento	 	ProcessPath	 	Divida uma string de unidade / caminho / nome de arquivo em suas partes constituintes
     Procedimento	 	SetLength	 	Altera o tamanho de uma string ou o (s) tamanho (s) de uma matriz
     Procedimento	 	SetString	 	Copia caracteres de um buffer em uma string
     Função	 	StringOfChar	 	Cria uma string com um caractere repetido várias vezes
     Função	 	StringReplace	 	Substitua uma ou mais substrings encontradas em uma string
     Função	 	StrScan	 	Pesquisa um caractere específico em uma string constante
     Função	 	StuffString	 	Substitui uma parte de uma string por outra
     Modelo	 	TReplaceFlags	 	Define opções para a rotina StringReplace
     Função	 	Aparar	 	Remove espaços em branco à esquerda e à direita de uma string
     Função	 	TrimLeft	 	Remove os espaços em branco iniciais de uma string
     Função	 	TrimRight	 	Remove espaços em branco à direita de uma string
     Modelo	 	TStringList	 	Contém uma lista de strings de comprimento variável
     Função	 	UpCase	 	Converter um valor Char em maiúsculas
     Função	 	UpperCase	 	Alterar caracteres minúsculos em uma string para maiúsculas
     Função	 	WrapText	 	Adicione alimentações de linha em uma string para simular a quebra de linha }
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  {  //CONVERSIONS FROM
     Função	 	Formato	 	Formatação rica de números e texto em uma string
     Função	 	StringToWideChar	 	Converte uma string normal em um buffer com terminação WideChar 0
     Função	 	StrToCurr	 	Converta uma string numérica em um valor monetário
     Função	 	StrToDate	 	Converte uma string de data em um valor TDateTime
     Função	 	StrToDateTime	 	Converte uma string de data + hora em um valor TDateTime
     Função	 	StrToFloat	 	Converte uma string numérica em um valor de ponto flutuante
     Função	 	StrToInt	 	Converte uma string inteira em um valor inteiro
     Função	 	StrToInt64	 	Converta uma string inteira em um valor Int64
     Função	 	StrToInt64Def	 	Converta uma string em um valor Int64 com o padrão
     Função	 	StrToIntDef	 	Converta uma string em um valor inteiro com o padrão
     Função	 	StrToTime	 	Converte uma string de hora em um valor TDateTime
     Modelo	 	TFormatSettings	 	Um registro para manter valores de localidade para funções thread-safe
     Variável	 	TwoDigitYearCenturyWindow	 	Define o limite de século para conversões de sequência de anos de 2 dígitos
     Procedimento	 	Val	 	Converte strings numéricas em valores inteiros e de ponto flutuante  }

  {  CONVERSION TO
     Variável	 	CurrencyDecimals	 	Define a contagem de dígitos decimais na função Format
     Variável	 	CurrencyFormat	 	Define a colocação da string de moeda nas funções de exibição de moeda
     Variável	 	CurrencyString	 	A string de moeda usada nas funções de exibição de moeda
     Função	 	CurrToStrF	 	Converta um valor de moeda em uma string com formatação
     Função	 	DateTimeToStr	 	Converte valores de data e hora TDateTime em uma string
     Procedimento	 	DateTimeToString	 	Formatação rica de uma variável TDateTime em uma string
     Função	 	DateToStr	 	Converte um valor de data TDateTime em uma string
     Variável	 	Separador decimal	 	O caractere usado para exibir o ponto decimal
     Função	 	FloatToStr	 	Converte um valor de ponto flutuante em uma string
     Função	 	FloatToStrF	 	Converta um valor de ponto flutuante em uma string com formatação
     Função	 	Formato	 	Formatação rica de números e texto em uma string
     Função	 	FormatCurr	 	Formatação rica de um valor de moeda em uma string
     Função	 	FormatDateTime	 	Formatação rica de uma variável TDateTime em uma string
     Função	 	FormatFloat	 	Formatação rica de um número de ponto flutuante em uma string
     Função	 	Caixa de entrada	 	Exibe uma caixa de diálogo que pede a entrada de texto do usuário, com o padrão
     Função	 	InputQuery	 	Exibe uma caixa de diálogo que pede a entrada de texto do usuário
     Função	 	IntToHex	 	Converter um inteiro em uma string hexadecimal
     Função	 	IntToStr	 	Converte um inteiro em uma string
     Variável	 	LongDateFormat	 	Versão longa da data para formato de string
     Variável	 	LongDayNames	 	Uma matriz de nomes de dias da semana, começando 1 = domingo
     Variável	 	LongMonthNames	 	Uma matriz de dias dos nomes dos meses, começando 1 = janeiro
     Variável	 	LongTimeFormat	 	Versão longa do tempo para o formato da string
     Variável	 	NegCurrFormat	 	Define a formatação do valor negativo em exibições de moeda
     Função	 	Ord	 	Fornece o valor ordinal de um número inteiro, caractere ou enum
     Variável	 	ShortDateFormat	 	Versão compacta da data para formato de string
     Variável	 	ShortDayNames	 	Uma matriz de nomes de dias da semana, começando 1 = domingo
     Variável	 	ShortMonthNames	 	Uma matriz de dias dos nomes dos meses, começando em 1 = janeiro
     Variável	 	ShortTimeFormat	 	Versão curta do tempo para o formato da string
     Procedimento	 	Str	 	Converte um número inteiro ou de ponto flutuante em uma string
     Modelo	 	TFormatSettings	 	Um registro para manter valores de localidade para funções thread-safe
     Variável	 	ThousandSeparator	 	O caractere usado para exibir o separador de milhares
     Função	 	WideCharToString	 	Copia uma string WideChar terminada em nulo para uma string normal  }

     { DISPLAYING

       Função	 	Formato	 	Formatação rica de números e texto em uma string
       Função	 	Caixa de entrada	 	Exibe uma caixa de diálogo que pede a entrada de texto do usuário, com o padrão
       Função	 	InputQuery	 	Exibe uma caixa de diálogo que pede a entrada de texto do usuário
       Função	 	MessageDlg	 	Exibe uma mensagem, símbolo e botões selecionáveis
       Função	 	MessageDlgPos	 	Exibe uma mensagem mais botões em uma determinada posição da tela
       Procedimento	 	Mostrar mensagem	 	Mostra uma string em uma caixa de diálogo simples com um botão OK
       Procedimento	 	ShowMessageFmt	 	Exibir dados formatados em uma caixa de diálogo simples com um botão OK
       Procedimento	 	ShowMessagePos	 	Exibe uma string em uma caixa de diálogo simples em uma determinada posição da tela
       Modelo	 	TFloatFormat	 	Formatos para uso em funções de exibição de número de ponto flutuante
       Modelo	 	TFormatSettings	 	Um registro para manter valores de localidade para funções thread-safe
       Modelo	 	TPrintDialog	 	Classe que cria uma seleção de impressora e diálogo de controle  }
end;

end.
