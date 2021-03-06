unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ConvUtils, Math ;

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
    Button13: TButton;
    Button14: TButton;
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
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses StdConvs;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  flags : TBits;         // Our variable collection of Boolean values
  i : Integer;
begin
  //type TBits - The TBits type holds a flexible collection of bits (Boolean values). The colection size can be altered at any time
  // (using the size property). Bits are accessed using the Bits property, like this : flag := myBits.Bits[2];  OR flag := myBits[2];
  // Create our TBits object
  flags := TBits.Create;

  // Add a few items to our Boolean flags collection
  flags.Size := 5;

  // And set a few values
  flags[0] := true;
  flags[1] := true;
  flags[4] := true;

  // Now display the contents of the collection
  // Note that indexing starts at 0
  for i := 0 to flags.Size-1 do
    if flags[i] = true
    then ShowMessageFmt('Bit %d is true',[i])
    else ShowMessageFmt('Bit %d is false',[i]);

  // TBits has one main method -
  // to find the index of the first false value
  ShowMessageFmt('Index of the first false value is %d',[flags.OpenBit]);

  {Bit 0 is true
   Bit 1 is true
   Bit 2 is false
   Bit 3 is false
   Bit 4 is true
   Index of the first false value is 2}


end;

procedure TForm1.Button2Click(Sender: TObject);
var
  gallons, litro, resultado  : Double;
  fromType, toType : TConvType;

begin
  //TConvType - The TConvType type defines a measurement type used in the Convert general purpose conversion utility. USES ConvUtils. 


  // Define the gallons value
  litro := 1000;

  // Convert to litres
  fromType := vuLiters;
  toType   := vuCubicMeters;
  resultado := Convert(litro, fromType, toType);

  // Display both values
  ShowMessageFmt('%f Litro = %f metro cubico',[litro, resultado]);

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  gallons, litres : Double;
begin
   //Convert - Convert one measurement value to another in ConvUtils (USES).

  // Define the gallons value
  gallons := 1;

  // Convert to litres
  litres := Convert(gallons, vuUKGallons, vuLiters);

  // Display both values
  ShowMessageFmt('%f UK gallons = %f litres',[gallons, litres]);


  //TConvFamily - Defines a family of measurement types as used by Convert.
  {var
    cbArea        : TConvFamily;
    cbDistance    : TConvFamily;
    cbMass        : TConvFamily;
    cbTemperature : TConvFamily;
    cbTime        : TConvFamily;
    cbVolume      : TConvFamily;}
    {The family contents are listed here:

    cbArea family

      auSquareMillimeters
      auSquareCentimeters
      auSquareDecimeters
      auSquareMeters
      auSquareDecameters
      auSquareHectometers
      auSquareKilometers
      auSquareInches
      auSquareFeet
      auSquareYards
      auSquareMiles
      auAcres
      auCentares
      auAres
      auHectares
      auSquareRods
 
    cbDistance family

      duMicromicrons
      duAngstroms
      duMillimicrons
      duMicrons
      duMillimeters
      duCentimeters
      duDecimeters
      duMeters
      duDecameters
      duHectometers
      duKilometers
      duMegameters
      duGigameters
      duInches
      duFeet
      duYards
      duMiles
      duNauticalMiles
      duAstronomicalUnits
      duLightYears
      duParsecs
      duCubits
      duFathoms
      duFurlongs
      duHands
      duPaces
      duRods
      duChains
      duLinks
      duPicas
      duPoints
 
    cbMass family
 
      muNanograms
      muMicrograms
      muMilligrams
      muCentigrams
      muDecigrams
      muGrams
      muDecagrams
      muHectograms
      muKilograms
      muMetricTons
      muDrams
      muGrains
      muLongTons
      muTons
      muOunces
      muPounds
      muStones
 
    cbTemperature family

      tuCelsius
      tuKelvin
      tuFahrenheit
      tuRankine
      tuReamur

    cbTime family
 
      tuMilliSeconds
      tuSeconds
      tuMinutes
      tuHours
      tuDays
      tuWeeks
      tuFortnights
      tuMonths
      tuYears
      tuDecades
      tuCenturies
      tuMillennia
      tuDateTime
      tuJulianDate
      tuModifiedJulianDate
 
    cbVolume family
 
      vuCubicMillimeters
      vuCubicCentimeters
      vuCubicDecimeters
      vuCubicMeters
      vuCubicDecameters
      vuCubicHectometers
      vuCubicKilometers
      vuCubicInches
      vuCubicFeet
      vuCubicYards
      vuCubicMiles
      vuMilliLiters
      vuCentiLiters
      vuDeciLiters
      vuLiters
      vuDecaLiters
      vuHectoLiters
      vuKiloLiters
      vuAcreFeet
      vuAcreInches
      vuCords
      vuCordFeet
      vuDecisteres
      vuSteres
      vuDecasteres
      vuFluidGallons
      vuFluidQuarts
      vuFluidPints
      vuFluidCups
      vuFluidGills
      vuFluidOunces
      vuFluidTablespoons
      vuFluidTeaspoons
      vuDryGallons
      vuDryQuarts
      vuDryPints
      vuDryPecks
      vuDryBuckets
      vuDryBushels
      vuUKGallons
      vuUKPottles
      vuUKQuarts
      vuUKPints
      vuUKGills
      vuUKOunces
      vuUKPecks
      vuUKBuckets
      vuUKBushels}
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  amount : Extended;
begin
  //The TFloatFormat type is used by the following SysUtils functions :
  //type TFloatFormat = (ffGeneral, ffExponent, ffFixed, ffNumber, ffCurrency);

  amount := 1234.56;

  // Display using ffGeneral formatting
  ShowMessage('General 4,0 = '+FloatToStrF(amount, ffGeneral, 4, 0));
  ShowMessage('General 6,0 = '+FloatToStrF(amount, ffGeneral, 6, 0));
  ShowMessage('General 6,2 = '+FloatToStrF(amount, ffGeneral, 6, 2));
  ShowMessage('General 3,2 = '+FloatToStrF(amount, ffGeneral, 3, 2));
  ShowMessage('');

  // Display using ffExponent formatting
  ShowMessage('Exponent 4,0 = '+FloatToStrF(amount, ffExponent, 4, 0));
  ShowMessage('Exponent 6,0 = '+FloatToStrF(amount, ffExponent, 6, 0));
  ShowMessage('Exponent 6,2 = '+FloatToStrF(amount, ffExponent, 6, 2));
  ShowMessage('Exponent 3,2 = '+FloatToStrF(amount, ffExponent, 3, 2));
  ShowMessage('');

  // Display using ffFixed formatting
  ShowMessage('Fixed 4,0 = '+FloatToStrF(amount, ffFixed, 4, 0));
  ShowMessage('Fixed 6,0 = '+FloatToStrF(amount, ffFixed, 6, 0));
  ShowMessage('Fixed 6,2 = '+FloatToStrF(amount, ffFixed, 6, 2));
  ShowMessage('Fixed 3,2 = '+FloatToStrF(amount, ffFixed, 3, 2));
  ShowMessage('');

  // Display using ffNumber formatting
  ShowMessage('Number 4,0 = '+FloatToStrF(amount, ffNumber, 4, 0));
  ShowMessage('Number 6,0 = '+FloatToStrF(amount, ffNumber, 6, 0));
  ShowMessage('Number 6,2 = '+FloatToStrF(amount, ffNumber, 6, 2));
  ShowMessage('Number 3,2 = '+FloatToStrF(amount, ffNumber, 3, 2));
  ShowMessage('');

  // Display using ffCurrency formatting
  ShowMessage('Currency 4,0 = '+FloatToStrF(amount, ffCurrency, 4, 0));
  ShowMessage('Currency 6,0 = '+FloatToStrF(amount, ffCurrency, 6, 0));
  ShowMessage('Currency 6,2 = '+FloatToStrF(amount, ffCurrency, 6, 2));
  ShowMessage('Currency 3,2 = '+FloatToStrF(amount, ffCurrency, 3, 2));

  {General 4,0 = 1235
   General 6,0 = 1234.56
   General 6,2 = 1234.56
   General 3,2 = 1.23E03
  
   Exponent 4,0 = 1.235E+3
   Exponent 6,0 = 1.23456E+3
   Exponent 6,2 = 1.23456E+03
   Exponent 3,2 = 1.23E+03
  
   Fixed 4,0 = 1235
   Fixed 6,0 = 1235
   Fixed 6,2 = 1234.56
   Fixed 3,2 = 1.23E03
  
   Number 4,0 = 1,235
   Number 6,0 = 1,235
   Number 6,2 = 1,234.56
   Number 3,2 = 1.23E03
  
   Currency 4,0 = ?1,235
   Currency 6,0 = ?1,235
   Currency 6,2 = ?1,234.56
   Currency 3,2 = 1.23E03}

  {The possible values of TFloatFormat are :

  ffGeneral

  Defines general number formatting that aims to keep the resultant value as compact as possible. It removes trailing zeros and the
  decimal point where appropriate. No thousand separators are shown. Exponent format is used if the mantissa is too large for the
  specified Precision value of the formatting command. In this case, the Digits value (0..4) determines
  the minimum number of exponent digits shown. The decimal point character is determined by the DecimalSeparator variable.

  ffExponent

  Commonly referred to as the Scientific or Engineering format, the exponent refers to the letter E followed by a number.
  The number gives the power of 10 of the number. For example, E+15 means 1015. The exponent always has a + or - sign. This exponent
  is preceded by a number that always has one digit before the decimal place.

  For example : 123.456 formats as 1.23456E+2 0.00123 formats as 1.23E-3

  The using function Precision parameter gives the number of displayed digits before the E, and the Digits parameter gives the number (0..4)
   of digits after the E. The decimal point character is determined by the DecimalSeparator variable.

  ffFixed

  This format again uses no thousands separator. It displays Precision digits before the decimal point, and Digits digits after.
  If there are too many digits before the decimal point, then the Exponent format is used instead.
  The decimal point character is determined by the DecimalSeparator variable.

  ffNumber

  Same as ffFixed, except that thousand separators are used. These are defined by the ThousandSeparator variable.

  ffCurrency

  Same as ffNumber, but with a currency symbol (string) added, as defined by the CurrencyString variable. Additionally, the formatting is influenced by the CurrencyFormat and NegCurrFormat variables.}

end;

procedure TForm1.Button5Click(Sender: TObject);
 var
  before, after : string;
  options       : TReplaceFlags;
begin
  //The TReplaceFlags enumeration type gives the options for the StringReplace routine :
  //rfReplaceAll 	Replace all find occurences
  //rfIgnoreCase 	Find ignores case   

  // Try to replace all occurrences of a or A to THE
  before := 'This is a way to live A big life';

  // Set the options to change all occurences regardless of case
  options := [rfReplaceAll, rfIgnoreCase];

  // Now change 'a' or 'A' to 'THE' throughout
  after  := StringReplace(before, ' a ', ' THE ', options);

  // Show the before and after
  ShowMessage('Before = '+before); //This is a way to live A big life
  ShowMessage('After  = '+after); //This is THE way to live THE big life  
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  searchResult : TSearchRec;
begin
  //The TSearchRecord record type defines a data structure used to hold file search information for the FindFirst and FindNext routines.

  // Try to find regular files matching Unit1.d* in the current dir
  if FindFirst('Unit1.d*', faAnyFile, searchResult) = 0 then
  begin
    repeat
      ShowMessage('File name = '+searchResult.Name);
      ShowMessage('File size = '+IntToStr(searchResult.Size));
    until FindNext(searchResult) <> 0;

    // Must free up resources used by these successful finds
    FindClose(searchResult);
  end;

  {File name = Unit1.dcu
   File size = 4382
   File name = Uni1.dfm
   File size = 524
   File name = Uni1.ddp
   File size = 51}



  {Time 	= Last modified file date and time	
  Size 	= File size in bytes
  Attr 	= File attributes
  Name 	= File name


  Where Attr can have these values :

  faAnyFile 	: Any file
  faReadOnly 	: Read-only files
  faHidden 	: Hidden files
  faSysFile 	: System files
  faVolumeID 	: Volume ID files
  faDirectory 	: Directory files
  faArchive 	: Archive files }
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  switchPrefixes : TSysCharSet;

begin
  //TSysCharSet - The TSysCharSet type is used as a general type for setting special characters during Delphi string parsing functions. 
  //For example, the FindCmdLineSwitch can be configured to search for user defined command line 'switch' value prefix characters.
  
  // Before running this code, use the Run/parameters menu option
  // to set the following command line parameters : *def /abc
  ShowMessage(CmdLine);     // Show the execution command + parameters

  // How many parameters were passed?
  ShowMessage('There are '+IntToStr(ParamCount)+' parameters');

  // Scan for abc and def parameters using the default / and - values
  if FindCmdLineSwitch('abc')
  then ShowMessage('/abc found')
  else ShowMessage('/abc NOT found');

  if FindCmdLineSwitch('def')
  then ShowMessage('/def found')
  else ShowMessage('/def NOT found');

  // Rescan with * and / as the switch prefix characters
  switchPrefixes := ['*','/'];
  if FindCmdLineSwitch('abc', switchPrefixes, True)
  then ShowMessage('*abc or /abc found')
  else ShowMessage('*abc and /abc NOT found');

  if FindCmdLineSwitch('def', switchPrefixes, True)
  then ShowMessage('*def or /def found')
  else ShowMessage('*def and /def NOT found');

  {"C:\Program files\Borland\Delphi7\Projects\Project1.exe" *def /abc
   /abc found
   /def NOT found
   *abc or /abc found
   *def or /def found}

end;

procedure TForm1.Button8Click(Sender: TObject);
var
  amount : Double;
begin
  //CurrencyDecimals - The CurrencyDecimals variable provides a default number of decimal digits for the Format and related functions.

  //Example code : Change the default decimal digits from 2 to 4
  amount := 1234.567;

  // Display the amount using the default decimal digits (2)
  ShowMessage('Amount = '+Format('%m', [amount]));    //Amount = ?1,234.57

  // Redisplay the amount with 4 decimal digits
  CurrencyDecimals := 4;
  ShowMessage('Amount = '+Format('%m', [amount]));  //Amount = ?1,234.5670 
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  amount : Currency;

begin
  //The CurrencyString variable is used in currency display functions. It is used to prefix or suffix the currency amount.
  //For example, the UK default is ?, so 1.23 is displayed as ?1.23 by default.
  
  amount := 12;    // 12 pounds

  // Display with the default currency string
  ShowMessage('Amount = '+CurrToStrF(amount, ffCurrency, 0));  //Amount = ?12

  // Display with the currency shown as a word after the amount
  CurrencyString := 'Pounds';
  CurrencyFormat := 4;    // 4 means after with a space

  {The CurrencyFormat allowed values are :
    0 	= Before amount
    1 	= After amount
    2 	= Before amount with space
    3 	= After amount with space }
    
  ShowMessage('Amount = '+CurrToStrF(amount, ffCurrency, 0));  //Amount = 12 Pounds

end;

procedure TForm1.Button10Click(Sender: TObject);
var
  amount : Currency;
begin
  // DecimalSeparator - The DecimalSeparator variable is used in currency and floating point display functions. DecimalSeparator value is '.' by default, depending on the Windows locale.


  //Example code : Changing the decimal point character
  amount := 12.34;    // 12 pounds 34 pence

  // Display with the default decimal point character
  ShowMessage('Amount = '+FloatToStrF(amount, ffCurrency, 10, 2));   //Amount = ?12.34

  // Display with a new decimal point character
  DecimalSeparator := '|';
  ShowMessage('Amount = '+FloatToStrF(amount, ffCurrency, 10, 2));   //Amount = ?12|34

end;

procedure TForm1.Button11Click(Sender: TObject);
var
  i : Byte;

begin
  //Example code : Illustrate the 16 different negative formatting flavours


  // Display the amount using all the flavours of NegCurrFormat
  for i := 0 to 15 do
  begin
    NegCurrFormat := i;
    ShowMessage('Format '+IntToStr(i)+' = '+Format('%m', [-1.23]));
  end;

  {Format 0 = (?1.23)
   Format 1 = -?1.23
   Format 2 = ?-1.23
   Format 3 = ?1.23-
   Format 4 = (1.23?)
   Format 5 = -1.23?
   Format 6 = 1.23-?
   Format 7 = 1.23?-
   Format 8 = -1.23 ?
   Format 9 = -? 1.23
   Format 10 = 1.23 ?-
   Format 11 = ? 1.23-
   Format 12 = ? -1.23
   Format 13 = 1.23- ?
   Format 14 = (? 1.23)
   Format 15 = (1.23 ?)}

  {The NegCurrFormat variable defines how negative currency amounts are formatted by such functions as FloatToStr and CurrToStr.
 
    It is in effect an enumerated type, but with no names for the values. It is easiest to show their meanings by example, given below with an amount 1.23 and ? as the CurrencyString:

    ?0 	= (?1.23)
    ?1 	= -?1.23
    ?2 	= ?-1.23
    ?3 	= ?1.23-
    ?4 	= (1.23?)
    ?5 	= -1.23?
    ?6 	= 1.23-?
    ?7 	= 1.23?-
    ?8 	= -1.23 ?
    ?9 	= -? 1.23
    10 	= 1.23 ?-
    11 	= ? 1.23-
    12 	= ? -1.23
    13 	= 1.23- ?
    14 	= (? 1.23)
    15 	= (1.23 ?)   }
end;

procedure TForm1.Button12Click(Sender: TObject);
var
  float : single;
  int   : Integer;
  i     : Integer;

begin
   //random - The Random function generates random numbers. They can be floating point numbers in the range :

  //Example code : Generate sets of floating point and integer numbers

  // Get floating point random numbers in the range 0 <= Number < 1.0
  for i := 1 to 5 do
  begin
    float := Random;
    ShowMessage('float = '+FloatToStr(float));
  end;

  ShowMessage('');

  // Get an integer random number in the range 1..100
  for i := 1 to 5 do
  begin
    int := 1 + Random(100);    // The 100 value gives a range 0..99
    ShowMessage('int = '+IntToStr(int));
  end;

  {float = 2.3283064365387E-10
   float = 0.031379981256104
   float = 0.861048460006714
   float = 0.202580958604813
   float = 0.2729212641716
  
  
   int = 68
   int = 32
   int = 17
   int = 38
   int = 43}

end;

procedure TForm1.Button13Click(Sender: TObject);
var
  int   : Integer;
  i     : Integer;

begin
  //Randomize - The Randomize procedure is used in conjunction with the Random function. It repositions the random number generator
  //in its sequence of 232 pseudo random numbers. Randomize uses the time of day as the seed for this repositioning, so should provide
  //a reliable method of creating an unpredictable sequence of numbers, even if they are a part of a predetermined sequence.


  // If you run this program twice, only the first 5 values
  // will be guaranteed to be the same each time - randomize
  // repositions into a different part of the pseudo sequence
  // of random numbers.

  // Get an integer random number in the range 1..100
  ShowMessage('Fixed first 5 random numbers');
  for i := 1 to 5 do
  begin
    int := 1 + Random(100);    // The 100 value gives a range 0..99
    ShowMessage('int = '+IntToStr(int));
  end;

  // Now randomize to reposition
  Randomize;
  ShowMessage('');

  // Get an integer random number in the range 1..100
  ShowMessage('Random next 5 numbers');
  for i := 1 to 5 do
  begin
    int := 1 + Random(100);    // The 100 value gives a range 0..99
    ShowMessage('int = '+IntToStr(int));
  end;

  {Fixed first 5 random numbers
   int = 1
   int = 4
   int = 87
   int = 21
   int = 28
  
   Random next 5 numbers
   int = 35
   int = 74
   int = 45
   int = 50
   int = 31}

end;

procedure TForm1.Button14Click(Sender: TObject);
var
  i : Integer;
begin
  //Description The RandomRange (uses Math ) function generates a random Integer number within the range RangeFrom to RangeTo inclusively. *
  //This provides a more convenient version of the System unit Random function. Both use a pseudo random number sequence of 232 values.
  // Each time you run your program, the values generated will be the same, unless you reposition the generator to a different part
  //of the sequence using the Randomize or RandSeed functions.
  
  // Show 5 random numbers in the range 652 to 656
  for i := 1 to 5 do

    ShowMessage('Random number : '+IntToStr(RandomRange(652, 656)));

end;

end.
