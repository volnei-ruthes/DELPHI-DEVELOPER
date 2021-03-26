unit uFrmPrincipal;

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

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  vVariant,vVariant2:variant;
  texto: string;
  //vVariant2: array[0..3] of variant;
begin

  vVariant := 5;
  vVariant := 3.2;
  vVariant := true;
  vVariant := 'teste';
  showmessage(vVariant);

  //Variant Contendo um Array
  //Uma outra forma de aproveitar-mos esta estrutura de dados, é através da implementação de uma variant contendo um array.
  //Isso é possíve2l através da função VarArrayCreate. Observe abaixo:

  vVariant2 := VarArrayCreate([1,4], varVariant);    // Criando um array de Variant 
  // inserindo elementos no array
  vVariant2[1] := 'palavra';
  vVariant2[2] := 213;
  vVariant2[3] := true;
  vVariant2[4] := 2.4;
  
  showmessage(vVariant2[2]);


end;

end.
