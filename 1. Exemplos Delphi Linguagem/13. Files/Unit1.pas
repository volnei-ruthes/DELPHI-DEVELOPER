unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Button15: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
    procedure Button15Click(Sender: TObject);
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
var
  fullFileName : string;
begin
  //ExtractFileDir Extracts the dir part of a full file name
  // Set up a full file name with drive and path
  fullFileName := 'C:\Program Files\Borland\Delphi7\Projects\Unit1.dcu';

  // Show the component parts of this full name
  ShowMessage('Drive = '+ExtractFileDrive (fullFileName)); //Drive = C:
  ShowMessage('Dir   = '+ExtractFileDir   (fullFileName)); //Dir   = C:\Program Files\Borland\Delphi7\Projects
  ShowMessage('Path  = '+ExtractFilePath  (fullFileName)); //Path  = C:\Program Files\Borland\Delphi7\Projects\
  ShowMessage('Name  = '+ExtractFileName  (fullFileName)); //Name  = Unit1.dcu
  ShowMessage('Ext   = '+ExtractFileExt   (fullFileName)); //Ext   = .dcu
end;

procedure TForm1.Button2Click(Sender: TObject);
 var
  selectedFile   : string;
  drive          : char;
  path, fileName : string;
begin
  //ProcessPath in FileCtrl unit - The ProcessPath procedure splits a full file name FullName into its constituent Drive, Dir and FileName parts.
  //Example code : Ask the user for a file name, and show the constituent parts

  // Ask the user to select a file
  if PromptForFileName(selectedFile) then
  begin
    // Display this full file/path value
    ShowMessage('Selected file = '+selectedFile);
    { Example: The user selects C:\Files\data.txt and hits OK }
    // Split this full file/path value into its constituent parts
    ProcessPath(selectedFile, drive, path, fileName);
    ShowMessage('drive = '+drive); //drive = C
    ShowMessage('path = '+path);  //path = \Files
    ShowMessage('fileName = '+fileName); //filename = data.txt
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  //FILE DATAS

  // FileAge -  The FileAge function returns the last modified date and time of a file FileName.
  //  Get the last modified date/time of a file without opening it. If the file date could not be found (for example, the FileName was invalid), then -1 is returned.
  {Example code : Get the last modified date of the current Unit form file (Use func FileDateToDateTime to modify this las date)
    var
      fileName   : string;
      fileDate   : Integer;

    begin
      // Try to open the Unit1.DCU file for the current project
      fileName := 'Unit1.DCU';
      fileDate := FileAge(fileName);

      // Did we get the file age OK?
      if fileDate > -1 then
        ShowMessage(fileName+' last modified date = '+DateToStr(FileDateToDateTime(fileDate)));} //Unit1.DCU last modified date = 10/11/2002


  //FileGetAttr - Gets the attributes of a file.  function FileGetAttr ( const FileName : string; ) : Integer;
  {Description The FileGetAttr function returns attributes of the specified FileName.

    The returned Integer value will be a bitwise combination of the following independent attributes :

    faReadOnly 	: Read-only files
    faHidden 	: Hidden files
    faSysFile 	: System files
    faVolumeID 	: Volume ID files
    faDirectory 	: Directory files
    faArchive 	: Archive files
    faSymLink 	: Symbolic link

    Example code : Create a text file and display its attributes
var
  fileName : string;
  myFile   : TextFile;

  attrs    : Integer;

begin
  // Try to open a text file for writing to
  fileName := 'Test.txt';
  AssignFile(myFile, fileName);
  ReWrite(myFile);

  // Write to the file
  Write(myFile, 'Hello World');

  // Close the file
  CloseFile(myFile);

  // Get the file attributes
  attrs := FileGetAttr(fileName);

  // Display these attributes
  if attrs and faReadOnly > 0
  then ShowMessage('File is read only')
  else ShowMessage('File is not read only');

  if attrs and faHidden > 0
  then ShowMessage('File is hidden')
  else ShowMessage('File is not hidden');

  if attrs and faSysFile > 0
  then ShowMessage('File is a system file')
  else ShowMessage('File is not a system file');

  if attrs and faVolumeID > 0
  then ShowMessage('File is a volume ID')
  else ShowMessage('File is not a volume ID');

  if attrs and faDirectory > 0
  then ShowMessage('File is a directory')
  else ShowMessage('File is not a directory');

  if attrs and faArchive > 0
  then ShowMessage('File is archived')
  else ShowMessage('File is not archived');

  if attrs and faSymLink > 0
  then ShowMessage('File is a symbolic link')
  else ShowMessage('File is not a symbolic link');
end;

  show:
  File is not read only
   File is not hidden
   File is not a system file
   File is not a Volume ID
   File is not a directory
   File is archived
   File is not a symbolic link

    }







end;

procedure TForm1.Button5Click(Sender: TObject);
var
  myWord, myWord1, myWord2, myWord3 : Word;
  myFile : File of Word;
begin
  //FileSize Function	Gives the size in records of an open file
  //The FileSize function gives the size in records of an open file. Before this function can be used, the file must be assigned
  //a handle by using AssignFile and opened using Append, Reset or ReWrite routines.

  // Try to open the Test.cus binary file in write only mode
  AssignFile(myFile, 'Test.cus');
  ReWrite(myFile);

  // Before writing to the file, show the file size
  ShowMessage('File size = '+IntToStr(FileSize(myFile))); //File size = 0

  // Write a few lines of Word data to the file
  myWord1 := 12;
  myWord2 := 456;
  myWord3 := 7895;
  Write(myFile, myWord1, myWord2, myWord3);

  // Before closing the file, show the new file size
  ShowMessage('File size now = '+IntToStr(FileSize(myFile))); //File size now = 3

  // Close the file
  CloseFile(myFile);

end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i     : Integer;
  space : Int64;

begin
  //DiskFree - Function	Gives the number of free bytes on a specified drive - function DiskFree ( Drive : Byte ) : Int64;
  // Display the free space on drives B, C, D, E, F, where present
  {Description
    The DiskFree function gives the amount of free space on Drive.

    If the drive is invalid, or does not contain media, -1 is returned

    If the drive is read-only, 0 is returned.

    The Drive is designated as follows:

    1 	= A drive
    2 	= B drive
    3 	= C drive
    ...
    }
  for i := 2 to 6 do
  begin
    space := DiskFree(i);

    if space >= 0
    then ShowMessage(Chr(i+64)+' Drive free space = '+
                     FloatToStrF(space, ffNumber, 20, 0))
    else ShowMessage(Chr(i+64)+' Drive not present');
  end;

  //DiskSize - Function	Gives the size in bytes of a specified drive - function DiskSize ( Drive : Byte ) : Int64;
  {Description
    The DiskFree function gives the amount of free space on Drive.

    If the drive is invalid, or does not contain media, -1 is returned

    If the drive is read-only, 0 is returned.

    The Drive is designated as follows:

    1 	= A drive
    2 	= B drive
    3 	= C drive
    ...
    }
   
    // Display the free space on drives B, C, D, E, F, where present
    for i := 2 to 6 do
    begin
      space := DiskSize(i);

      if space >= 0
      then ShowMessage(Chr(i+64)+' Drive size = '+
                       FloatToStrF(space, ffNumber, 20, 0))
      else ShowMessage(Chr(i+64)+' Drive not present');
    end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var
  error : Integer;
begin
 //IOResult Function	Holds the return code of the last I/O operation. function IOResult : Integer;
 //Description The IOResult function retrieves the result of the last I/O (file input/output) operation.
 //This number is zero if the operation succeeded, or a positive number if it failed. Use IOResult when you have disabled the default
 //Delphi IO error trapping. When $IOChecks is On, Delphi raises exceptions for the errors. When Off, Delphi does not raise exceptions,
 //requiring the code to inspect IOResult.

  // Try to create a new subdirectory in the current directory
  // Switch off I/O error checking
  {$IOChecks off}
  MkDir('TempDirectory');

  // Did the directory get created OK?
  error := IOResult;
  if error = 0
  then ShowMessage('Directory created OK')    //Directory created OK
  else ShowMessageFmt('Directory creation failed with error %d',[error]);

  // Try to create the directory again - this will fail!
  MkDir('TempDirectory');
  error := IOResult;  // Save the return code
  if error = 0
  then ShowMessage('Directory created OK again')
  else ShowMessageFmt('Repeat creation failed with error %d',[error]); //Repeat creation failed with error 183

  // Delete the directory to tidy up
  RmDir('TempDirectory');

  // Switch IO checking back on
  {$IOChecks on}
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  selectedFile   : string;
begin
  // Ask the user to select a file
  if PromptForFileName(selectedFile,
                       'Text files (*.txt)|*.txt',
                       '',
                       'Select your project file',
                       'C:\',
                       False)  // Means not a Save dialog
  then
    // Display this full file/path value
    ShowMessage('Selected file = '+selectedFile)
  else
    ShowMessage('Cancel pressed');

  //PromptForFileName Shows a dialog allowing the user to select a file
  //function PromptForFileName ( var FileName : string;
     { const Filter : string; const DefaultExt : string;  const Title : string; const InitialDir : string;
       SaveDialog : Boolean = False } // ) : Boolean;
  {Description
  The PromptForFileName function presents a dialog to the user allowing navigation to, and selection of a file.
  If the user presses OK the FileName variable is updated with the full drive/path/filename value for the selected file,
  and the return value is True. If the user presses Cancel, no updates are done, and the return value is False.
  The remaining parameters are all optional (although parameters used on the right mandate use of the preceding parameters) :

  Filter
  Used to limit the types of file displayed. The format is as follows :'Description|filter{|...}//'
  //For example, to show only .txt and .pas files : Text files (*.txt)|*.txt|Delphi files (*.pas)|*.pas

  //DefaultExt - Used to define an extension to add to a new file name (if SaveDialog is True).
  //Title - Used to give a title to the dialog.
  //InitialDir - Positions the dialog at a given directory. For example : 'C:Program Files'
  //SaveDialog - Determines whether a new file can be selected for saving.}
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  value : string;
begin
  //InputBox Function	Display a dialog that asks for user text input, with default - function InputBox ( const Caption, Prompt, Default : string ) : string;
  // Keep asking the user for their town
  repeat
    value := InputBox('Test program', 'Please type your town', 'Cardiff');
  until value <> '';

  // Show their name
  ShowMessage('Your town is '+value);
end;

procedure TForm1.Button10Click(Sender: TObject);
var
  value : string;
begin
  // Keep asking the user for their name
  repeat
    if not InputQuery('Test program', 'Please type your name', value)
    then ShowMessage('User cancelled the dialog');
  until value <> '';

  // Show their name
  ShowMessage('Hello '+value);

end;

procedure TForm1.Button11Click(Sender: TObject);
var
  text : string;
begin
  // Just 1 data item
  ShowMessageFmt('%s', ['Hello']);

  // A mix of literal text and a data item
  ShowMessageFmt('String = %s', ['Hello']);
  ShowMessage('');

  // Examples of each of the data types using %+simbol
  ShowMessageFmt('Decimal          = %d', [-123]);
  ShowMessageFmt('Exponent         = %e', [12345.678]);
  ShowMessageFmt('Fixed            = %f', [12345.678]);
  ShowMessageFmt('General          = %g', [12345.678]);
  ShowMessageFmt('Number           = %n', [12345.678]);
  ShowMessageFmt('Money            = %m', [12345.678]);
  ShowMessageFmt('Pointer          = %p', [addr(text)]);
  ShowMessageFmt('String           = %s', ['Hello']);
  ShowMessageFmt('Unsigned decimal = %u', [123]);
  ShowMessageFmt('Hexadecimal      = %x', [140]);

  {In simple terms, each data formatting substring starts with a % and ends with a data type indicator :
    d 	= Decimal (integer)
    e 	= Scientific
    f 	= Fixed
    g 	= General
    m 	= Money
    n 	= Number (floating)
    p 	= Pointer
    s 	= String
    u 	= Unsigned decimal
    x 	= Hexadecimal     }

end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  // Show a simple message at the default coordinates
  ShowMessage('Hello World');

  // Show a simple message at screen position 100, 200
  ShowMessagePos('Hello World', 100, 200);

  {The ShowMessagePos procedure displays a string of Text in a simple dialog with an OK button at the given XPos, YPos screen coordinates.}
end;

procedure TForm1.Button13Click(Sender: TObject);
var
  openDialog : TOpenDialog;    // Open dialog variable
begin
  // Displays a file selection dialog


  //Example code : Illustrating single file selection

  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);

  // Set up the starting directory to be the current one
  openDialog.InitialDir := GetCurrentDir;

  // Only allow existing files to be selected
  openDialog.Options := [ofFileMustExist];

  // Allow only .dpr and .pas files to be selected
  openDialog.Filter :=
    'Delphi project files|*.dpr|Delphi pascal files|*.pas';

  // Select pascal files as the starting filter type
  openDialog.FilterIndex := 2;

  // Display the open file dialog
  if openDialog.Execute
  then ShowMessage('File : '+openDialog.FileName)
  else ShowMessage('Open file was cancelled');

  // Free up the dialog
  openDialog.Free;

  {Creating the dialog object: You define a TOpenDialog variable, and then assign a new TOpenDialog object to it:

  var
    openDialog : TOpenDialog;
  begin
    openDialog := TOpenDialog.Create(self);


  Note that the dialog must have an anchor - here we provide the current object - self - as the anchor.

  Setting options  - Before displaying the dialog, you are likely to configure it to your needs by setting the dialog properties.

  Here are the main properties:
 
  Title property - Used to set the caption for the dialog.

  FileName property - Gives a default file name to open. (Otherwise, the file name field is blank). When returning from the dialog,
   if the user has hit OK, this property will contain the (first) selected file name, including its full path (see the first example).
 
  Filter property - This allows only certain file types to be displayed and selectable. The filter text is displayed in a
  drop down below the file name field. The following example selects for text files only:

  openDialog.Filter := 'Text files only|*.txt';

  The drop down dialog shows the description before the | separator. After the separator, you define a mask that selects the files you want.

  openDialog.Filter := 'Text and Word files only|*.txt;*.doc';

  Above we have allowed two different file types, separated by a ;.

  openDialog.Filter := 'Text files|*.txt|Word files|*.doc';

  Above we have allowed text and Word files as two options in the drop down list.

  FilterIndex property
  Defines which (starting at 1) of the drop down filter choices will be displayed first.
 
  InitialDir property
  Sets the starting directory in the dialog.

  Options property
  This is a set of TOpenOptions flags. These are quite extensive. The key values are:

  ofReadOnly 	Opens the file for read only
  ofFileMustExist 	Only existing file may be opened
  ofAllowMultiSelect 	User can select 2 or more files


  Displaying the dialog

  We now call a method of TOpenDialog:

  if openDialog.Execute
  then ...

  Execute returns true if the user selected a file and hit OK. You can then use the selected file:

  Finishing with the dialog

  The selected file or files are obtained using the following properties:

  FileName property
  This holds the full path plus file name of the selected file

  Files property
  This holds the full path plus file name of the a multiple file selection. The file names are held in the returned TStrings value (see the TStringList for more on string lists).

  Finally, we must free the dialog object:

  openDialog.free;}

end;

procedure TForm1.Button14Click(Sender: TObject);
var
  openDialog : TOpenDialog;    // Open dialog variable
  i : Integer;
begin

  //Example code : Selecting multiple files
  
  // Create the open dialog object - assign to our open dialog variable
  openDialog := TOpenDialog.Create(self);

  // Set up the starting directory to be the current one
  openDialog.InitialDir := GetCurrentDir;

  // Allow multiple files to be selected - of any type
  openDialog.Options := [ofAllowMultiSelect];

  // Display the open file dialog
  if not openDialog.Execute
  then ShowMessage('Open file was cancelled')
  else
  begin
    // Display the selected file names
    for i := 0 to openDialog.Files.Count-1 do
      ShowMessage(openDialog.Files[i]);
  end;

  // Free up the dialog
  openDialog.Free;
end;

procedure TForm1.Button15Click(Sender: TObject);
var
  saveDialog : TSaveDialog;    // Save dialog variable
begin
  // Create the save dialog object - assign to our save dialog variable
  saveDialog := TSaveDialog.Create(self);

  // Give the dialog a title
  saveDialog.Title := 'Save your text or word file';

  // Set up the starting directory to be the current one
  saveDialog.InitialDir := GetCurrentDir;

  // Allow only .txt and .doc file types to be saved
  saveDialog.Filter := 'Text file|*.txt|Word file|*.doc';

  // Set the default extension
  saveDialog.DefaultExt := 'txt';

  // Select text files as the starting filter type
  saveDialog.FilterIndex := 1;

  // Display the open file dialog
  if saveDialog.Execute
  then ShowMessage('File : '+saveDialog.FileName)
  else ShowMessage('Save file was cancelled');

  // Free up the dialog
  saveDialog.Free;

  {Description
The TSaveDialog is a visual component. It is used to allow a user to select the name of a file to save to.
 
It can be defined by dragging the save dialog icon from the Dialogs tab in Delphi, or by defining a TSaveDialog variable.
 
The TSaveDialog can be configured to suit your needs. When using it, you would proceed along the following steps:
 
Creating the dialog object
 
You define a TSaveDialog variable, and then assign a new TSaveDialog object to it:
 
var
  saveDialog : TSaveDialog;
begin
  saveDialog := TSaveDialog.Create(self);

 
Note that the dialog must have an anchor - here we provide the current object - self - as the anchor.
 
Setting options
 
Before displaying the dialog, you are likely to configure it to your needs by setting the dialog properties. Here are the main properties:
 
Title property
Gives the caption to the dialog.
 
FileName property
Gives a default file name to save. (Otherwise, the file name field is blank).
 
DefaultExt property
Defines the extension that will be added to the user file name, if manually typed (rather than selected from the file list). If their are two or more save filter extension types, then this value is ignored. However, it must be provided in order for the drop down list extension values to be used. Strange!
 
Filter property
This allows only certain file types to be displayed and selectable. The filter text is displayed in a drop down below the file name field. The following example selects for text files only:
 
saveDialog.Filter := 'Text files only|*.txt';
 
The drop down dialog shows the description before the | separator. After the separator, you define a mask that selects the files you want.
 
saveDialog.Filter := 'Text files|*.txt|Word files|*.doc';
 
Above we have allowed text and Word files as two options in the drop down list.
 
FilterIndex property
Defines which (starting at 1) of the drop down filter choices will be displayed first.
 
InitialDir property
Sets the starting directory in the dialog.
 
Displaying the dialog
 
We now call a method of TSaveDialog:
 
if saveDialog.Execute
then ...
 
Execute returns true if the user selected a file and hit OK. You can then save to the selected file:
 
Finishing with the dialog
 
The selected file obtained using the following property:
 
FileName property
This holds the full path plus file name of the selected file. Finally, we must free the dialog object:
 
saveDialog.free;}

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  {Type	 	Name	 	Summary
 
 Procedure	 	Append	 	Open a text file to allow appending of text to the end
 Procedure	 	Assign	 	Assigns a file handle to a binary or text file
 Procedure	 	AssignFile	 	Assigns a file handle to a binary or text file
 Procedure	 	AssignPrn	 	Treats the printer as a text file - an easy way of printing text
 Procedure	 	BlockRead	 	Reads a block of data records from an untyped binary file
 Procedure	 	BlockWrite	 	Writes a block of data records to an untyped binary file
 Procedure	 	ChDir	 	Change the working drive plus path for a specified drive
 Procedure	 	Close	 	Closes an open file
 Procedure	 	CloseFile	 	Closes an open file
 Function	 	CreateDir	 	Create a directory
 Function	 	DeleteFile	 	Delete a file specified by its file name
 Function	 	DirectoryExists	 	Returns true if the given directory exists
 Function	 	Eof	 	Returns true if a file opened with Reset is at the end
 Function	 	Eoln	 	Returns true if the current text file is pointing at a line end
 Procedure	 	Erase	 	Erase a file
 Function	 	FileExists	 	Returns true if the given file exists
 Variable	 	FileMode	 	Defines how Reset opens a binary file
 Function	 	FilePos	 	Gives the file position in a binary or text file
 Function	 	FileSearch	 	Search for a file in one or more directories
 Function	 	FileSetDate	 	Set the last modified date and time of a file
 Function	 	FindClose	 	Closes a successful FindFirst file search
 Function	 	FindFirst	 	Finds all files matching a file mask and attributes
 Function	 	FindNext	 	Find the next file after a successful FindFirst
 Procedure	 	Flush	 	Flushes buffered text file data to the file
 Function	 	ForceDirectories	 	Create a new path of directories
 Function	 	GetCurrentDir	 	Get the current directory (drive plus directory)
 Procedure	 	GetDir	 	Get the default directory (drive plus path) for a specified drive
 Variable	 	Input	 	Defines the standard input text file
 Procedure	 	MkDir	 	Make a directory
 Variable	 	Output	 	Defines the standard output text file
 Function	 	RemoveDir	 	Remove a directory
 Procedure	 	Rename	 	Rename a file
 Function	 	RenameFile	 	Rename a file or directory
 Procedure	 	Reset	 	Open a text file for reading, or binary file for read/write
 Procedure	 	ReWrite	 	Open a text or binary file for write access
 Procedure	 	RmDir	 	Remove a directory
 Procedure	 	Seek	 	Move the pointer in a binary file to a new record position
 Function	 	SeekEof	 	Skip to the end of the current line or file
 Function	 	SeekEoln	 	Skip to the end of the current line or file
 Function	 	SelectDirectory	 	Display a dialog to allow user selection of a directory
 Function	 	SetCurrentDir	 	Change the current directory
 Type	 	Text	 	Defines a file as a text file
 Type	 	TextFile	 	Declares a file type for storing lines of text
 Procedure	 	Truncate	 	Truncates a file size - removes all data after the current position
 Type	 	TSearchRec	 	Record used to hold data for FindFirst and FindNext}
end;

end.
