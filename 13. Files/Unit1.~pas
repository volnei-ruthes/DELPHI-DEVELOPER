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

end.
