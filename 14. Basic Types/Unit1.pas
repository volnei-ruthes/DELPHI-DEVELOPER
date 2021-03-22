unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ConvUtils ;

type
  TForm1 = class(TForm)
    Button1: TButton;
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

end.
