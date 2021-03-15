unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uModelTPessoa, Contnrs, WebAdapt;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;    
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
  ListaPonteiros : TList;
  myObjeto : TPessoa;
  i:integer;
begin
  ListaPonteiros := TList.Create; //Cria lista ponteiro.

  // Cria 2 objetos TPessoa e add na lista de ponteiros.
  /// 1 Objeto exemplo
  myObjeto := TPessoa.create;
  myObjeto.Nome := 'volnei';
  ListaPonteiros.Add(myObjeto);
  /// 2 objeto exemplo - desta vez já preenchi o nome direto no create (sobrecarga de metodo na classe e menos codigo na view).
  myObjeto := TPessoa.create('mario');   
  ListaPonteiros.Add(myObjeto);

  // percorre a lista de ponteiro com objetos Tpessoa add no memo1
  for i := 0 to ListaPonteiros.Count -1 do
  begin
    memo1.Lines.Add( TPessoa(ListaPonteiros.Items[i]).Nome ); 
  end;

  //Percorrendo a Lista e Destruindo Um Por Um os Objetos
  for i := 0 to ListaPonteiros.Count -1 do
  begin
    TPessoa(ListaPonteiros.Items[i]).Free;
  end;
end;

end.
