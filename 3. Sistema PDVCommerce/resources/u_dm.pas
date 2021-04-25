unit u_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    DriveMySQL: TFDPhysMySQLDriverLink;
    FDTableCargos: TFDTable;
    FDQuery_cargos: TFDQuery;
    DataSourceCargos: TDataSource;
    FDTableFuncionarios: TFDTable;
    FDQuery_funcionarios: TFDQuery;
    DataSourceFuncionarios: TDataSource;
    FDTableUsuarios: TFDTable;
    FDQuery_Usuarios: TFDQuery;
    DataSourceUsuarios: TDataSource;
    FDTableFornecedores: TFDTable;
    FDQuery_fornecedores: TFDQuery;
    DataSourceFornecedores: TDataSource;
    FDTableProdutos: TFDTable;
    FDQuery_produtos: TFDQuery;
    DataSourceProdutos: TDataSource;
    FDQueryEntradaProdutos: TFDQuery;
    DataSourceEntradaProdutos: TDataSource;
    FDQueryEntradaProdutosid: TFDAutoIncField;
    FDQueryEntradaProdutosproduto: TStringField;
    FDQueryEntradaProdutosproduto_id: TIntegerField;
    FDQueryEntradaProdutosquantidade: TIntegerField;
    FDQueryEntradaProdutosfornecedor_id: TIntegerField;
    FDQueryEntradaProdutosvalor: TBCDField;
    FDQueryEntradaProdutostotal: TBCDField;
    FDQueryEntradaProdutosdata: TDateField;
    FDQueryEntradaProdutosnome: TStringField;
    FDQuerySaidaProdutos: TFDQuery;
    DataSourceSaidaProdutos: TDataSource;
    FDQueryVendasC: TFDQuery;
    DataSourceVendasC: TDataSource;
    FDQueryVendasD: TFDQuery;
    DataSourceVendasD: TDataSource;
    FDQueryVendasDid: TFDAutoIncField;
    FDQueryVendasDvendas_id: TIntegerField;
    FDQueryVendasDproduto: TStringField;
    FDQueryVendasDvalor: TBCDField;
    FDQueryVendasDquantidade: TIntegerField;
    FDQueryVendasDtotal: TBCDField;
    FDQueryVendasDproduto_id: TIntegerField;
    FDQueryVendasDfuncionaro_id: TIntegerField;
    FDQuerySuporte: TFDQuery;
    FDQueryMovimentos: TFDQuery;
    DataSourceMovimentos: TDataSource;
    FDQueryGastos: TFDQuery;
    DataSourceGastos: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TFuncionario = record
    Id:string;
    Nome:string;
    Cargo:string;
  end;

  TUser = record
    Usuario       : string;
    Id            : string;
    Password      : string;
    nivelUser     : string;
    funcionarioId : string;
  end;

  TEntradaProdutos = record
    idFornecedor:string;
    nomeFornecedor:string;
    idProduto:string;
    nomeProduto:string;
    estoqueProduto:integer;
  end;

  TEstoqueBaixo = record
    idProduto:integer;
    nomeProduto:string;
    estoqueProduto:integer;
  end;

   TVendaPDV = record
    totalItens    : double;
    subtotal      : double;
    totalDesconto : double;
    totalCompras  : double;
    totalRecebido : double;
    trocoDevolver : double;
  end;

  TVendaItemProdutoPDV = record
    idProduto:string;
    nomeProduto:string;
    estoqueProduto:integer;
    qtdeEstoqueItemVendido:integer;
    precoUnitarioItem: double;
  end;

  TFuncionarioCaixaPDV = record
    Id:string;
    Nome:string;
    Cargo:string;
  end;

  TItemExcluidoPDV = record
    id    : string;
    Qtde  : integer;
    total : double;
  end;

var
  DM: TDM;

  //VAR GLOBAIS
  Funcionario          : TFuncionario;
  EntradaProdutos      : TEntradaProdutos;
  EstoqueBaixo         : TEstoqueBaixo;
  User                 : TUser;
  VendaItemProdutoPDV  : TVendaItemProdutoPDV;
  vendaPDV             : TVendaPDV;
  FuncionarioCaixaPDV  : TFuncionarioCaixaPDV;
  ItemExcluidoPDV      : TItemExcluidoPDV;
  Doc, codProdutos : string;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Connected := true;
end;

end.