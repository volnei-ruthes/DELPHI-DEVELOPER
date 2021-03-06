unit u_menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  Tfrm_menu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Estoque1: TMenuItem;
    Movimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    Sair1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedores1: TMenuItem;
    menu_usuarios: TMenuItem;
    menu_funcionarios: TMenuItem;
    menu_cargos: TMenuItem;
    EntradadeProdutosEAQ1: TMenuItem;
    SaidadeProdutosESP1: TMenuItem;
    EstoqueNivelBaixoENB1: TMenuItem;
    Vendas1: TMenuItem;
    Movimentaes1: TMenuItem;
    Gastos1: TMenuItem;
    Pagamentos1: TMenuItem;
    ConsultarVendas1: TMenuItem;
    CertificadoDigital1: TMenuItem;
    Sair2: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    procedure menu_usuariosClick(Sender: TObject);
    procedure menu_funcionariosClick(Sender: TObject);
    procedure menu_cargosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EntradadeProdutosEAQ1Click(Sender: TObject);
    procedure SaidadeProdutosESP1Click(Sender: TObject);
    procedure EstoqueNivelBaixoENB1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure Movimentaes1Click(Sender: TObject);
    procedure Gastos1Click(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
    procedure CertificadoDigital1Click(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
  private
    { Private declarations }
    function getNivelUser(pNivelUser:String): boolean;
  public
    { Public declarations }
  end;

var
  frm_menu: Tfrm_menu;

implementation

{$R *.dfm}

uses u_usuarios, u_funcionarios, u_cargos, u_dm, u_fornecedores, u_produtos,
  u_entradasProdutosEAQ, u_saidaProdutosESP, u_estoqueBaixo, u_vendasPDV,
  u_loginPDV, u_movimentacoes, u_gastos, u_listarVendas, u_certificadoDigital, ACBrUtil,
  u_fluxoCaixa;

procedure Tfrm_menu.menu_cargosClick(Sender: TObject);
begin
  frm_cargos := Tfrm_cargos.Create(self);
  frm_cargos.ShowModal;
end;

procedure Tfrm_menu.CertificadoDigital1Click(Sender: TObject);
var
  addNovaLinha: boolean;
  i: integer;
  serie, caminhoNFCE : string;

begin
  frm_certificadoDigital := Tfrm_certificadoDigital.Create(self);
  try
    //1. Set path padr?o dos schemas xsds.
    caminhoNFCE := ExtractFilePath(Application.ExeName) + 'nfe\';
    //1.1 Estou usando o componente ACBR na tela de vendaPDV.
    frm_vendasPDV.ACBrNFCe.Configuracoes.Arquivos.PathSchemas := caminhoNFCE;
    //1.1.2 Le e retorna uma lista de certificados instaladas no Windows.
    frm_vendasPDV.ACBrNFCe.SSL.LerCertificadosStore;

    //2. Formata a Grid de certificados no formulario de certificado digital.
    with frm_certificadoDigital.StringGridCertificados do begin
       //2.1 Configuro o GRID com 5 colunas.
       ColWidths[0] := 220;
       ColWidths[1] := 250;
       ColWidths[2] := 120;
       ColWidths[3] := 80;
       ColWidths[4] := 150;
       //2.2 Defino na primeira linha o nome de cada coluna.
       Cells[0,0] := 'Num S?rie';
       Cells[1,0] := 'Raz?o Social';
       Cells[2,0] := 'CNPJ';
       Cells[3,0] := 'Validade';
       Cells[4,0] := 'Certificadora';
    end;
    addNovaLinha   := true; //para uso em grid stringGridCertificados.
    certificadoDigital.certificadoDigNumSerie := '';
    //3. Varro a lista de certificado que o AcbrNfce retornou da maquina(1.1.2) na tela vendasPDV.
    for i := 0 to frm_vendasPDV.ACBrNFCe.SSL.ListaCertificados.Count -1 do begin
      //3.1 Para cada row da lista de certificado fa?a:
      with frm_vendasPDV.ACBrNFCe.SSL.ListaCertificados[i] do begin
        serie := NumeroSerie;
        //Para o GRID de certificado no formulario de certificado digital fa?a:
        with frm_certificadoDigital.StringGridCertificados do begin
          if addNovaLinha then begin
             RowCount := RowCount + 1; //incrementa nova linha
             //Por padr?o o StringGrid come?a na linha 2 (1 ? o cabe?alho), ent?o, ao ser incrementado iniciar? de fato na linha 3,
             //-- por isso diminui -1 para ficar correto, ou seja, inicio na linha 2).
             Cells[0, RowCount - 1] := NumeroSerie;
             Cells[1, RowCount - 1] := RazaoSocial;
             Cells[2, RowCount - 1] := CNPJ;
             Cells[3, RowCount - 1] := FormatDateBr(DataVenc); //Add in Uses: ACBrUtil
             Cells[4, RowCount - 1] := Certificadora;
             addNovaLinha := true;
          end;
        end;
      end;
    end;

    frm_certificadoDigital.ShowModal;

    //4. Ao selectionar a linha no grid e clicar ok, pega o n?mero de serie da coluna 0.
    if frm_certificadoDigital.ModalResult = mrOk then begin
      certificadoDigital.certificadoDigNumSerie := frm_certificadoDigital.StringGridCertificados.Cells[0, frm_certificadoDigital.StringGridCertificados.Row];
      //4.1 Passa o n?mero de Serie para o componente ACBRNfce em VendasPDV.
      frm_vendasPDV.ACBrNFCe.Configuracoes.Certificados.NumeroSerie := certificadoDigital.certificadoDigNumSerie;
    end;

    //5. Executa o Status de Servi?o do Certificado selecionado e mostra o n?mero do certificado e sua msg status.
    if not(certificadoDigital.certificadoDigNumSerie.IsEmpty) then begin
      frm_vendasPDV.ACBrNFCe.WebServices.StatusServico.Executar;
      ShowMessage('N?mero S?rie Certificado Digital: '+certificadoDigital.certificadoDigNumSerie);
      ShowMessage(frm_vendasPDV.ACBrNFCe.WebServices.StatusServico.Msg);
    end;

  finally
    frm_certificadoDigital.Free;
  end;
end;

procedure Tfrm_menu.ConsultarVendas1Click(Sender: TObject);
begin
  frm_ListarVendas := Tfrm_ListarVendas.Create(self);
  frm_listarVendas.ShowModal;
end;

procedure Tfrm_menu.EntradadeProdutosEAQ1Click(Sender: TObject);
begin
  frmEntradaProdutosEAQ := TfrmEntradaProdutosEAQ.Create(self);
  frmEntradaProdutosEAQ.ShowModal;
end;

procedure Tfrm_menu.EstoqueNivelBaixoENB1Click(Sender: TObject);
begin
  frmEstoqueBaixo := TfrmEstoqueBaixo.Create(self);
  frmEstoqueBaixo.ShowModal;
  doc:='ENB';
end;

procedure Tfrm_menu.FluxodeCaixa1Click(Sender: TObject);
begin
  frm_fluxoCaixa := Tfrm_fluxoCaixa.Create(self);
  frm_fluxoCaixa.ShowModal;
end;

procedure Tfrm_menu.FormShow(Sender: TObject);
begin
  //Restringe o acesso aos Menus se n?o for suporte ou gerente.
  if not(getNivelUser(user.nivelUser)) then begin
    menu_usuarios.Visible     :=false;
    menu_funcionarios.Visible :=false;
    menu_cargos.Visible       :=false;
  end;
end;

procedure Tfrm_menu.menu_funcionariosClick(Sender: TObject);
begin
  frm_funcionarios := Tfrm_funcionarios.Create(self);
  frm_funcionarios.ShowModal;
  doc:='FUNC';
end;

procedure Tfrm_menu.Fornecedores1Click(Sender: TObject);
begin
  FrmFornecedores := TFrmFornecedores.Create(self);
  FrmFornecedores.ShowModal;
end;

procedure Tfrm_menu.Gastos1Click(Sender: TObject);
begin
  frm_gastos := Tfrm_gastos.Create(self);
  frm_gastos.ShowModal;
end;

function Tfrm_menu.getNivelUser(pNivelUser: String): boolean;
const
   nivelAdms: array[0..1] of string = ('gerente','suporte');
var
  i:integer;
begin
  result:= true;  //deixar false e retirar os comentarios depois.
 { for I := Low(nivelAdms) to High(nivelAdms) do begin
    if lowercase(pNivelUser) = nivelAdms[I] then begin
      Result := True;
      Break;
    end;
  end;    }
end;

procedure Tfrm_menu.menu_usuariosClick(Sender: TObject);
begin
  frm_usuarios := Tfrm_usuarios.Create(self);
  frm_usuarios.ShowModal;
end;

procedure Tfrm_menu.Movimentaes1Click(Sender: TObject);
begin
  frm_movimentacoes := Tfrm_movimentacoes.Create(self);
  frm_movimentacoes.ShowModal;
end;

procedure Tfrm_menu.Produtos1Click(Sender: TObject);
begin
  frm_produtos := Tfrm_produtos.Create(self);
  frm_produtos.ShowModal;
end;

procedure Tfrm_menu.SaidadeProdutosESP1Click(Sender: TObject);
begin
  frmSaidaProdutoESP := TfrmSaidaProdutoESP.Create(self);
  frmSaidaProdutoESP.ShowModal;
end;

procedure Tfrm_menu.Vendas1Click(Sender: TObject);
begin
  frm_loginPDV := Tfrm_loginPDV.Create(self);
  frm_loginPDV.ShowModal;
end;

end.
