unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Dateutils;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    Label4: TLabel;
    Button3: TButton;
    Label5: TLabel;
    Button4: TButton;
    Label6: TLabel;
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
   date1, date2, date3, date4 : TDateTime;       // TDateTime variables in System.unit
begin
 //Obs. to be processed you need add SysUtil and Dateutils in USES.(start of day).
 date4 := Now;            // Set to the current day and time
 date2 := Date;           // Set to the start of the current day
 date1 := Yesterday;      // Set to the start of yesterday 
 date3 := Tomorrow;       // Set to the start of tomorrow
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   month : Integer;
begin
 for month := 1 to 12 do    // Display the short and long month names
 begin
   ShowMessage(ShortMonthNames[month]); //SHORT
   ShowMessage(LongMonthNames[month]);  //LONG
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
 day : Integer;
begin
 for day := 1 to 7 do    // Display the short and long day names
 begin
   ShowMessage(ShortDayNames[day]);
   ShowMessage(LongDayNames[day]);
 end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
   myDate : TDateTime;
   day, month, year    : string;
begin
   // Set up our TDateTime variable with a full date and time :  09/02/2000 at 05:06:07.008 (.008 milli-seconds)
   myDate := EncodeDateTime(2000, 2, 9, 5, 6, 7, 8);
 
   // Date only - numeric values with no leading zeroes (except year)  d/m/y = 9/2/00
   ShowMessage('d/m/y = '+ FormatDateTime('d/m/y', myDate));
   // Date only - numeric values with leading zeroes -  dd/mm/yy = 09/02/00
   ShowMessage('dd/mm/yy = '+ FormatDateTime('dd/mm/yy', myDate));
   // Use short names for the day, month, and add freeform text ('of') ddd d of mmm yyyy = Wed 9 of Feb 2000
   ShowMessage('ddd d of mmm yyyy = '+ FormatDateTime('ddd d of mmm yyyy', myDate));
   // Use long names for the day and month - dddd d of mmmm yyyy = Wednesday 9 of February 2000
   ShowMessage('dddd d of mmmm yyyy = '+ FormatDateTime('dddd d of mmmm yyyy', myDate));
   // Use the ShortDateFormat settings only - ddddd = 09/02/2000
   ShowMessage('ddddd = '+ FormatDateTime('ddddd', myDate));
   // Use the LongDateFormat settings only - dddddd = 09 February 2000
   ShowMessage('dddddd = '+ FormatDateTime('dddddd', myDate));
   ShowMessage('');
   // Time only - numeric values with no leading zeroes - h:n:s.z = 5:6:7.008
   ShowMessage('h:n:s.z = '+ FormatDateTime('h:n:s.z', myDate));
   // Time only - numeric values with leading zeroes - hh:nn:ss.zzz = 05:06:07.008
   ShowMessage('hh:nn:ss.zzz = '+ FormatDateTime('hh:nn:ss.zzz', myDate));
   // Use the ShortTimeFormat settings only -  t = 05:06
   ShowMessage('t = '+FormatDateTime('t', myDate));
   // Use the LongTimeFormat settings only - tt = 05:06:07
   ShowMessage('tt = '+FormatDateTime('tt', myDate));
   // Use the ShortDateFormat + LongTimeFormat settings -  c = 09/02/2000 05:06:07
   ShowMessage('c = '+FormatDateTime('c', myDate));

   //Formatting control variables

   //DateSeparator  - The character used to separate display date fields - value is '/' by default
   myDate := EndOfAMonth(2000, 2); // 29th Feb 2000 at 23:59:59.999
   ShowMessage('Date     = '+DateTimeToStr(myDate)); // Date     = 29/02/2000 23:59:59
   DateSeparator := '_';           // Override the / date separator
   ShowMessage('Date now = '+DateTimeToStr(myDate));  //Date now = 29_02_2000 23:59:59

   //TimeSeparator - The character used to separate display time fields
   myDate := EndOfAMonth(2000, 2); // 29th Feb 2000 at 23:59:59.999
   LongTimeFormat := 'hh:mm:ss.zzz';   // Show milli-seconds
   ShowMessage('Date     = '+DateTimeToStr(myDate));   //Date     = 29/02/2000 23:59:59.999
   TimeSeparator := '_';           // Override the : time separator
   ShowMessage('Date now = '+DateTimeToStr(myDate));    //Date now = 29/02/2000 23_59_59.999

   //ShortDateFormat - Compact version of the date to string format
   myDate := StrToDate('29/02/2000');
  // Display using the default ShortDateFormat
  ShowMessage('29/02/2000 using default = '+DateToStr(myDate)); //29/02/2000 using default = 29/02/2000
  // Change the display formatting
  ShortDateFormat := 'dddd dd mmmm yyyy';
  ShowMessage('29/02/2000 using dddd dd mmmm yyyy = '+DateToStr(myDate)); //29/02/2000 using dddd dd mmmm yyyy = Tuesday 29 February 2000
  { y 	= Year last 2 digits
    yy 	= Year last 2 digits
    yyyy 	= Year as 4 digits
    m 	= Month number no-leading 0
    mm 	= Month number as 2 digits
    mmm 	= Month using ShortDayNames (Jan)
    mmmm 	= Month using LongDayNames  (January)
    d 	= Day number no-leading 0
    dd 	= Day number as 2 digits
    ddd 	= Day using ShortDayNames (Sun)
    dddd 	= Day using LongDayNames  (Sunday)}

  //LongDateFormat - Long version of the date to string format
  myDate := StrToDate('29/02/2000');
  // Display using the default LongDateFormat
  DateTimeToString(formattedDate, 'dddddd', myDate);
  ShowMessage('29/02/2000 using  default = '+formattedDate);  
  // Change the display formatting
  LongDateFormat := 'dddd dd of mmmm yyyy';
  DateTimeToString(formattedDate, 'dddddd', myDate); // 29/02/2000 using  default = 29 February 2000
  ShowMessage('29/02/2000 using override = '+formattedDate); //29/02/2000 using override = Tuesday 29 of February 2000
  { y 	= Year last 2 digits
    yy 	= Year last 2 digits
    yyyy 	= Year as 4 digits
    m 	= Month number no-leading 0
    mm 	= Month number as 2 digits
    mmm 	= Month using ShortDayNames (Jan)
    mmmm 	= Month using LongDayNames (January)
    d 	= Day number no-leading 0
    dd 	= Day number as 2 digits
    ddd 	= Day using ShortDayNames (Sun)
    dddd 	= Day using LongDayNames  (Sunday)}

  //ShortTimeFormat - Short version of the time to string format
  myDate := StrToTime('15:06:23.456');
  // Display using the default ShortTimeFormat
  DateTimeToString(formattedDate, 't', myDate);
  ShowMessage('15:06:23.456 using  default = '+formattedDate);  //15:06:23.456 using  default = 15:06
  // Change the display formatting
  ShortTimeFormat := 'hh nn ss';
  DateTimeToString(formattedDate, 't', myDate);
  ShowMessage('15:06:23.456 using override = '+formattedDate);  //15:06:23.456 using override = 15 06 23
  { h 	= Hour with no leading 0's
    hh 	= Hour as 2 digits
    n 	= Minute with no leading 0's
    nn 	= Minute as 2 digits
    s 	= Seconds with no leading 0's
    ss 	= Seconds as 2 digits
    z 	= Milli-seconds with no leading 0's
    zzz 	= Milli-seconds as 3 digits}

  //LongTimeFormat - Long version of the time to string format
  myDate := StrToTime('15:06:23.456');
  // Display using the default LongTimeFormat
  DateTimeToString(formattedDate, 'tt', myDate);
  ShowMessage('15:06:23.456 using  default = '+formattedDate);  //15:06:23.456 using  default = 15:06:23
  // Change the display formatting
  LongTimeFormat := 'hh nn ss (zzz)';
  DateTimeToString(formattedDate, 'tt', myDate);
  ShowMessage('15:06:23.456 using override = '+formattedDate);   //15:06:23.456 using override = 15 06 23 (456)

  //ShortDayNames - The ShortDayNames variable provides an array of short string names of the days of the week.
  myDate := EncodeDate(2002, 12, 31);
  day := ShortDayNames[DayOfWeek(myDate)]; //O delphi ja tem na Sysutil um array dos dias da semana com nome curto.
  ShowMessage('Christmas day 2002 is on a '+day); //Christmas day 2002 is on a Tue

  //ShortMonthNames  - The ShortMonthNames variable provides an array of short string names of the months of the year.
  month  := ShortMonthNames[12]; //o delphi ja tem na sysutil um array dos meses do ano com nome curto.
  ShowMessage('Month 12 = '+month); //Month 12 = Dec

  //LongDayNames - The LongDayNames variable provides an array of full string names of the days of the week.
  myDate := EncodeDate(2002, 12, 31);
  day := LongDayNames[DayOfWeek(myDate)]; //delphi ja tem na sysutils um array com nome dos dias completo. starting 1 = Sunday
  ShowMessage('Christmas day 2002 is on a '+day); //Christmas day 2002 is on a Tuesday

  //LongMonthNames - The LongMonthNames variable provides an array of full string names of the months of the year.
  month  := LongMonthNames[12]; //o delphi ja tem na sysutil um array com nome dos meses completo. starting 1 = January
  ShowMessage('Month 12 = '+month);  //Month 12 = December








end;

procedure TForm1.Button5Click(Sender: TObject);
var
  myDate : TDateTime;
begin
  //EXEMPLOS DE CALCULOS DATE AND TIMES.

  //EncodeDateTime - The EncodeDateTime function generates a TDateTime return value from the passed Year, Month, Day, Hour, Min, Sec and MSec (millisecond) values.
  {The permitted parameter values are :  (If you exceed these values, an EConvertError is raised.)
      Year 	= 0..9999
      Month 	= 1..12
      Day 	= 1..31 (depending on month/year)
      Hour 	= 0..23
      Min 	= 0..59
      Sec 	= 0..59
      MSec 	= 0..999}
  myDate := EncodeDateTime(2000, 02, 29, 12, 34, 56, 789);
  LongTimeFormat := 'hh:mm:ss.z';  // Ensure that MSecs are shown
  ShowMessage('Date set to '+DateToStr(myDate)); //Date set to 29/02/2000
  ShowMessage('Time set to '+TimeToStr(myDate)); //Time set to 12:34:56.789

  //EncodeDate The EncodeDate function generates a TDateTime return value from the passed Year, Month and Day values.
  {he permitted parameter values are : (If you exceed these values, an EConvertError is raised.)
      Year 	= 2000..9999
      Month 	= 1..12
      Day 	= 1..31 (depending on month/year)}
  // Set my date variable using the EncodeDate function
  myDate := EncodeDate(2000, 02, 29);
  LongTimeFormat := 'hh:mm:ss.zzz';  // Ensure that MSecs are shown
  ShowMessage('Date set to '+DateToStr(myDate)); //Date set to 29/02/2000
  ShowMessage('Time set to '+TimeToStr(myDate)); //Time set to 00:00:00.000

  // EncodeTime - The EncodeTime function generates a TDateTime return value from the passed Hour, Min, Sec and MSec (millisecond) values.
  {The permitted parameter values are :  (If you exceed these values, an EConvertError is raised.)
      Hour 	= 0..23
      Min 	= 0..59
      Sec 	= 0..59
      MSec 	= 0..999 }
  LongTimeFormat := 'hh:mm:ss.z';  // Ensure that MSecs are shown
  ShowMessage('Date set to '+DateToStr(myDate)); //Date set to 30/12/1899
  ShowMessage('Time set to '+TimeToStr(myDate)); //Time set to 12:34:56.789

  // DecodeDateTime - The DecodeDateTime procedure extracts year, month, day, hour, minute, second and milli-second values from a given
  // SourceDate TDateTime type value. It stores the values in the output variables : Year, Month, Day, Hour, Min, Sec and MSec.
  {var
      myDate : TDateTime;
      myYear, myMonth, myDay : Word;
      myHour, myMin, mySec, myMilli : Word;

    begin
      // Set up the myDate variable to have a December 2000 value
      myDate := StrToDateTime('29/12/2000 12:45:12.34');

      // Now add a month to this value
      myDate := IncMonth(myDate);

      // And let us see what we get
      DecodeDateTime(myDate, myYear, myMonth, myDay,
                     myHour, myMin, mySec, myMilli);
      ShowMessage('myDate now = '+DateToStr(myDate)); //myDate now = 29/01/2001
      ShowMessage('myHour     = '+IntToStr(myHour));  //myHour     = 12
      ShowMessage('myMin      = '+IntToStr(myMin));   //myMin      = 45
      ShowMessage('mySec      = '+IntToStr(mySec));   //mySec      = 12
      ShowMessage('myMilli    = '+IntToStr(myMilli)); //myMilli    = 34
      ShowMessage('myDay      = '+IntToStr(myDay));   //myDay      = 29
      ShowMessage('myMonth    = '+IntToStr(myMonth)); //myMonth    = 1
      ShowMessage('myYear     = '+IntToStr(myYear));  //myYear     = 2001
    end;}

  //DecodeDate The DecodeDate procedure extracts year, month and day values from a given SourceDate TDateTime type value.
  //It stores the values in the output variables : Year, Month and Day.
  { var
      myDate : TDateTime;
      myYear, myMonth, myDay : Word;
    begin
      // Set up the myDate variable to have a December 2000 value
      myDate := StrToDate('29/12/2000');

      // Now add a month to this value
      myDate := IncMonth(myDate);

      // And let us see what we get
      DecodeDate(myDate, myYear, myMonth, myDay);
      ShowMessage('myDate now = '+DateToStr(myDate));   //myDate now = 29/01/2001
      ShowMessage('myDay      = '+IntToStr(myDay));     //myDay      = 29
      ShowMessage('myMonth    = '+IntToStr(myMonth));   //myMonth    = 1
      ShowMessage('myYear     = '+IntToStr(myYear));    //myYear     = 2001
    end;}

    //DecodeTime The DecodeTime procedure extracts hour, minute, second and milli-second values from a given SourceDateTime TDateTime type value.
    //It stores the values in the output variables : Hour, Min, Sec and MSec.
    {var
        myDate : TDateTime;
        myHour, myMin, mySec, myMilli : Word;

      begin
        // Set up the myDate variable to have a December 2000 value
        myDate := StrToDateTime('29/12/2000 12:45:12.34');

        // Now add 5 minutes to this value
        myDate := IncMinute(myDate, 5);

        // And let us see what we get
        DecodeTime(myDate, myHour, myMin, mySec, myMilli);
        ShowMessage('Time now = '+TimeToStr(myDate));      // Time now = 12:50:12
        ShowMessage('Hour     = '+IntToStr(myHour));       //Hour     = 12
        ShowMessage('Minute   = '+IntToStr(myMin));        //Minute   = 50
        ShowMessage('Second   = '+IntToStr(mySec));        //Second   = 12
        ShowMessage('MilliSec = '+IntToStr(myMilli));      //MilliSec = 34
      end;}

  //RecodeDate - The RecodeDate function allows the Year, Month and Day values of a TDateTime variable to be changed without affecting the time.
  // Set the date to 29/10/2002 at 12:34:56
  myDate := EncodeDateTime(2002, 10, 29, 12, 34, 56, 0);
  ShowMessage('The starting date/time = '+DateTimeToStr(myDate)); // The starting date/time = 29/10/2002 12:34:56
  // Now change the date portion without touching the time
  myDate := RecodeDate(myDate, 1957, 2, 18);
  ShowMessage('The new      date/time = '+DateTimeToStr(myDate)); // The new date/time      = 18/02/1957 12:34:56

  //RecodeTime The RecodeTime function allows the Hour, Min, Sec and MSec (milli-second) values of a TDateTime variable to be changed without affecting the date.
  // Set the date to 29/10/2002 at 12:34:56
  myDate := EncodeDateTime(2002, 10, 29, 12, 34, 56, 0);
  ShowMessage('The starting date/time = '+DateTimeToStr(myDate)); //The starting date/time = 29/10/2002 12:34:56
  // Now change the time portion without touching the date
  myDate := RecodeTime(myDate, 7, 35, 22, 0);
  ShowMessage('The new      date/time = '+DateTimeToStr(myDate)); // The new date/time = 29/10/2002 07:35:22

  //ReplaceDate - The ReplaceDate function updates the date part of a TDateTime variable DateTimeVar with the date part of another TDateTime value NewDateValue without affecting the time.
  {var
      myDateTime, newDate : TDateTime; 
    begin
      // Set the date to 29/10/2002 at 12:34:56
      myDateTime := EncodeDateTime(2002, 10, 29, 12, 34, 56, 0);
      ShowMessage('The starting date/time = '+DateTimeToStr(myDateTime));  //The starting date/time = 29/10/2002 12:34:56
      // Now change the date portion without touching the time
      newDate := EncodeDate(1957, 02, 18);
      ReplaceDate(myDateTime, newDate);
      ShowMessage('The new date/time = '+DateTimeToStr(myDateTime));      //The new date/time      = 18/02/1957 12:34:56
    end;}
  //ReplaceTime - The ReplaceTime function updates the time part of a TDateTime variable DateTimeVar with the time part of another TDateTime value NewTimeValue without affecting the date.
  { // Set the date to 29/10/2002 at 12:34:56
  myDateTime := EncodeDateTime(2002, 10, 29, 12, 34, 56, 0);
  ShowMessage('The starting date/time = '+DateTimeToStr(myDateTime)); //The starting date/time = 29/10/2002 12:34:56
  // Now change the time portion without touching the date
  newTime := EncodeTime(9, 45, 52, 0);
  ReplaceTime(myDateTime, newTime);
  ShowMessage('The new date/time = '+DateTimeToStr(myDateTime));}  //The new date/time      = 29/10/2002 09:45:52

  myDate := EncodeDate(2002, 12, 31); //Seta uma data qualquer para exemplo.

  //DayOfTheMonth. The DayOfTheMonth function returns an index number for the day of the month. Depending on the year and month, the value is in the range 1..31
  ShowMessage('The day of the month = '+IntToStr(DayOfTheMonth(myDate))); // retorno: The day of the month = 31
  //DayOfTheYear Show the day of the year for a TDateTime variable - return 20/10/2002 day of the year = 302
  ShowMessage('20/10/2002 day of year  = '+ IntToStr(DayOfTheYear(myDate)));
  //Show the month of the year for a TDateTime variable - The month of the year = 10
  ShowMessage('The month of the year  = '+ IntToStr(MonthOfTheYear(myDate)));
  //DaysInAMonth Gives the number of days in a month, ex: // How many days in February 2000 ?
  ShowMessage('Days in February 2000 = '+IntToStr(DaysInAMonth(2000, 2))); //retorno: Days in February 2000 = 29
  //DaysInAYear Function	Gives the number of days in a year -  // How many days in the leap year 2000?
  ShowMessage('Days in 2000 = '+ IntToStr(DaysInAYear(2000))); // return0: Days in 2000 = 366
  //MinsPerDay - Constant	Gives the number of minutes in a day  -  returno Number of minutes in a week = 10080
   ShowMessage('Number of minutes in a week = '+IntToStr(MinsPerDay*7));
  //SecsPerDay - Constant	Gives the number of seconds in a day retorno Number of seconds in a week = 604800
  ShowMessage('Number of seconds in a week = '+IntToStr(SecsPerDay*7));
  // MonthDays - Gives the number of days in a month - Days in February 2000 = 29
  ///A fun??o IsLeapYear retorna true se um determinado valor do calend?rio for um ano bissexto.
  ///if IsLeapYear(2000) then ShowMessage ('2000 foi um ano bissexto')
  ShowMessage('Days in February 2000 = '+ IntToStr(MonthDays[IsLeapYear(2000)][2]));
  //DaySpan - Find the days difference between two date+time values.
  ///-The DaySpan function subtracts the FromDate from the ToDate, returning the fractional days difference.
  ///For example, a difference of 2 days and 6 hours would give a value of 2.25
  { Example code : Find the days difference between two date+time values.
      var
        fromdate, toDate : TDateTime;
      begin
        // Set up our date variables
        fromDate := EncodeDateTime(2000, 01, 01, 0, 0, 0, 0);
        toDate   := EncodeDateTime(2000, 01, 02, 12, 0, 0, 0);

        // Display these dates and the days between them
        ShowMessage('From date = '+DateTimeToStr(fromDate));
        ShowMessage('To   date = '+DateTimeToStr(toDate));
        ShowMessage('Fractional days difference = '+ FloatToStr(DaySpan(toDate, fromDate))+' days');
      end;
                RESULT: Show full unit code
                   From date = 01/01/2000
                   To   date = 02/01/2000 12:00:00
                   Fractional days difference = 1.5 days  }

  //IncDay - The IncDay function returns a TDateTime value that is NumberOfDays greater than the passed StartDateTime value.
  //There is no DecDay function.Instead, use IncDay with a negative increment.
  // Set up our date just before the end of the year 2000
  myDate := EncodeDate(2000, 12, 30);
  ShowMessage('myDate = '+DateToStr(myDate));   // myDate = 30/12/2000
  // Add 10 days to this date
  myDate := IncDay(myDate, 10);
  ShowMessage('myDate + 10 days = '+DateToStr(myDate)); //myDate + 10 days = 09/01/2001
  // Subtract 12 days from this date
  myDate := IncDay(myDate, -12);
  ShowMessage('myDate - 12 days = '+DateToStr(myDate)); //myDate - 12 days = 29/12/2000

  //IncMinute - The IncMinute function returns a TDateTime value that is NumberOfMinutes greater than the passed StartDateTime value.
  //There is no DecMinute function. Instead, use IncMinute with a negative increment.
  // Set up our date just before the end of the year 2000
  myDate := EncodeDateTime(2000, 12, 31, 23, 0, 0, 0);
  ShowMessage('myDate = '+DateTimeToStr(myDate));  //myDate = 31/12/2000 23:00:00
  // Add 100 minutes to this date
  myDate := IncMinute(myDate, 100);
  ShowMessage('myDate + 100 minutes = '+DateTimeToStr(myDate)); //myDate + 100 minutes = 01/01/2001 00:40:00
  // Subtract 40 minutes from this date
  myDate := IncMinute(myDate, -40);
  ShowMessage('myDate -  40 minutes = '+DateTimeToStr(myDate));  //myDate -  40 minutes = 01/01/2001

  //IncMillisecond The IncMillisecond function returns a TDateTime value that is NumberOfMilliSeconds greater than the passed StartDateTime value.
  //There is no DecMillisecond function. Instead, use IncMillisecond with a negative increment.
  // Set up our date to the start of 2006
  myDate := EncodeDateTime(2006, 1, 1, 0, 0, 0, 0);
  ShowMessage('myDate = '+DateTimeToStr(myDate));       //myDate = 01/01/2006
  // Add 5000 milliseconds to this date
  myDate := IncMillisecond(myDate, 5000);
  ShowMessage('myDate + 5000 milliseconds = '+DateTimeToStr(myDate));  //myDate = 01/01/2006 00:00:05
  // Subtract 2000 milliseconds from this date
  myDate := IncMillisecond(myDate, -2000);
  ShowMessage('myDate -  2000 milliseconds = '+DateTimeToStr(myDate)); //myDate = 01/01/2006 00:00:03

  //IncMonth - The IncMonth function returns a TDateTime value that is NumberOfMonths greater than the passed StartDate value.
  //There is no DecMonth function. Instead, use IncMonth with a negative increment.
  myDate := StrToDate('31/01/2000');   // End of Jan in a leap year
  ShowMessage('myDate = '+DateToStr(myDate)); //myDate = 31/01/2000
  // Increment by 1 (default)
  // 31st Jan 2000 ==> 31st Feb 2000 (illegal) ==> 29th Feb 2000
  myDate := IncMonth(myDate);
  ShowMessage('myDate + 1 month = '+DateToStr(myDate));  //myDate + 1 month = 29/02/2000
  // Increment by 12 months
  // 29th Feb 2000 ==> 29th Feb 2000 (illegal) ==> 28th Feb 2001
  myDate := IncMonth(myDate, 12);      // Increment by 12 months
  ShowMessage('myDate + 12 months = '+DateToStr(myDate)); //myDate + 12 months = 28/02/2001

  //IncYear Increments a TDateTime variable by a number of years. There is no DecYear function. Instead, use IncYear with a negative increment.
  // Set up our date to a leap year special day
  myDate := EncodeDate(2000, 02, 29);
  ShowMessage('myDate = '+DateToStr(myDate)); // myDate = 29/02/2000
  // Add 2 years to this date
  myDate := IncYear(myDate, 2);
  ShowMessage('myDate + 2 years = '+DateToStr(myDate));  //myDate + 2 years = 28/02/2002 
  // Subtract 2 years from this date
  myDate := IncYear(myDate, -2);
  ShowMessage('myDate - 2 years = '+DateToStr(myDate));   //myDate - 2 years = 28/02/2000

  //EndOfAMonth set to the very end of a month
   myDate := EndOfAMonth(2000, 2);
  // Ensure that milli-seconds are shown
  LongTimeFormat := 'hh:mm:ss.zzz';
  ShowMessage('End of February 2000 = '+DateTimeToStr(myDate)); //End of February 2000 = 29/02/2000 23:59:59.999

  //EndOfADay set to the very end of a day
  myDate := EndOfADay(1999, 365); //function EndOfADay ( const Year, DayOfYear : Word ) : TDateTime;
  // Ensure that milli-seconds are shown
  LongTimeFormat := 'hh:mm:ss.zzz';
  ShowMessage('End of 1999 using short syntax = '+DateTimeToStr(myDate));
  myDate := EndOfADay(1999, 12, 31);//unction EndOfADay ( const Year, Month, Day : Word ) : TDateTime;
  // Ensure that milli-seconds are shown
  LongTimeFormat := 'hh:mm:ss.zzz';
  ShowMessage('End of 1999 using  long syntax = '+DateTimeToStr(myDate));


end;

end.
