unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

end.
