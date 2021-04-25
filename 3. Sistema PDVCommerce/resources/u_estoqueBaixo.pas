unit u_estoqueBaixo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmEstoqueBaixo = class(TForm)
    db_EstoqueBaixo: TDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure db_EstoqueBaixoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ListaEstoqueBaixo;
  public
    { Public declarations }
  end;

var
  frmEstoqueBaixo: TfrmEstoqueBaixo;

implementation

{$R *.dfm}

uses u_geralHelper, u_dm, u_entradasProdutosEAQ, u_produtos;

procedure TfrmEstoqueBaixo.db_EstoqueBaixoDblClick(Sender: TObject);
begin
  //Entrada de Produtos
  Doc:='ENB';
  //Captura dados do grid.
  EstoqueBaixo.idProduto      := dm.FDQuery_produtos.FieldByName('id').Value;
  EstoqueBaixo.nomeProduto    := dm.FDQuery_produtos.FieldByName('nome').Value;
  EstoqueBaixo.estoqueProduto := dm.FDQuery_produtos.FieldByName('estoque').Value;
  //Abre tela Entrada Produtos para novo pedido.
  frmEntradaProdutosEAQ := TfrmEntradaProdutosEAQ.Create(self);
  frmEntradaProdutosEAQ.Show;
end;

procedure TfrmEstoqueBaixo.FormActivate(Sender: TObject);
begin
   ListaEstoqueBaixo;
end;

procedure TfrmEstoqueBaixo.FormShow(Sender: TObject);
begin
   ListaEstoqueBaixo;
end;

procedure TfrmEstoqueBaixo.ListaEstoqueBaixo;
begin
  with dm.FDQuery_produtos do begin
    Close;
    SQL.clear;
    SQL.Add('SELECT * FROM produtos WHERE estoque <= 10');
    //ParamByName('pQtdeEstoque').Value    := NewEstoque;
    Open();
  end;
end;

end.
