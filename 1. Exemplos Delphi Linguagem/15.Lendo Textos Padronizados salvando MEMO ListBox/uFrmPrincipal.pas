unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    btnSalvar: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
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
 arqTXT: TextFile;
 linha: string;
begin
  if OpenDialog1.Execute then
  begin
    if Application.MessageBox('Deseja carregar arquivo selecionado', 'Importação',+MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON1) = mrYes then
    begin
       AssignFile(arqTXT,OpenDialog1.FileName); //Abre o arquivo.
       Reset(arqTXT);
       while not eof(arqTXT) do
       begin
         Readln(arqTXT, linha);
         //listbox
         ListBox1.Items.Add('DO LISTBOX Data: '+copy(linha,1,10));
         ListBox1.Items.Add('Hora: '+copy(linha,12,8));
         ListBox1.Items.Add('Matricula: '+copy(linha,21,11));
         ListBox1.Items.Add('  ');

         //memo
         //listbox
         memo1.Lines.Add('DO MEMO Data: '+copy(linha,1,10));
         memo1.Lines.Add('Hora: '+copy(linha,12,8));
         memo1.Lines.Add('Matricula: '+copy(linha,21,11));
         memo1.Lines.Add('  ');
       end;
       CloseFile(arqTXT);
    end;
  end;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  ListBox1.Items.SaveToFile('c:\Arquivo1.txt');
  memo1.Lines.SaveToFile('c:\Arquivo2.txt');
end;

end.
