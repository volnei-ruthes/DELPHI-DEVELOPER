unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  //Class Fruit.
  TFrutas = class
  private
    FisRedonda: boolean;
    FTamanho: single;
    FDiametro: single;
    FLargura: single;
    procedure SetDiametro(const Value: single);
    procedure SetisRedonda(const Value: boolean);
    procedure SetLargura(const Value: single);
    procedure SetTamanho(const Value: single);
  published
    property isRedonda: boolean read FisRedonda write SetisRedonda;
    property Tamanho: single read FTamanho write SetTamanho;
    property Largura: single read FLargura write SetLargura;
    property Diametro: single read FDiametro write SetDiametro;
   public
    constructor Create(pDiametro:single); overload;
    constructor Create(pTamanho: single; pLargura:single); overload;
  end;

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure ShowFruta(pFruit:TFrutas);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TFrutas }

constructor TFrutas.Create(pDiametro: single);
begin
  FisRedonda:= true;
  FDiametro := pDiametro;
end;

constructor TFrutas.Create(pTamanho, pLargura: single);
begin
  FisRedonda:=false;
  FTamanho:= pTamanho;
  FLargura:= pLargura;
end;

procedure TFrutas.SetDiametro(const Value: single);
begin
  FDiametro := Value;
end;

procedure TFrutas.SetisRedonda(const Value: boolean);
begin
  FisRedonda := Value;
end;

procedure TFrutas.SetLargura(const Value: single);
begin
  FLargura := Value;
end;

procedure TFrutas.SetTamanho(const Value: single);
begin
  FTamanho := Value;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  maca, banana: TFrutas;
begin
  maca:= TFrutas.Create(1.5);
  banana:= TFrutas.Create(7,1.75);
  try
     ShowFruta(maca);
     ShowFruta(banana);
  finally
    maca.Free;
    banana.Free;
  end;
end;

procedure TForm1.ShowFruta(pFruit: TFrutas);
begin
  if pFruit.isRedonda then
    showmessage('Temos uma fruta redonda com '+floattostr(pFruit.Diametro)+' de diametro.')
  else
    showmessage('Temos uma longa fruta com '+floattostr(pFruit.Largura)+' de largura e '+#13+floattostr(pFruit.Tamanho)+' de tamanho.')
end;

end.
 