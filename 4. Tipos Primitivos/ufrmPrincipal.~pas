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

end.
