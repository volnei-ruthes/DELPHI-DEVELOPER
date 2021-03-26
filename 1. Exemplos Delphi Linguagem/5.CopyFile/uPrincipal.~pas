unit uPrincipal;

{
 função CopyFile está presente na unit Windows que, portanto, precisa ser importada na cláusula uses da unit em que desejamos utilizar
 essa função. Function CopyFile(lpExistingFileName:PWideChar; lpNewFileName: PWideChar; bFailIfExists: LongBool): LongBool;
 ONDE:
1.lpExistingFileName: Caminho do arquivo a ser copiado;
2.lpNewFileName: Caminho do novo arquivo de destino;
3.bFailIfExists: Parâmetro do tipo boolean que define se o processo de cópia deve ser interrompido e uma falha apresentada
caso o arquivo de destino já exista (valor True). Caso seja passado o valor False, o arquivo de destino será sobrescrito, caso exista.
assim se passamos o último argumento como True, indicando que o processo deve falhar caso o arquivo de destino já exista.
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
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
  pathOrigem, pathDestino: string;
begin
  pathOrigem:= ExtractFileDir(GetCurrentDir)+'\10. CopyFile\pasta_origem\teste.txt'; //Pega o caminho do exe + caminho da pasta origem.
  pathDestino:= ExtractFileDir(GetCurrentDir)+'\10. CopyFile\pasta_destino\teste.txt';; //Pega o caminho do exe + caminho da pasta destino.

  if CopyFile(pchar(pathOrigem),pchar(pathDestino), true) then  //Atenção: a função tem q converter string com o pchar().
     ShowMessage('Arquivo copiado com sucesso')
  else
     ShowMessage('#Atenção# - Problema ao copiar o arquivo.');  
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  pathOrigem, pathDestino: string;
begin
  pathOrigem:= ExtractFileDir(GetCurrentDir)+'\10. CopyFile\pasta_origem\teste.txt'; //Pega o caminho do exe + caminho da pasta origem.
  pathDestino:= ExtractFileDir(GetCurrentDir)+'\10. CopyFile\pasta_destino\teste.txt';; //Pega o caminho do exe + caminho da pasta destino.

  if FileExists(pathOrigem) then
  begin
    if not FileExists(pathdestino) then
    begin
       if CopyFile(pchar(pathOrigem),pchar(pathDestino),true) then
       begin           
         ShowMessage('Arquivo de destino copiado com sucesso.')
       end;
    end
    else
    begin
       if MessageDlg('Foi encontrado um arquivo com o mesmo nome, deseja substituir o arquivo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
       begin
          if CopyFile(pchar(pathOrigem),pchar(pathDestino),false) then
           begin
             ShowMessage('Arquivo substituido com sucesso.');
           end
           else
           begin
             ShowMessage('Copia não realizada!');
           end;
       end; 
    end;
  end;
end;

end.
