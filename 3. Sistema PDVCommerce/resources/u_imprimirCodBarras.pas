unit u_imprimirCodBarras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TFrmImprimirCodBarras = class(TForm)
    imgCodBarra: TImage;
    edt_altura: TEdit;
    Label1: TLabel;
    edt_largura: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    PrintDialog1: TPrintDialog;
    procedure edt_alturaChange(Sender: TObject);
    procedure edt_alturaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_larguraKeyPress(Sender: TObject; var Key: Char);
    procedure edt_larguraChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure geraCodigoBarra(pCodigo:string; Canvas:TCanvas);
  public
    { Public declarations }
  end;

var
  FrmImprimirCodBarras: TFrmImprimirCodBarras;

implementation

{$R *.dfm}

uses u_geralHelper, u_dm;

procedure TFrmImprimirCodBarras.Button1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmImprimirCodBarras.edt_alturaChange(Sender: TObject);
var i:integer;
begin
  if edt_altura.isVazio then edt_altura.Text:='1';
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TImage then begin
      TImage(Components[i]).Height := strtoint(edt_altura.Text) * 38 ;  //1cm = 38 pixel.
    end;
  end;
end;

procedure TFrmImprimirCodBarras.edt_larguraChange(Sender: TObject);
var i:integer;
begin
  if edt_largura.isVazio then edt_largura.Text:='1';
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TImage then begin
      TImage(Components[i]).Width := strtoint(edt_largura.Text) * 38;  //1cm = 38 pixel.
    end;
  end;
end;

procedure TFrmImprimirCodBarras.edt_alturaKeyPress(Sender: TObject;   var Key: Char);
begin
   if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then begin
    key := #0;
   end;
end;

procedure TFrmImprimirCodBarras.edt_larguraKeyPress(Sender: TObject;  var Key: Char);
begin
   if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then begin
    key := #0;
   end;
end;

procedure TFrmImprimirCodBarras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //entra no form se apertou enter j� manda imprimir
  if key = 13 then begin
    if PrintDialog1.Execute then begin
      print;
    end;
  end;


end;

procedure TFrmImprimirCodBarras.FormShow(Sender: TObject);
var i:integer;
begin
  //Seta padr�o os tamanhos
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TImage then begin
      TImage(Components[i]).Height := 65;  //1cm = 38 pixel.
      TImage(Components[i]).Width  := 203;  //1cm = 38 pixel.
      geraCodigoBarra(codProdutos,TImage(Components[i]).Canvas);
    end;
  end;
  FrmImprimirCodBarras.SetFocus;
end;

procedure TFrmImprimirCodBarras.geraCodigoBarra(pCodigo: string; Canvas: TCanvas);
const
  digitos : array['0'..'9'] of string[5]= ('00110', '10001', '01001', '11000','00101', '10100', '01100', '00011', '10010', '01010');

var
  s : string;
  i, j, x, y, t : Integer;

begin
  // Gerar o valor para desenhar o c�digo de barras

  // Caracter de in�cio
  s := '0000';
  for i := 1 to length(pCodigo) div 2 do
    for j := 1 to 5 do
      s := s + Copy(Digitos[pCodigo[i * 2 - 1]], j, 1) + Copy(Digitos[pCodigo[i * 2]], j, 1);
  // Caracter de fim
  s := s + '100';

  // Desenhar em um objeto canvas
  // Configurar os par�metros de posi��o iniciais
  x := 10; //posi��o ini.
  y := 10; //posi��o ini.

  // Pintar o fundo do c�digo de branco
  Canvas.Brush.Color := clWhite;
  Canvas.Pen.Color := clWhite;
  Canvas.Rectangle(x,y, 500, 50);

  // Definir as cores da caneta
  Canvas.Brush.Color := clBlack;
  Canvas.Pen.Color := clBlack;

  // Escrever o c�digo de barras no canvas
  for i := 1 to length(s) do
  begin
    // Definir a espessura da barra
    t := strToInt(s[i]) * 2 + 1;
    // Imprimir apenas barra sim barra n�o (preto/branco - intercalado);
    if i mod 2 = 1 then
    Canvas.Rectangle(x, y, x + t, 50);
    // Passar para a pr�xima barra
    x := x + t;
  end;

end;

end.
