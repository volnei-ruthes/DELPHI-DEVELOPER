unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type

  TPessoa = packed record
    Nome: String[255];
    Telefone: String[255];
  end;


  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Button1: TButton;
    odFile: TOpenDialog;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button2: TButton;
    sdFile: TSaveDialog;
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
  Pessoa: TPessoa;
  fPess: TFileStream;
begin
   //Metodo Escrita.
   if sdFile.Execute then // SaveDialog
  begin
    fPess := TFileStream.Create( sdFile.FileName, fmCreate );
    try
      Pessoa.Nome := Self.Edit1.Text;
      Pessoa.Telefone := Self.Edit2.Text;
      fPess.Write( Pessoa, SizeOf( TPessoa ) );
    finally
      FreeAndNil( fPess );
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Pessoa: TPessoa;
  fPess: TFileStream;
  CountRead: Integer;
begin
   // OpenDialog
  if odFile.Execute then
  begin
    fPess := TFileStream.Create( odFile.FileName, fmOpenRead );
    try
      CountRead := fPess.Read( Pessoa, SizeOf( TPessoa ) );
      if CountRead = 0 then Exit;
      Self.Edit1.Text := Pessoa.Nome;
      Self.Edit2.Text := Pessoa.Telefone;
    finally
      FreeAndNil( fPess );
    end;
  end;

end;

end.
