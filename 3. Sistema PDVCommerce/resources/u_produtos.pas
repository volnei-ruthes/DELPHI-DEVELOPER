unit u_produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ExtDlgs;



type

  Tfrm_produtos = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    btn_novo: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    Label6: TLabel;
    edt_buscar: TEdit;
    edt_nome: TEdit;
    edt_CodProd: TEdit;
    db_funcionarios: TDBGrid;
    edt_descricao: TEdit;
    edt_valorVenda: TEdit;
    Label3: TLabel;
    btn_addImgProduto: TSpeedButton;
    image_codBarra: TImage;
    Panel1: TPanel;
    img_quadro: TImage;
    btn_imprimir: TSpeedButton;
    rb_nome: TRadioButton;
    rb_codigo: TRadioButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btn_novoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure db_funcionariosCellClick(Column: TColumn);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure edt_CodProdChange(Sender: TObject);
    procedure edt_CodProdKeyPress(Sender: TObject; var Key: Char);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_buscarChange(Sender: TObject);
    procedure rb_nomeClick(Sender: TObject);
    procedure rb_codigoClick(Sender: TObject);
    procedure btn_addImgProdutoClick(Sender: TObject);
    procedure db_funcionariosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure inicializaTela;
    procedure listarProdutos;
    procedure buscarByNome;
    procedure limparCampos;
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
    procedure configuraBtnCancelar;
    procedure configurarBtnNovo;
    procedure geraCodigoBarra(pCodigo:string; Canvas:TCanvas);
    function  isCodigoJaCadastrado : boolean;
    procedure GetImgPadraoProduto;
    procedure ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);  //RECUPERAR FOTO DO BANCO
  public
    { Public declarations }
  end;

type
  //Aviso Sistema
  TAviso = class helper for TForm
    procedure AvisoAlerta(pMsg:PWideChar);
    procedure Aviso(pMsg:PWideChar);
  end;


var
  frm_produtos: Tfrm_produtos;
  idProdutos:string;
  imgProd:TPicture;
  pathImgProdPadrao:string;


implementation

{$R *.dfm}

uses u_dm, u_geralHelpers, u_imprimirCodBarras;

{ TAviso }

procedure TAviso.Aviso(pMsg: PWideChar);
begin
  Application.MessageBox(pMsg,'Informa??o',MB_OK + MB_ICONINFORMATION)
end;

procedure TAviso.AvisoAlerta(pMsg:PWideChar);
begin
   //MessageDlg(pMsg,mtWarning,mbOKCancel,0);
   Application.MessageBox(pMsg,'Alerta!',MB_OK + MB_ICONWARNING)
end;

{ Tfrm_produtos }

procedure Tfrm_produtos.btn_addImgProdutoClick(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then begin
    img_quadro.Picture.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

procedure Tfrm_produtos.btn_cancelarClick(Sender: TObject);
begin
  listarProdutos;
  configuraBtnCancelar;
  limparCampos;
  DesabilitarCampos;
end;

procedure Tfrm_produtos.btn_editarClick(Sender: TObject);
begin
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE produtos SET codigo=:codigo, nome=:nome, descricao=:descricao, valor=:valor, data=:datacadastro, imgproduto=:imgproduto');
    SQL.Add('WHERE id='+idProdutos);
    ParamByName('codigo').Value        := edt_CodProd.Text;
    ParamByName('nome').Value          := edt_nome.Text;
    ParamByName('descricao').Value     := edt_descricao.Text;
    ParamByName('valor').AsCurrency    := StrToCurr(edt_valorVenda.Text);
    ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
  end;
   //Seta a foto Produto
  try
    imgProd := TPicture.Create;
    if OpenPictureDialog1.FileName <> '' then begin
      imgProd.LoadFromFile(OpenPictureDialog1.FileName);
    end else begin
      imgProd.LoadFromFile(pathImgProdPadrao);
    end;
    DM.FDQuery_produtos.ParamByName('imgproduto').Assign(imgProd); //imagens blobs s?o "tipo" arquivos, ent?o deve se usar o Assign.
  finally
    imgProd.Free;
  end;
  dm.FDQuery_produtos.ExecSQL;

  Aviso('Registro editado com sucesso!');

  inicializaTela;
  listarProdutos;
end;

procedure Tfrm_produtos.btn_excluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
     with dm.FDQuery_produtos do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM produtos');
       SQL.Add('WHERE id='+idProdutos);
       ExecSQL;
     end;
     Aviso('Registro excluido com sucesso!');
     inicializaTela;
     listarProdutos;
   end;
end;

procedure Tfrm_produtos.btn_imprimirClick(Sender: TObject);
begin
  FrmImprimirCodBarras := TFrmImprimirCodBarras.Create(self);
  FrmImprimirCodBarras.ShowModal;
end;

procedure Tfrm_produtos.btn_novoClick(Sender: TObject);
begin
  configurarBtnNovo;
  btn_salvar.Visible        := true;
  btn_addImgProduto.Visible := true;
  HabilitarCampos;
  limparCampos;
  edt_CodProd.SetFocus;
  GetImgPadraoProduto;
end;

procedure Tfrm_produtos.btn_salvarClick(Sender: TObject);
begin
  if edt_CodProd.isVazio then begin
     AvisoAlerta(pChar('? necessario cadastrar o codigo do produto'));
     exit;
  end;
  if isCodigoJaCadastrado then begin
    edt_CodProd.SetFocus;
    exit;
  end;

  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO produtos (codigo, nome, descricao, valor, data, imgproduto )');
    SQL.Add(' VALUES (:codigo, :nome, :descricao, :valor, :data, :imgproduto)');
    ParamByName('codigo').Value     := edt_CodProd.Text;
    ParamByName('nome').Value       := edt_nome.Text;
    ParamByName('descricao').Value  := edt_descricao.Text;
    ParamByName('valor').AsCurrency := strtocurr(edt_valorVenda.Text);
    ParamByName('data').AsDate      := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
  end;
  //Seta a foto Produto
  try
    imgProd := TPicture.Create;
    if OpenPictureDialog1.FileName <> '' then begin
      imgProd.LoadFromFile(OpenPictureDialog1.FileName);
    end else begin
      imgProd.LoadFromFile(pathImgProdPadrao);
    end;
    DM.FDQuery_produtos.ParamByName('imgproduto').Assign(imgProd); //imagens blobs s?o "tipo" arquivos, ent?o deve se usar o Assign.
  finally
    imgProd.Free;
  end;
  dm.FDQuery_produtos.ExecSQL;

  Aviso('Registro salvo com sucesso!');
  inicializaTela;
  listarProdutos;
end;

procedure Tfrm_produtos.buscarByNome;
begin
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produtos WHERE lower(nome) LIKE ' + QuotedStr(LowerCase(trim(edt_buscar.Text+'%'))));
    Open();
  end;
end;

procedure Tfrm_produtos.configuraBtnCancelar;
begin
  btn_salvar.Visible   := false;
  btn_excluir.Visible  := false;
  btn_editar.Visible   := false;
  btn_imprimir.Visible := false;
end;

procedure Tfrm_produtos.configurarBtnNovo;
begin
  btn_excluir.Visible := false;
  btn_editar.Visible  := false;
end;

procedure Tfrm_produtos.db_funcionariosCellClick(Column: TColumn);
begin
  btn_editar.Visible        := true;
  btn_excluir.Visible       := true;
  btn_imprimir.Visible      := true;
  btn_addImgProduto.Visible := true;

  if not(dm.FDQuery_produtos.FieldByName('id').Value = null) then begin
    edt_nome.Text        := dm.FDQuery_produtos.FieldByName('nome').Value;
    edt_CodProd.Text     := dm.FDQuery_produtos.FieldByName('codigo').Value;
    edt_valorVenda.Text  := dm.FDQuery_produtos.FieldByName('valor').Value;
    edt_descricao.Text   := dm.FDQuery_produtos.FieldByName('descricao').Value;
    idProdutos           := dm.FDQuery_produtos.FieldByName('id').Value;
    codProdutos          := dm.FDQuery_produtos.FieldByName('codigo').Value;
  end;
  //Foto.
  if dm.FDQuery_produtos.FieldByName('imgproduto').Value <> null then begin
    ExibeFoto(dm.FDQuery_produtos,'imgproduto',img_quadro);  //3 parametros: 1.DataSet, 2. Campo do dataset, 3. Componente a ser exibido.
  end else begin
    GetImgPadraoProduto;
  end;
  HabilitarCampos;
end;

procedure Tfrm_produtos.db_funcionariosDblClick(Sender: TObject);
begin
  if (doc='EAQ') or (doc='ESP') then begin
    EntradaProdutos.idProduto      := dm.FDQuery_produtos.FieldByName('id').Value;
    EntradaProdutos.nomeProduto    := dm.FDQuery_produtos.FieldByName('nome').Value;
    EntradaProdutos.estoqueProduto := dm.FDQuery_produtos.FieldByName('estoque').Value;
    doc:='';
    close;
  end;
end;

procedure Tfrm_produtos.DesabilitarCampos;
begin
  edt_CodProd.enabled       := false;
  edt_nome.Enabled          := false;
  edt_valorVenda.Enabled    := false;
  edt_descricao.Enabled     := false;
  btn_addImgProduto.Visible := false;
end;

procedure Tfrm_produtos.edt_buscarChange(Sender: TObject);
var
  campo:string;
begin
   campo := if_s(rb_nome.Checked,'nome','codigo');
   with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM produtos WHERE lower('+campo+') LIKE ' + QuotedStr(LowerCase(trim(edt_buscar.Text+'%'))));
    Open();
  end;
end;

procedure Tfrm_produtos.edt_CodProdChange(Sender: TObject);
begin
  geraCodigoBarra(edt_CodProd.Text,image_codBarra.Canvas);
end;

procedure Tfrm_produtos.edt_CodProdKeyPress(Sender: TObject; var Key: Char);
begin
   if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then begin
    key := #0;
   end;
end;

{PROCEDIMENTO PADR?O PARA RECUPERAR FOTO DO BANCO}
procedure Tfrm_produtos.ExibeFoto(DataSet : TDataSet; BlobFieldName : String; ImageExibicao : TImage);
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

procedure Tfrm_produtos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   //verifica se a tecla pressionada ? a tecla ENTER, conhecida como #13
   If key = #13 then Begin
    //se for, passa o foco para o pr?ximo campo, zerando o valor da vari?vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure Tfrm_produtos.FormShow(Sender: TObject);
begin
  GetImgPadraoProduto;
  OpenPictureDialog1.FileName := '';
  pathImgProdPadrao := ExtractFileDir(GetCurrentDir)+'\Debug\img\semfoto.jpg';
  listarProdutos;
  DesabilitarCampos;
end;

procedure Tfrm_produtos.geraCodigoBarra(pCodigo: string; Canvas: TCanvas);
const
  digitos : array['0'..'9'] of string[5]= ('00110', '10001', '01001', '11000','00101', '10100', '01100', '00011', '10010', '01010');

var
  s : string;
  i, j, x, y, t : Integer;

begin
  // Gerar o valor para desenhar o c?digo de barras

  // Caracter de in?cio
  s := '0000';
  for i := 1 to length(pCodigo) div 2 do
    for j := 1 to 5 do
      s := s + Copy(Digitos[pCodigo[i * 2 - 1]], j, 1) + Copy(Digitos[pCodigo[i * 2]], j, 1);
  // Caracter de fim
  s := s + '100';

  // Desenhar em um objeto canvas
  // Configurar os par?metros de posi??o iniciais
  x := 10; //posi??o ini.
  y := 10; //posi??o ini.

  // Pintar o fundo do c?digo de branco
  Canvas.Brush.Color := clWhite;
  Canvas.Pen.Color := clWhite;
  Canvas.Rectangle(x,y, 500, 50);

  // Definir as cores da caneta
  Canvas.Brush.Color := clBlack;
  Canvas.Pen.Color := clBlack;

  // Escrever o c?digo de barras no canvas
  for i := 1 to length(s) do
  begin
    // Definir a espessura da barra
    t := strToInt(s[i]) * 2 + 1;
    // Imprimir apenas barra sim barra n?o (preto/branco - intercalado);
    if i mod 2 = 1 then
    Canvas.Rectangle(x, y, x + t, 50);
    // Passar para a pr?xima barra
    x := x + t;
  end;
end;

procedure Tfrm_produtos.HabilitarCampos;
begin
  edt_CodProd.enabled      := true;
  edt_nome.Enabled         := true;
  edt_valorVenda.Enabled   := true;
  edt_descricao.Enabled    := true;
  btn_addImgProduto.Visible:= true;
end;

procedure Tfrm_produtos.inicializaTela;
begin
  limparCampos;
  DesabilitarCampos;
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
  btn_imprimir.Visible:=false;
end;

function Tfrm_produtos.isCodigoJaCadastrado: boolean;
var
  codigo:string;
begin
  result:=false;
  //Verifica se o cargo j? est? cadastrado:
  with dm.FDQuery_produtos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT codigo FROM produtos WHERE lower(codigo) = ' + QuotedStr(LowerCase(trim(edt_CodProd.Text))));
    Open();

    if not(dm.FDQuery_produtos.IsEmpty) then  begin
      codigo := dm.FDQuery_produtos['codigo']; //ou dm.FDQuery_cargos.FieldByName('cargo').AsString;
      AvisoAlerta(Pchar('Campo '+codigo+' j? cadastrado!')); //Usei cast explicito de Pchar para evitar erro de PWidechar X String .
      result:=true;
    end;
  end;
end;

procedure Tfrm_produtos.limparCampos;
Var i : Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := '';
    end;
  end;
  image_codBarra.Picture := nil;
  OpenPictureDialog1.FileName := '';
  img_quadro.Picture := nil;
end;

procedure Tfrm_produtos.listarProdutos;
begin
  with dm.FDQuery_produtos do begin
    Close;
    SQL.clear;
    SQL.Add('SELECT * FROM produtos');
    Open();
  end;
  image_codBarra.Picture := nil;
end;

procedure Tfrm_produtos.GetImgPadraoProduto;
begin
  img_quadro.Picture.LoadFromFile(ExtractFileDir(GetCurrentDir)+'\Debug\img\semfoto.jpg');
end;

procedure Tfrm_produtos.rb_codigoClick(Sender: TObject);
begin
  edt_buscar.SetFocus;
end;

procedure Tfrm_produtos.rb_nomeClick(Sender: TObject);
begin
  edt_buscar.SetFocus;
end;


end.
