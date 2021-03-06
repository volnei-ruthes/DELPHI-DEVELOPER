{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  //Ex. 1 RECORD.
  TrCustomer = record
    firstName : string[20];
    lastName  : string[20];
    address1  : string[100];
  end;

  //Ex.2 RECORD.
  TClientes = Record
    Cod: Integer;
    Nome: string;
  end;

   //Ex.3 RECORD.
  TClientes2 = Record
    Cod: Integer;
    Nome: string;
  end;

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

  //Ex. 1 Declaro minha 2 var do tipo TrCustomer Record
  John, Sarah : TrCustomer;

  //Ex. 2 Jogo meu RECORD num array definido.
  Cliente: array[1..2] of TClientes; // ou deixo free: Cliente: array of TCliente.

  //Ex. 3 Jogo meu RECORD num array indefinido.
  Cliente2: array of TClientes2;
implementation

{$R *.dfm}

//Ex. 1 A procedure/Method that displays a variable number of strings
procedure ShowCustomer(fields: array of string);
var i : Integer;
begin
  // Display all fields passed - note : arrays start at 0
  for i := 0 to Length(fields)-1 do
    ShowMessage(fields[i]);
end;

//Ex. 1.
procedure TForm1.Button1Click(Sender: TObject);
begin
    // Set up the John's customer details
  with John do
  begin
    firstName := 'John';
    lastName  := 'Smith';
    address1  := '7 Park Drive';
  end;

  // Set up John's sister similarly - simply copying the whole record
  Sarah := John;

  // And then changing the first name to suit
  Sarah.firstName := 'Sarah';

  // Now show the details of both customers
  with John do
  begin
  ShowCustomer([firstName,lastName,address1]);
  end;

  ShowMessage('-----');

  with Sarah do
  begin
  ShowCustomer([firstName,lastName,address1]);
  end;

end;

//Ex.2
procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
   //alimento o  array de record
   Cliente[1].Cod:=1;
   Cliente[1].Nome :='Volnei';
   Cliente[2].Cod:=2;
   Cliente[2].Nome :='diana';

   for i:=1 to 2 do
   begin
      showmessage(inttostr(Cliente[i].Cod));
      showmessage(Cliente[i].Nome);
   end;

end;

//Ex.3
procedure TForm1.Button3Click(Sender: TObject);
var i, lenghtArray, lowArray, hightArray:integer;
begin
   //1 seta o tamanho do array SetLength(array dinamico, tamanho).
   SetLength(Cliente2, 3);
   
  //2 alimento o  array de record
   Cliente2[0].Cod:=1;
   Cliente2[0].Nome :='Volnei';
   Cliente2[1].Cod:=2;
   Cliente2[1].Nome :='diana';
   Cliente2[2].Cod:=3;
   Cliente2[2].Nome :='aline';

   //3 funcoes uteis para saber tamanho do array etc
   lenghtArray := Length(Cliente2);// retorna o numero de elementos.
   lowArray := Low(Cliente2);  //retorna o limite inferior do array (posi??o do primeiro elemento).
   hightArray := High(Cliente2); //retorna a posi??o superior do array (ultimo elemento).

   //4 varrer o arrays dinamico.
   for i:=Low(Cliente2) to High(Cliente2) do
   begin
      showmessage(inttostr(Cliente2[i].Cod));
      showmessage(Cliente2[i].Nome);
   end;

   //Para arrays dinamicos deve fazer a libera??o na memoria com o finalize.
   finalize(Cliente2);

end;

end.
