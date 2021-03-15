unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type myRecord = record
       rName: string;
       rIdade: integer;
       rIsGremista: boolean;
       rSalary: currency;
       rGenero: char;
  end;

var
  Form1: TForm1;
  RCliente: myRecord;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var a: string;
begin
  //Set Dados no RECORD
  RCliente.rName:='Carlos';
  RCliente.rSalary:=1500.00;

  //Get Dados RClientes
  showmessage(RCliente.rName);

  a:='teste 123';

end;

end.
 