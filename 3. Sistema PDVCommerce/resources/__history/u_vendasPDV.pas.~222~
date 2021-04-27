unit u_vendasPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.MPlayer;

type
  Tfrm_vendasPDV = class(TForm)
    painel_pdv_esquerda: TPanel;
    db_VendasPDV: TDBGrid;
    painel_pdv_direita: TPanel;
    painel_pdv_centro: TPanel;
    edt_codigoBarra: TEdit;
    painel_pdv_topo_grid: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_produto: TEdit;
    edt_descricao: TEdit;
    edt_qtde: TEdit;
    edt_precoUnitario: TEdit;
    edt_estoque: TEdit;
    Panel3: TPanel;
    img_quadro: TImage;
    edt_totalDoItem: TEdit;
    edt_subTotal: TEdit;
    edt_desconto: TEdit;
    edt_totalCompra: TEdit;
    edt_valorRecebido: TEdit;
    edt_troco: TEdit;
    MediaPlayer1: TMediaPlayer;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edt_codigoBarraChange(Sender: TObject);
    procedure edt_qtdeExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure edt_codigoBarraExit(Sender: TObject);
    procedure edt_descontoExit(Sender: TObject);
    procedure edt_valorRecebidoExit(Sender: TObject);
  private
    { Private declarations }
    procedure limparGeral;
    procedure limparProdutos;
    procedure buscarProdutos;
    procedure salvarItens;
    procedure salvarVenda;
    procedure limparImagemProduto;
    procedure listarDetalhesVenda;
    procedure ExibeImgProduto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
    function KeyIsDown(const Key: integer): boolean;
  public
    { Public declarations }
  end;

  //Enum Tipo Movimentações (uses TypInfo).
  TEnumTipoMovimento = (Entrada, Saida);

  //Aviso Sistema
  TAviso = class helper for TForm
    procedure AvisoAlerta(pMsg:PWideChar);
    procedure AvisoErro(pMsg:PWideChar);
    procedure Aviso(pMsg:PWideChar);
  end;

var
  frm_vendasPDV        : Tfrm_vendasPDV;  //Form
  isProdutoFind        : boolean;

implementation

{$R *.dfm}

uses u_dm, u_geralHelper, u_cancelaItemPDV, u_loginPDV, TypInfo;

{ TAviso }

procedure TAviso.Aviso(pMsg: PWideChar);
begin
  Application.MessageBox(pMsg,'Informação',MB_OK + MB_ICONINFORMATION)
end;

procedure TAviso.AvisoAlerta(pMsg:PWideChar);
begin
   //MessageDlg(pMsg,mtWarning,mbOKCancel,0);
   Application.MessageBox(pMsg,'Alerta!',MB_OK + MB_ICONWARNING)
end;

procedure TAviso.AvisoErro(pMsg:PWideChar);
begin
   Application.MessageBox(pMsg,'Erro!',MB_OK + MB_ICONERROR);
end;

{ Tfrm_vendasPDV }

function Tfrm_vendasPDV.KeyIsDown(const Key: integer): boolean; //Verifica qual tecla foi pressionada.
begin
  Result := GetKeyState(Key) and 128 > 0;
end;

procedure Tfrm_vendasPDV.buscarProdutos;
begin
  isProdutoFind := false;
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produtos WHERE codigo = ' + QuotedStr(trim(edt_codigoBarra.Text)));
    Open();
  end;

  if not dm.FDQuery_produtos.IsEmpty then begin
    //Add dados na tela venda.
    edt_produto.Text                   := dm.FDQuery_produtos['nome'];
    edt_descricao.Text                 := dm.FDQuery_produtos['descricao'];
    edt_estoque.Text                   := dm.FDQuery_produtos['estoque'];
    edt_precoUnitario.Text             := dm.FDQuery_produtos['valor'];
    if dm.FDQuery_produtos.FieldByName('imgproduto').Value <> null then begin
      ExibeImgProduto(dm.FDQuery_produtos,'imgproduto',img_quadro);  //3 parametros: 1.DataSet, 2. Campo do dataset, 3. Componente a ser exibido.
    end;
    VendaItemProdutoPDV.idProduto      := dm.FDQuery_produtos['id'];      //Para baixa de estoque.
    VendaItemProdutoPDV.estoqueProduto := dm.FDQuery_produtos['estoque']; //Para baixa de estoque.
    isProdutoFind := true;

    Try//Bip ao passar as mercadorias.
      with MediaPlayer1 do begin
        //FileName := ExtractFileDir(GetCurrentDir)+'\Debug\img\barCode.wave';
        //open;
        //Play;
      end;
    Except
    on E: Exception do
      ShowMessage('Erro ao abrir BarCode:' + E.Message );
    end;

  end else begin
    limparImagemProduto;
    limparProdutos;
  end;
end;

procedure Tfrm_vendasPDV.edt_codigoBarraChange(Sender: TObject);
begin
  if edt_codigoBarra.Text <> '' then buscarProdutos;
end;

procedure Tfrm_vendasPDV.edt_codigoBarraExit(Sender: TObject);
begin
  if not(isProdutoFind) then begin
    AvisoAlerta('Código do Produto não encontrado ou cadastrado!');
    edt_codigoBarra.SetFocus;
  end;
end;

procedure Tfrm_vendasPDV.edt_descontoExit(Sender: TObject);
begin
  VendaPDV.totalDesconto  :=  strTofloat(edt_desconto.Text);
  vendaPDV.totalCompras   := vendaPDV.subtotal - VendaPDV.totalDesconto;     //deve ser retirado do 'total da compra' o 'total do desconto' que foi dado ao cliente.
  edt_totalCompra.Text    := formatFloat('R$ #,,,,0.00',vendaPDV.totalCompras);
  edt_desconto.Text       := formatFloat('R$ #,,,,0.00',VendaPDV.totalDesconto);
  edt_valorRecebido.SetFocus;
end;

procedure Tfrm_vendasPDV.edt_qtdeExit(Sender: TObject);
begin
    edt_qtde.Enabled := false;

    //Totalizadores por cada ITEM (tela central)
    VendaItemProdutoPDV.qtdeEstoqueItemVendido := strtoint(edt_qtde.Text);
    VendaItemProdutoPDV.precoUnitarioItem      := strtofloat(edt_precoUnitario.Text);
    //Totalizadores da venda (tela direita)
    vendaPDV.totalItens      := VendaItemProdutoPDV.qtdeEstoqueItemVendido * VendaItemProdutoPDV.precoUnitarioItem;
    vendaPDV.subtotal        := vendaPDV.subtotal + vendaPDV.totalItens;
    edt_totalDoItem.Text     := formatFloat('R$ #,,,,0.00',vendaPDV.totalItens);
    edt_subTotal.Text        := formatFloat('R$ #,,,,0.00',vendaPDV.subtotal);
    edt_totalCompra.Text     := formatFloat('R$ #,,,,0.00',vendaPDV.subtotal);

    //Salva os Itens detalhes.
    salvarItens;
    listarDetalhesVenda;
end;

procedure Tfrm_vendasPDV.edt_valorRecebidoExit(Sender: TObject);
var
  idVendas_pdv_c : integer;
begin
  //Valor recebido - troco a devolver.
  VendaPDV.totalRecebido := strTofloat(edt_valorRecebido.Text);
  VendaPDV.trocoDevolver := VendaPDV.totalRecebido - VendaPDV.totalCompras;
  edt_valorRecebido.Text := formatFloat('R$ #,,,,0.00',VendaPDV.totalRecebido);
  edt_troco.Text         := formatFloat('R$ #,,,,0.00',VendaPDV.trocoDevolver);

  //FINALIZA VENDA.
  try

    try

       //1. SALVA CABEÇALHO DA VENDA.
       with dm.FDQueryVendasC do begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO vendas_pdv_c (data, funcionario, valor)');
        SQL.Add(' VALUES (:pData, :pFuncionario, :pValor)');
        ParamByName('pData').AsDateTime    := Now;
        ParamByName('pFuncionario').Value  := FuncionarioCaixaPDV.id;
        ParamByName('pValor').AsCurrency   := VendaPDV.totalCompras;
        ExecSQL;
      end;

      //GET ID CABEÇALHO DA ULTIMA VENDA.
       with dm.FDQueryVendasC do begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT id FROM vendas_pdv_c WHERE funcionario = :pFuncionario order by id desc LIMIT 1');
        ParamByName('pFuncionario').Value  := FuncionarioCaixaPDV.id;
        Open();
      end;
      idVendas_pdv_c := dm.FDQueryVendasC['id'];

      //2. UPDATE ID EM DETALHES DA VENDA.
      if not(dm.FDQueryVendasC.FieldByName('id').Value = null) then begin
         //UPDATE ID CABEÇALHO DA VENDA nos DETALHES.
         with dm.FDQueryVendasD do begin
          Close;
          SQL.Clear;
          SQL.Add('UPDATE vendas_pdv_d SET vendas_id = :pIdVendasC');
          SQL.Add('WHERE vendas_id = 0 AND funcionaro_id = :pIdFuncionario');
          ParamByName('pIdVendasC').Value      := idVendas_pdv_c;
          ParamByName('pIdFuncionario').Value  := FuncionarioCaixaPDV.id;
          ExecSQL;
         end;
      end;

      //3. INSERT DADOS DA VENDA TBM NA TABELA MOVIMENTACOES.
      with dm.FDQueryMovimentos do begin
        Close;
        SQL.Clear;
        SQL.Add('INSERT INTO movimentacoes (tipo, movimento, valor, funcionario, data, movimento_id)');
        SQL.Add('VALUES (:pTipo, :pMovimento, :pValor, :pFuncionario, curDate(), :pMovimento_id)');     //curDate() é um função do própio mySQL para salvar a data atual do servidor.
        ParamByName('pTipo').Value               := GetEnumName(TypeInfo(TEnumTipoMovimento),integer(Entrada));  //Para fazer uso do recurso "enumerações em delphi".
        ParamByName('pMovimento').Value          := 'Venda';
        ParamByName('pValor').AsCurrency         := VendaPDV.totalCompras;
        ParamByName('pFuncionario').Value        := FuncionarioCaixaPDV.id;
        ParamByName('pMovimento_id').Value       := idVendas_pdv_c;  //Neste caso é o ID da VENDA.
        ExecSQL;
      end;
      showmessage('Status da Venda: Concluida!');
      limparGeral;
    except on E: Exception do
      AvisoErro(pchar('Erro ao finalizar a venda: '+e.Message));
    end;

  finally
    dm.FDQueryVendasC.Close;
    dm.FDQueryMovimentos.Close;
  end;
end;

procedure Tfrm_vendasPDV.ExibeImgProduto(DataSet: TDataSet;  BlobFieldName: String; ImageExibicao: TImage);
const
  OffsetMemoryStream : Int64 = 0;
var
  MemoryStream:TMemoryStream;   //img no banco esta binario (codificada), o memory stream ajuda a decodificar essa img.
  jpg : TPicture;
begin
  if not(DataSet.IsEmpty) and not((DataSet.FieldByName(BlobFieldName) as TBlobField).IsNull) then begin
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TPicture.Create;
      (DataSet.FieldByName(BlobFieldName) as
      TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageExibicao.Picture.Assign(Jpg);
    finally
      MemoryStream.Free; // Jpg.Free;
    end
  end else begin
    ImageExibicao.Picture := Nil;
  end;
end;

procedure Tfrm_vendasPDV.FormActivate(Sender: TObject);
begin
  listarDetalhesVenda;
  vendaPDV.subtotal    := vendaPDV.subtotal - ItemExcluidoPDV.total;     //deve ser retirado do 'total da venda' o 'total do item' que foi excluido.
  edt_subTotal.Text    := formatFloat('R$ #,,,,0.00',vendaPDV.subtotal); //Atualiza o edt_subtotal com o novo valor considerado.
  edt_totalCompra.Text := formatFloat('R$ #,,,,0.00',vendaPDV.subtotal);
end;

procedure Tfrm_vendasPDV.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
  //ESC - abre Form de Cancelamento do Item.
  if key = VK_ESCAPE then begin
    frm__cancelaItemPDV := Tfrm__cancelaItemPDV.Create(self);
    frm__cancelaItemPDV.Show;
  end;
  //F1 - vai para o desconto.
  If key = VK_F1 then Begin
    edt_desconto.Text := '0';
    edt_desconto.SetFocus;
  end;
end;

procedure Tfrm_vendasPDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada é a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure Tfrm_vendasPDV.FormShow(Sender: TObject);
begin
  limparProdutos;
  limparImagemProduto;
  edt_codigoBarra.SetFocus;

end;

procedure Tfrm_vendasPDV.limparGeral;
begin
 //Painel Central PDV.
 edt_codigoBarra.Text   := '';
 edt_produto.Text       := '';
 edt_precoUnitario.Text := '0';
 edt_qtde.Text          := '1';
 edt_estoque.Text       := '';
 //Painel Direita PDV.
 edt_totalDoItem.Text   := '0';
 edt_subTotal.Text      := '0';
 edt_totalCompra.Text   := '0';
 edt_desconto.Text      := '0';
 edt_troco.Text         := '0';
 edt_valorRecebido.Text := '0';
 //Painel img Produto.
 limparImagemProduto;

 edt_codigoBarra.SetFocus;
end;

procedure Tfrm_vendasPDV.limparImagemProduto;
begin
   img_quadro.Picture.LoadFromFile(ExtractFileDir(GetCurrentDir)+'\Debug\img\semfoto.jpg');
end;

procedure Tfrm_vendasPDV.limparProdutos;
begin
 //Painel Central PDV.
 edt_produto.Text                    := '';
 edt_precoUnitario.Text              := '0';
 edt_qtde.Text                       := '1';
 edt_estoque.Text                    := '';
 vendaPDV.totalItens                 := 0;
 VendaItemProdutoPDV.idProduto       := '0';
 VendaItemProdutoPDV.nomeProduto     := '';
 VendaItemProdutoPDV.estoqueProduto  := 0;
 VendaItemProdutoPDV.qtdeEstoqueItemVendido := 0;
 limparImagemProduto;
end;

procedure Tfrm_vendasPDV.listarDetalhesVenda;
begin
  with dm.FDQueryVendasD do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM vendas_pdv_d WHERE vendas_id = :pVendaId and funcionaro_id = :pFuncionarioId order by id asc ');
    ParamByName('pVendaId').Value     := '0';     //Ainda nao fechou a venda.
    ParamByName('pFuncionarioId').Value := FuncionarioCaixaPDV.id;  //var global in DM.pas
    Open();
  end;
  db_VendasPDV.Columns[0].Alignment := taCenter; //dados coluna id do item alinhado no centro.
end;

procedure Tfrm_vendasPDV.salvarItens;
            procedure atualizaEstoquePosCompraPorItem;
            var
              EstoqueAtualProdutoBD, NewEstoque: integer;
            begin
              //1. Get Qtde Estoque Total no BD - PRODUTO.
              with dm.FDQuery_produtos do begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT estoque FROM produtos WHERE id = :pIdProduto');
                ParamByName('pIdProduto').Value := VendaItemProdutoPDV.idProduto;
                Open();
                EstoqueAtualProdutoBD := dm.FDQuery_produtos.FieldByName('estoque').Value;
              end;
              NewEstoque := EstoqueAtualProdutoBD - VendaItemProdutoPDV.qtdeEstoqueItemVendido;  //diminui o estoque com a qtde da exclusão da compra.
              //2. Atualiza estoque produtos
              with dm.FDQuery_produtos do begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE produtos SET estoque = :pEstoque WHERE id = :pId');
                ParamByName('pEstoque').Value    := NewEstoque;
                ParamByName('pId').Value := VendaItemProdutoPDV.idProduto;
                ExecSQL;
              end;
              edt_estoque.Text :=  intToStr(NewEstoque);
            end;

var
  totalItem:string;
begin
  edt_qtde.Enabled := true;
  totalItem := GetStrNumber(edt_totalDoItem.Text); //Só numeros

   with dm.FDQueryVendasD do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO vendas_pdv_d (vendas_id, produto, valor, quantidade, total, produto_id, funcionaro_id )');
    SQL.Add(' VALUES (:pVendas_id, :pProduto, :pValor, :pQuantidade, :pTotal, :pProduto_id, :pFuncionario_id)');
    ParamByName('pVendas_id').Value         := '0';
    ParamByName('pProduto').Value           := edt_produto.Text;
    ParamByName('pValor').AsCurrency        := strtocurr(edt_precoUnitario.Text);
    ParamByName('pQuantidade').Value        := edt_qtde.Text;
    ParamByName('pTotal').AsCurrency        := StrToCurr(totalItem);
    ParamByName('pProduto_id').Value        := VendaItemProdutoPDV.idProduto;
    ParamByName('pFuncionario_id').Value    := FuncionarioCaixaPDV.Id;
    ExecSQL;
  end;

  atualizaEstoquePosCompraPorItem;
  edt_qtde.Text := '1';
  edt_codigoBarra.SetFocus;
  //limparProdutos;
end;

procedure Tfrm_vendasPDV.salvarVenda;
begin

end;

end.
