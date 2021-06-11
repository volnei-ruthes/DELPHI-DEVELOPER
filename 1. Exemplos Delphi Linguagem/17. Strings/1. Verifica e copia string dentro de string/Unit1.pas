unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
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

//---VERIFICA UMA STRING E RETORNA A MESMA
procedure TForm1.Button1Click(Sender: TObject);
var posicao : integer;
    textoQualquer: string;
begin
  textoQualquer := 'O gato roeu a roupa do rei Gato';
  posicao := Pos('gato',textoQualquer);   //POS - verifica se existe o texto e retorna a posição encontrada.

  if posicao = 0 then
    showmessage('nao encontrado')
  else
    showmessage('encontrado, posicao: '+inttostr(posicao)+', palavra: '+copy( textoQualquer, Pos('gato',textoQualquer), 4));           //Copy(‘texto’, posição inicial, quantidade de caractares a serem copiados)

end;

end.
