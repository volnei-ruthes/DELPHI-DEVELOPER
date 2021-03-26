unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uCliente, uListaCliente;

type
  TForm1 = class(TForm)
    btnAdicionar: TButton;
    btnRemover: TButton;
    btnContar: TButton;
    edtIDCliente: TEdit;
    edtNome: TEdit;
    edtCNPJ: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnContarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    auxListaCliente: TListaCliente;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 auxListaCliente := TListaCliente.Create;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
var
  auxCliente: TCliente;
begin
  auxCliente := TCliente.Create;
  with auxCliente do
  begin
    IdCliente:= strtoint(edtIDCliente.Text);
    Nome:= edtNome.Text;
    CNPJ:= edtCNPJ.Text;
  end;
  auxListaCliente.Adcionar(auxCliente);
end;

procedure TForm1.btnRemoverClick(Sender: TObject);
var
  auxIdCliente: string;
begin
  if InputQuery('Remocao de Cliente','Digite o codigo do cliente',auxIdCliente)  then
  begin
     auxListaCliente.Remover(strtoint(auxIdCliente));
  end;
end;

procedure TForm1.btnContarClick(Sender: TObject);
begin
  showmessage('Total de Clientes na Lista: '+inttostr(auxListaCliente.Count));
end;

end.
