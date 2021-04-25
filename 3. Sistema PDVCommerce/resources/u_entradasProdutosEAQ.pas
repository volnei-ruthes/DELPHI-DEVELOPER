unit u_entradasProdutosEAQ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls;

type
  TfrmEntradaProdutosEAQ = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btn_novo: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_buscarProduto: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    edt_produto: TEdit;
    edt_quantidade: TEdit;
    edt_valor: TEdit;
    dbGrid_entradaProdutosEAQ: TDBGrid;
    Label5: TLabel;
    btn_BuscarFornecedor: TSpeedButton;
    edt_fornecedor: TEdit;
    DataBuscar: TDateTimePicker;
    lbl_Totalizador: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_quantidadeChange(Sender: TObject);
    procedure edt_valorChange(Sender: TObject);
    procedure btn_buscarProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_BuscarFornecedorClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbGrid_entradaProdutosEAQCellClick(Column: TColumn);
    procedure btn_excluirClick(Sender: TObject);
    procedure DataBuscarChange(Sender: TObject);
  private
    { Private declarations }
    procedure inicializaTela;
    procedure listarEntradaProdutos;
    procedure listarEntradaProdutosByIdProduto(pProdutoId:integer; out pHasReturn:boolean);
    procedure buscarByData;
    procedure limparCampos;
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
    procedure configuraBtnCancelar;
    procedure configurarBtnNovo;
    procedure AtualizaTabProdutos;
  public
    { Public declarations }
  end;

var
  frmEntradaProdutosEAQ: TfrmEntradaProdutosEAQ;
  totalizador:Double;
  idEntradaProdutos:string;
  hasReturn:boolean;

implementation

{$R *.dfm}

uses u_geralHelper, u_dm, u_produtos, u_fornecedores;

{ TfrmEntradaProdutosEAQ }



procedure TfrmEntradaProdutosEAQ.btn_BuscarFornecedorClick(Sender: TObject);
begin
  Doc:='EAQ';
  FrmFornecedores := TFrmFornecedores.Create(self);
  FrmFornecedores.Show;
end;

procedure TfrmEntradaProdutosEAQ.btn_buscarProdutoClick(Sender: TObject);
begin
  Doc:='EAQ';  //Entrada de Produtos
  frm_produtos := Tfrm_produtos.Create(self);
  frm_produtos.Show;
end;

procedure TfrmEntradaProdutosEAQ.btn_cancelarClick(Sender: TObject);
begin
  listarEntradaProdutos;
  configuraBtnCancelar;
end;

procedure TfrmEntradaProdutosEAQ.btn_excluirClick(Sender: TObject);

    procedure atualizaEstoquePosExclusao;
    var
      EstoqueAtual, NewEstoque: integer;
    begin
      //1. Get Qtde Estoque BD
      with dm.FDQuery_produtos do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT estoque FROM produtos WHERE id = :pIdProduto');
        ParamByName('pIdProduto').Value := EntradaProdutos.idProduto;
        Open();
        EstoqueAtual := dm.FDQuery_produtos.FieldByName('estoque').Value;
      end;
      NewEstoque := EstoqueAtual - EntradaProdutos.estoqueProduto;  //diminui o estoque com a qtde da exclus�o da compra.
      //2. Atualiza estoque produtos
      with dm.FDQuery_produtos do begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE produtos SET estoque = :pEstoque WHERE id = :pId');
        ParamByName('pEstoque').Value    := NewEstoque;
        ParamByName('pId').Value := EntradaProdutos.idProduto;
        ExecSQL;
      end;

    end;
begin
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
     with dm.FDQueryEntradaProdutos do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM entrada_produtos');
       SQL.Add('WHERE id='+idEntradaProdutos);
       ExecSQL;
     end;
     atualizaEstoquePosExclusao;
     Aviso('Registro excluido com sucesso!');
     inicializaTela;
     listarEntradaProdutos;
   end;
end;

procedure TfrmEntradaProdutosEAQ.btn_novoClick(Sender: TObject);
begin
  HabilitarCampos;
  limparCampos;
  btn_salvar.Visible:=true;
  configurarBtnNovo;
end;

procedure TfrmEntradaProdutosEAQ.btn_salvarClick(Sender: TObject);
begin
  if edt_produto.isVazio then begin
    AvisoAlerta('Campo produto deve ser preenchido!');
    exit;
  end;

  if edt_fornecedor.isVazio then begin
    AvisoAlerta('Campo fornecedor deve ser preenchido!');
    exit;
  end;

  if (edt_quantidade.isVazio) or (edt_quantidade.Text = '0') then begin
    AvisoAlerta('Campo quantidade deve ser preenchido!');
    edt_quantidade.SetFocus;
    exit;
  end;

   if (edt_valor.isVazio) or (edt_valor.Text = '0') then begin
    AvisoAlerta('Campo valor deve ser preenchido!');
    edt_valor.SetFocus;
    exit;
  end;

  with dm.FDQueryEntradaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO entrada_produtos (produto, produto_id, quantidade, fornecedor_id, valor, total, data)');
    SQL.Add(' VALUES (:produto, :produto_id, :quantidade, :fornecedor_id, :valor, :total, :data)');
    ParamByName('produto').Value       := edt_produto.Text;
    ParamByName('produto_id').Value    := EntradaProdutos.idProduto;
    ParamByName('quantidade').Value    := edt_quantidade.Text;
    ParamByName('fornecedor_id').Value    := EntradaProdutos.idFornecedor;
    ParamByName('valor').AsCurrency    := strtocurr(edt_valor.Text);
    ParamByName('total').AsCurrency    := totalizador;
    ParamByName('data').AsDate         := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  //Atualiza Estoque Produtos
  AtualizaTabProdutos;

  Aviso('Registro salvo com sucesso!');
  inicializaTela;
  listarEntradaProdutos;
end;

procedure TfrmEntradaProdutosEAQ.AtualizaTabProdutos;
var
  novoEstoque: integer;
begin
   novoEstoque := EntradaProdutos.estoqueProduto + strtoint(edt_quantidade.Text);    //novo estoque = estoque do produto + nova quantidade adiquirida.
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE produtos SET estoque = :pEstoque, dt_ultimacompra = :pData WHERE id = :pId');
    ParamByName('pEstoque').Value    := novoEstoque;
    ParamByName('pData').Value       := Date;
    ParamByName('pId').Value := EntradaProdutos.idProduto;
    ExecSQL;
  end;
end;

procedure TfrmEntradaProdutosEAQ.buscarByData;
begin
  with dm.FDQueryEntradaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM entrada_produtos INNER JOIN fornecedores on entrada_produtos.fornecedor_id = fornecedores.id where data = :pData order by data desc');
    ParamByName('pData').Value := FormatDateTime('yyyy/mm/dd',DataBuscar.Date);
    Open();
  end;

    //SQL.Add('SELECT * FROM entrada_produtos WHERE lower(data) LIKE ' + QuotedStr(LowerCase(trim(DataBuscar.Text+'%'))));

end;

procedure TfrmEntradaProdutosEAQ.configuraBtnCancelar;
begin
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
end;

procedure TfrmEntradaProdutosEAQ.configurarBtnNovo;
begin
  btn_excluir.Visible           :=false;
  btn_buscarProduto.Visible     :=true;
  btn_BuscarFornecedor.Visible  :=true;
end;

procedure TfrmEntradaProdutosEAQ.DataBuscarChange(Sender: TObject);
begin
  buscarByData;
end;

procedure TfrmEntradaProdutosEAQ.dbGrid_entradaProdutosEAQCellClick(Column: TColumn);
begin
  btn_excluir.Visible       := true;
  if not(dm.FDQueryEntradaProdutos.FieldByName('id').Value = null) then begin
    edt_produto.Text        := dm.FDQueryEntradaProdutos.FieldByName('produto').Value;
    edt_valor.Text          := dm.FDQueryEntradaProdutos.FieldByName('valor').Value;
    edt_quantidade.Text     := dm.FDQueryEntradaProdutos.FieldByName('quantidade').Value;
    edt_fornecedor.Text     := dm.FDQueryEntradaProdutos.FieldByName('fornecedor_id').Value;
    totalizador             := dm.FDQueryEntradaProdutos.FieldByName('total').Value;
    lbl_Totalizador.Caption := formatFloat('R$ #,,,,0.00',dm.FDQueryEntradaProdutos.FieldByName('total').Value); //Modelo moeda padr�o brasil com duas casas decimais.
    idEntradaProdutos       := dm.FDQueryEntradaProdutos.FieldByName('id').Value;
    //Para caso exclus�o do estoque depois..
    EntradaProdutos.estoqueProduto := dm.FDQueryEntradaProdutos.FieldByName('quantidade').Value;
    EntradaProdutos.idProduto      := dm.FDQueryEntradaProdutos.FieldByName('produto_id').Value;
  end;

  edt_quantidade.Enabled       := false;
  edt_valor.Enabled            := false;
  btn_buscarProduto.Visible    := false;
  btn_BuscarFornecedor.Visible := false;
  btn_salvar.Visible           := false;
  btn_excluir.Visible          := true;
end;

procedure TfrmEntradaProdutosEAQ.DesabilitarCampos;
begin
  edt_produto.Enabled          := false;
  edt_quantidade.Enabled       := false;
  edt_valor.Enabled            := false;
  edt_fornecedor.Enabled       := false;
  btn_buscarProduto.Visible    := false;
  btn_BuscarFornecedor.Visible := false;
end;

procedure TfrmEntradaProdutosEAQ.edt_quantidadeChange(Sender: TObject);
begin
  if edt_valor.isVazio then edt_valor.Text:='0';
  if edt_quantidade.isVazio then edt_quantidade.Text:='0';
  totalizador := strtofloat(edt_valor.Text) * strtofloat(edt_quantidade.Text);
  lbl_Totalizador.Caption := floattostr(totalizador);
end;

procedure TfrmEntradaProdutosEAQ.edt_valorChange(Sender: TObject);
begin
  if edt_valor.isVazio then edt_valor.Text:='0';
  if edt_quantidade.isVazio then edt_quantidade.Text:='0';
  totalizador := strtofloat(edt_valor.Text) * strtofloat(edt_quantidade.Text);
  lbl_Totalizador.Caption := floattostr(totalizador);
end;

procedure TfrmEntradaProdutosEAQ.FormActivate(Sender: TObject);
begin
  edt_produto.Text    := EntradaProdutos.nomeProduto;
  edt_fornecedor.Text := EntradaProdutos.nomeFornecedor;
end;

procedure TfrmEntradaProdutosEAQ.FormShow(Sender: TObject);
begin
  if Doc='ENB' then begin
    hasReturn:=true;
    limparCampos;
    DesabilitarCampos;
    listarEntradaProdutosByIdProduto(EstoqueBaixo.idProduto, hasReturn);
    if not(hasReturn) then begin
      listarEntradaProdutos;
    end;
    //exit;
  end else begin

  limparCampos;
  DesabilitarCampos;
  //listarEntradaProdutos;
  DataBuscar.Date := date;
  buscarByData;
  end;


end;

procedure TfrmEntradaProdutosEAQ.HabilitarCampos;
begin
  edt_valor.Text               :='0';
  edt_quantidade.Text          :='0';
  edt_quantidade.Enabled       := true;
  edt_valor.Enabled            := true;
  btn_buscarProduto.Visible    := true;
  btn_BuscarFornecedor.Visible := true;
end;

procedure TfrmEntradaProdutosEAQ.inicializaTela;
begin
  limparCampos;
  DesabilitarCampos;
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
end;

procedure TfrmEntradaProdutosEAQ.limparCampos;
Var i : Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := '';
    end;
  end;
  lbl_Totalizador.Caption := '0'; totalizador:=0;
end;

procedure TfrmEntradaProdutosEAQ.listarEntradaProdutos;
begin
  with dm.FDQueryEntradaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM entrada_produtos INNER JOIN fornecedores on entrada_produtos.fornecedor_id = fornecedores.id order by data desc');
    Open();
  end;
end;

procedure TfrmEntradaProdutosEAQ.listarEntradaProdutosByIdProduto(pProdutoId:integer; out pHasReturn:boolean);
begin
   with dm.FDQueryEntradaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM entrada_produtos INNER JOIN fornecedores on entrada_produtos.fornecedor_id = fornecedores.id WHERE produto_id = :pProduto_id order by data desc');
    ParamByName('pProduto_id').Value := pProdutoId;
    Open();

    if (dm.FDQueryEntradaProdutos.FieldByName('id').Value = null) then hasReturn := false;
  end;
end;

end.
