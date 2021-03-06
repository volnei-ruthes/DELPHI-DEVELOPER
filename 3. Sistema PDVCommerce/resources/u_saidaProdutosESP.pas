unit u_saidaProdutosESP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmSaidaProdutoESP = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btn_novo: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_buscarProduto: TSpeedButton;
    Label3: TLabel;
    edt_produto: TEdit;
    edt_quantidade: TEdit;
    db_saidaProdutos: TDBGrid;
    Label5: TLabel;
    edt_motivo: TEdit;
    DataBuscar: TDateTimePicker;
    lbl_Totalizador: TLabel;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_buscarProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataBuscarChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure db_saidaProdutosCellClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure inicializaTela;
    procedure listarSaidaProdutos;
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
  frmSaidaProdutoESP: TfrmSaidaProdutoESP;
  idSaidaProdutos:string;

implementation

{$R *.dfm}

uses u_dm, u_geralHelper, u_produtos;



procedure TfrmSaidaProdutoESP.btn_buscarProdutoClick(Sender: TObject);
begin
  Doc:='ESP';  //Saida Produto.
  frm_produtos := Tfrm_produtos.Create(self);
  frm_produtos.Show;
end;

procedure TfrmSaidaProdutoESP.btn_cancelarClick(Sender: TObject);
begin
  listarSaidaProdutos;
  configuraBtnCancelar;
end;

procedure TfrmSaidaProdutoESP.btn_excluirClick(Sender: TObject);

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
      NewEstoque := EstoqueAtual + strtoint(edt_quantidade.Text);  //diminui o estoque com a qtde da exclus?o da compra.
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
     with dm.FDQuerySaidaProdutos do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM saida_produtos');
       SQL.Add('WHERE id='+idSaidaProdutos);
       ExecSQL;
     end;
     atualizaEstoquePosExclusao;
     Aviso('Registro excluido com sucesso!');
     inicializaTela;
     listarSaidaProdutos;
   end;

end;

procedure TfrmSaidaProdutoESP.btn_novoClick(Sender: TObject);
begin
  HabilitarCampos;
  limparCampos;
  btn_salvar.Visible:=true;
  configurarBtnNovo;
end;

procedure TfrmSaidaProdutoESP.btn_salvarClick(Sender: TObject);
begin
   if edt_produto.isVazio then begin
    AvisoAlerta('Campo produto deve ser preenchido!');
    exit;
  end;

  if edt_quantidade.isVazio then begin
    AvisoAlerta('Campo Qtde deve ser preenchido!');
    exit;
  end;

  if (edt_quantidade.isVazio) or (edt_quantidade.Text = '0') then begin
    AvisoAlerta('Campo quantidade deve ser preenchido!');
    edt_quantidade.SetFocus;
    exit;
  end;

   if edt_motivo.isVazio then begin
    AvisoAlerta('Campo motivo deve ser preenchido!');
    edt_motivo.SetFocus;
    exit;
  end;

  with dm.FDQuerySaidaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO saida_produtos (produto, produto_id, quantidade, motivo, data)');
    SQL.Add(' VALUES (:produto, :produto_id, :quantidade, :motivo, :data)');
    ParamByName('produto').Value       := edt_produto.Text;
    ParamByName('produto_id').Value    := EntradaProdutos.idProduto;
    ParamByName('quantidade').Value    := edt_quantidade.Text;
    ParamByName('motivo').Value        := edt_motivo.Text;
    ParamByName('data').AsDate         := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  //Atualiza Estoque Produtos
  AtualizaTabProdutos;

  Aviso('Registro salvo com sucesso!');
  inicializaTela;
  listarSaidaProdutos;
end;

procedure TfrmSaidaProdutoESP.AtualizaTabProdutos;
var
  novoEstoque: integer;
begin
   novoEstoque := EntradaProdutos.estoqueProduto - strtoint(edt_quantidade.Text);    //novo estoque = estoque do produto - nova quantidade de saida
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE produtos SET estoque = :pEstoque WHERE id = :pId');
    ParamByName('pEstoque').Value    := novoEstoque;
    ParamByName('pId').Value := EntradaProdutos.idProduto;
    ExecSQL;
  end;
end;

procedure TfrmSaidaProdutoESP.buscarByData;
begin
  with dm.FDQuerySaidaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM saida_produtos WHERE data = :pData order by data desc');
    ParamByName('pData').Value := FormatDateTime('yyyy/mm/dd',DataBuscar.Date);
    Open();
  end;
end;

procedure TfrmSaidaProdutoESP.configuraBtnCancelar;
begin
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
end;

procedure TfrmSaidaProdutoESP.configurarBtnNovo;
begin
  btn_excluir.Visible           :=false;
  btn_buscarProduto.Visible     :=true;
end;

procedure TfrmSaidaProdutoESP.DataBuscarChange(Sender: TObject);
begin
  buscarByData;
end;

procedure TfrmSaidaProdutoESP.db_saidaProdutosCellClick(Column: TColumn);
begin
   btn_excluir.Visible       := true;
  if not(dm.FDQuerySaidaProdutos.FieldByName('id').Value = null) then begin
    edt_produto.Text        := dm.FDQuerySaidaProdutos.FieldByName('produto').Value;
    edt_quantidade.Text     := dm.FDQuerySaidaProdutos.FieldByName('quantidade').Value;
    edt_motivo.Text         := dm.FDQuerySaidaProdutos.FieldByName('motivo').Value;
    idSaidaProdutos         := dm.FDQuerySaidaProdutos.FieldByName('id').Value;
    //Para caso exclus?o da saida_produtos depois..
    EntradaProdutos.estoqueProduto := dm.FDQuerySaidaProdutos.FieldByName('quantidade').Value;
    EntradaProdutos.idProduto      := dm.FDQuerySaidaProdutos.FieldByName('produto_id').Value;
  end;

  edt_quantidade.Enabled       := false;
  edt_produto.Enabled          := false;
  edt_motivo.Enabled           := false;
  btn_buscarProduto.Visible    := false;
  btn_salvar.Visible           := false;
  btn_excluir.Visible          := true;
end;

procedure TfrmSaidaProdutoESP.DesabilitarCampos;
begin
  edt_produto.Enabled          := false;
  edt_quantidade.Enabled       := false;
  edt_motivo.Enabled           := false;
  btn_buscarProduto.Visible    := false;
end;

procedure TfrmSaidaProdutoESP.FormActivate(Sender: TObject);
begin
  edt_produto.Text    := EntradaProdutos.nomeProduto;
end;

procedure TfrmSaidaProdutoESP.FormKeyPress(Sender: TObject; var Key: Char);
begin
   //verifica se a tecla pressionada ? a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o pr?ximo campo, zerando o valor da vari?vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmSaidaProdutoESP.FormShow(Sender: TObject);
begin
  limparCampos;
  DesabilitarCampos;
  //listarEntradaProdutos;
  DataBuscar.Date := date;
  buscarByData;
end;

procedure TfrmSaidaProdutoESP.HabilitarCampos;
begin
  edt_quantidade.Text          := '0';
  edt_quantidade.Enabled       := true;
  edt_motivo.Enabled           := true;
  btn_buscarProduto.Visible    := true;
end;

procedure TfrmSaidaProdutoESP.inicializaTela;
begin
  limparCampos;
  DesabilitarCampos;
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
end;

procedure TfrmSaidaProdutoESP.limparCampos;
Var i : Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := '';
    end;
  end;
  lbl_Totalizador.Caption := '0'; //totalizador:=0;
end;

procedure TfrmSaidaProdutoESP.listarSaidaProdutos;
begin
  with dm.FDQuerySaidaProdutos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM saida_produtos order by data desc');
    Open();
  end;
end;

end.
