unit Unit1;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  umArray : array of string;
  multiArray : array of array of string;
begin
  // ARRAY.
  // Array - hold a indexable collections of data  (TIPO UNICO OU DIMENSIONAL(colxlin ver na web img de um exemplo).
  // Description The Array keyword provides single and multi dimensional arrays (indexable sequences) of data.

  // Delphi has three basic array types :
  // 1.STATIC arrays; (These are defined with fixed, unchangeable sizes.) TAM. FIXO E IMUTÁVEL.
  // 2.DYNAMICS arrays;
  // 3.OPEN arrays;

  //Example unidimensional:
  SetLength(umArray,2);
  umArray[0] := 'array unidimensional no indice 0';
  ShowMessage(inttostr(Length(umArray)));
  ShowMessage(inttostr(Low(umArray)));
  ShowMessage(inttostr(High(umArray)));
  ShowMessage(umArray[0]);
  //Example multidimensional:
  SetLength(multiArray,2,2);
  multiArray[0][0]:= 'array multidimensional indice 0.0';
  ShowMessage(inttostr(Length(multiArray)));
  ShowMessage(inttostr(Low(multiArray)));
  ShowMessage(inttostr(High(multiArray)));
  ShowMessage(multiArray[0][0]);


end;

procedure TForm1.Button2Click(Sender: TObject);
var
  //Define static arrays
  byteArray  : Array[Byte] of Integer;     // Static, size=High(byte)
  multiArray : Array[byte, 0..2] of char;  // Static array, 2 dimensions
  rangeArray : Array[5..10] of string;     // Static array, size = 16

  i : Integer;
begin
  //RELEMBRANDO:
  //Static arrays - These are defined with fixed, unchangeable sizes.

  //Example Static Array - Show the sizes and ranges of these arrays

  //byte array
  ShowMessage('byteArray length = '+IntToStr(Length(byteArray)));
  ShowMessage('byteArray lowest element = '+IntToStr(Low(byteArray)));
  ShowMessage('byteArray highest element = '+IntToStr(High(byteArray)));
  //multiArray
  ShowMessage('multiArray length = '+IntToStr(Length(multiArray)));
  ShowMessage('multiArray lowest element = '+IntToStr(Low(multiArray)));
  ShowMessage('multiArray highest element = '+IntToStr(High(multiArray)));
  //rangeArray
  ShowMessage('rangeArray length = '+IntToStr(Length(rangeArray)));
  ShowMessage('rangeArray lowest element = '+IntToStr(Low(rangeArray)));
  ShowMessage('rangeArray highest element = '+IntToStr(High(rangeArray)));
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  // Define dynamic arrays
  byteArray  : Array of Byte;           // Single dimension array
  multiArray : Array of Array of string;  // Multi-dimension

  i,j:integer;
begin
  //2.Dynamic arrays
  //Dynamic arrays have no preallocated storage. When defined, only a pointer is created.Such arrays must have their length set
  //before they can be used. For example : SetLength(dynArray, 5) - sets the dynArray single dimension array size to 5 elements.

  //Example code : Declaring and using dynamic arrays:

  // SINGLE ARRAY DINAMIC:
  SetLength(byteArray, 5); //Set the length of the single dimension array
  // Show the size and range of this array
  ShowMessage('byteArray length = '+IntToStr(Length(byteArray)));
  ShowMessage('byteArray lowest element = '+IntToStr(Low(byteArray)));
  ShowMessage('byteArray highest element = '+IntToStr(High(byteArray)));

  // MULTIDIMENSIONAL ARRAY DINAMIC:
  SetLength(multiArray, 3); // Set the length of the 1st dimension of the multi-dim array
  // Set the length of the 3 sub-arrays to different sizes
  SetLength(multiArray[0], 1);
  SetLength(multiArray[1], 2);
  SetLength(multiArray[2], 3);

  // Set and show all elements of this array
  for i := 0 to High(multiArray) do
    for j := 0 to High(multiArray[i]) do
    begin
      multiArray[i,j] := IntToStr(i+j);
      ShowMessage('multiArray['+intToStr(i)+','+intToStr(j)+'] = '+
                  multiArray[i,j]);
    end;

  {  multiArray[0,0] = 0
     multiArray[1,0] = 1
     multiArray[1,1] = 2
     multiArray[2,0] = 2
     multiArray[2,1] = 3
     multiArray[2,2] = 4
  }

end;

procedure TForm1.Button4Click(Sender: TObject);

      procedure ShowOpenConstArray(const constArray : Array of const);
      var i : Integer;
      begin
        // Show all elements of the passed array. IMPORTANT - we assume here that the constant types are all char
        for i := 0 to High(constArray) do
          ShowMessage('constArray['+intToStr(i)+'] = '+constArray[i].VChar);
      end;

      procedure ShowOpenTypeArray(typeArray : Array of char);
      var i : Integer;
      begin
        // Show all elements of the passed array
        for i := 0 to High(typeArray) do
          ShowMessage('typeArray['+intToStr(i)+'] = '+typeArray[i]);
      end;

var
  openArray : Array [0..2] of char;

begin
  //3.Open arrays
  //3.1 Pass a number of characters as an open constant array to a subroutine:
  ShowOpenConstArray(['H','e','l','l','o']);

  //3.2 Furnish an array for the next routine
  openArray[0] := 'N';
  openArray[1] := 'o';
  openArray[2] := 'w';
  // Pass this predefined array as an open array to a subroutine
  ShowOpenTypeArray(openArray);
end;

end.
