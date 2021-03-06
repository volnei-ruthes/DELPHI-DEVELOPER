unit u_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TConfigBotoes = (tpInserir, tpEditar, tpSalvar, tpCancelar);

  Tfrm_clientes = class(TForm)
    PageControl1: TPageControl;
    tb_cadastro: TTabSheet;
    tb_consulta: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btn_inserir: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_fechar: TSpeedButton;
    btn_localizar: TSpeedButton;
    lbl_message: TLabel;
    dbedt_id: TDBEdit;
    dbedt_nome: TDBEdit;
    dbedt_endereco: TDBEdit;
    dbedt_bairro: TDBEdit;
    dbedt_cidade: TDBEdit;
    dbcb_uf: TDBComboBox;
    dbedt_rg: TDBEdit;
    dbedt_cpf: TDBEdit;
    dbedt_fone: TDBEdit;
    dbedt_email: TDBEdit;
    dbedt_nascimento: TDBEdit;
    dbcb_situacao: TDBComboBox;
    btn_voltar: TButton;
    DBGrid1: TDBGrid;
    btn_imprimir: TButton;
    btn_pesquisar: TButton;
    edt_pesquisar: TEdit;
    lbl_pesquisar: TLabel;
    rg_opcoes: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    lbl_Contador: TLabel;
    edt_impressao: TEdit;
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
    procedure btn_voltarClick(Sender: TObject);
    procedure rg_opcoesClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure edt_pesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_imprimirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure BotoesCrud(pTipo: TConfigBotoes);
    procedure RecordCountBD;
    procedure RefreshTableCliente;
  public
    { Public declarations }
  end;

var
  frm_clientes: Tfrm_clientes;
  idCliente:string;

implementation

{$R *.dfm}

uses u_dm;

procedure Tfrm_clientes.BotoesCrud(pTipo: TConfigBotoes);
begin
 {$REGION 'Habilita/Desabilita Bot?es'}
  if (pTipo in ([tpInserir .. tpCancelar])) then
  begin
    // verifica se a tabela esta em modo [dsbrowse] que gera POST: inserir, editar e excluir. Obs: add in USES Data.DB;
    btn_inserir.Enabled := dm.tb_clientes.State in [dsbrowse];
    btn_editar.Enabled := dm.tb_clientes.State in [dsbrowse];
    btn_excluir.Enabled := dm.tb_clientes.State in [dsbrowse];
    // verifica se a tabela esta em modo [dsinsert, dsedit]
    btn_salvar.Enabled := dm.tb_clientes.State in [dsinsert, dsEdit];
    btn_cancelar.Enabled := dm.tb_clientes.State in [dsinsert, dsEdit];
  end;

 {$ENDREGION}
end;

procedure Tfrm_clientes.btn_cancelarClick(Sender: TObject);
begin
{$REGION 'Modo DM Cancelar'}
  dm.tb_clientes.Cancel;
  BotoesCrud(tpCancelar);
{$ENDREGION}
end;

procedure Tfrm_clientes.btn_editarClick(Sender: TObject);
begin
{$REGION 'Modo DM Edi??o'}
  //dm.FDConnection1.Connected := true; //as vezes os servidores em n?vens fecham a conex?o para gerenciar a escalabilidade.
  dm.tb_clientes.Edit;
  BotoesCrud(tpEditar);
{$ENDREGION}
end;

procedure Tfrm_clientes.btn_excluirClick(Sender: TObject);
begin
  case Application.MessageBox('Deseja o excluir o cadastro?',
    'Exclus?o de Cadastro', mb_YesNo + MB_ICONQUESTION) of
    IDYES:
      begin
        dm.FDQuery_Cons_Cliente.close;
        dm.FDQuery_Cons_Cliente.SQL.Clear;
        dm.FDQuery_Cons_Cliente.SQL.Add('SELECT * FROM clientes');
        dm.FDQuery_Cons_Cliente.SQL.Add('WHERE clie_id = :codigo');
        dm.FDQuery_Cons_Cliente.ParamByName('codigo').Value := dbedt_id.Text;
        dm.FDQuery_Cons_Cliente.Open;
        dm.FDQuery_Cons_Cliente.Delete;
        ShowMessage('Cliente deletado com sucesso!');
      end;

    IDNO:
      begin
        exit;
      end;
  end;
end;

procedure Tfrm_clientes.btn_fecharClick(Sender: TObject);
begin
  if dm.tb_clientes.State in [dsinsert, dsEdit] then
  begin
    ShowMessage('Salve ou Cancele o registro antes de fechar!');
    exit;
  end
  else
  begin
    close;
  end;

end;

procedure Tfrm_clientes.btn_imprimirClick(Sender: TObject);
begin
{$REGION 'Relat?rio CLIENTE'}
  with dm.FDQuery_ImprimeCliente do
  begin
    close;
    SQL.Clear;

    if edt_impressao.Text = '' then
    begin // imprime todos os clientes
      SQL.Add('SELECT * FROM clientes');

    end
    else
    begin
      SQL.Add('SELECT * FROM clientes WHERE clie_id = :codigo');
      // imprime so o selecionado
      ParamByName('codigo').Value := strtoint(edt_impressao.Text);
    end;

    Open();

    // Seta o Relat?rio e mostra. (obs. no DBGrid1CellClick ativei o bot?o imprimir).
    dm.rpt_Cliente.LoadFromFile(GetCurrentDir + '\rel\rel_cliente.fr3');
    dm.rpt_Cliente.ShowReport();
  end;

{$ENDREGION}
end;

procedure Tfrm_clientes.btn_inserirClick(Sender: TObject);
begin

{$REGION 'Modo DM Inser??o'}
  //dm.FDConnection1.Connected := true; //as vezes os servidores em n?vens fecham a conex?o para gerenciar a escalabilidade.
  dm.tb_clientes.Active := true;
  dm.tb_clientes.Insert;
  dm.tb_clientesclie_dtcad.Value := Date;
  // joga a data de cadastro direto no campo tabela.
{$ENDREGION}

{$REGION 'Habilita/Desabilita Bot?es'}
  BotoesCrud(tpInserir);
{$ENDREGION}

end;

procedure Tfrm_clientes.btn_localizarClick(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
  tb_consulta.TabVisible := true;
  tb_cadastro.TabVisible := false;
  // deixa o grid carregado com todos os clientes por padr?o.
  RefreshTableCliente;
  dm.FDQuery_Cons_Cliente.Refresh;
  RecordCountBD;
end;

procedure Tfrm_clientes.RefreshTableCliente;
begin
  dm.FDQuery_Cons_Cliente.close;
  dm.FDQuery_Cons_Cliente.SQL.Clear;
  dm.FDQuery_Cons_Cliente.SQL.Add('SELECT * FROM clientes');
  dm.FDQuery_Cons_Cliente.Open;
end;


procedure Tfrm_clientes.btn_pesquisarClick(Sender: TObject);
begin

  if not(rg_opcoes.ItemIndex = 4) and (edt_pesquisar.Text = '') then
  begin
    ShowMessage('? necessario digitar um valor para busca!');
    edt_pesquisar.SetFocus;
    exit;
  end;

{$REGION 'SQL - Pesquisar'}
  with dm.FDQuery_Cons_Cliente do
  begin
    close;
    SQL.Clear;
    SQL.Add('SELECT * FROM clientes');

    case rg_opcoes.ItemIndex of
      0:
        begin // c?digo
          SQL.Add('WHERE clie_id = :codigo');
          // :codigo ? um apelido/par?metro/var.
          ParamByName('codigo').Value := edt_pesquisar.Text;
          // par?metro codigo ? o que vir? de edt_pesquisar.
        end;
      1:
        begin // nome
          SQL.Add('WHERE clie_nome LIKE :nome');
          // para strings de busca recomenda-se o LIKE %string%.
          ParamByName('nome').Value := '%' + edt_pesquisar.Text + '%';
        end;
      2:
        begin
          SQL.Add('WHERE clie_rg = :rg');
          ParamByName('rg').Value := edt_pesquisar.Text;
        end;
      3:
        begin
          SQL.Add('WHERE clie_cpf = :cpf');
          ParamByName('cpf').Value := edt_pesquisar.Text;
        end;
      4:
        begin
          SQL.Add('WHERE clie_dtnasc = :dtnasc');
          ParamByName('dtnasc').AsDate :=
            StrToDate(FormatDateTime('dd/mm/yyyy', DateTimePicker1.Date));
        end;
    end;

    Open;

    RecordCountBD;

    btn_imprimir.Enabled := (RecordCount > 0);

  end;

{$ENDREGION}
end;

procedure Tfrm_clientes.btn_salvarClick(Sender: TObject);
begin
{$REGION 'Modo DM Salvar'}
  //dm.FDConnection1.Connected := true; //as vezes os servidores em n?vens fecham a conex?o para gerenciar a escalabilidade.
  dm.tb_clientes.Post;
  BotoesCrud(tpSalvar);
  ShowMessage('Cadastro salvo com sucesso!');
{$ENDREGION}
end;

procedure Tfrm_clientes.btn_voltarClick(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
  tb_consulta.TabVisible := false;
  tb_cadastro.TabVisible := true;
end;

procedure Tfrm_clientes.DBGrid1CellClick(Column: TColumn);
begin
  edt_impressao.Text := inttostr(dm.FDQuery_Cons_Clienteclie_id.Value);
end;

procedure Tfrm_clientes.DBGrid1DblClick(Sender: TObject);
begin
  //volta para outra tela para editar
  PageControl1.TabIndex := 0;
  tb_cadastro.TabVisible := true;
  btn_editar.Click;
  //preenche edts
  dbedt_id.Text        := inttostr(dm.FDQuery_Cons_Clienteclie_id.Value);
  dbedt_nome.Text      := dm.FDQuery_Cons_Clienteclie_nome.Value;
  dbedt_endereco.Text  := dm.FDQuery_Cons_Clienteclie_endereco.Value;
  dbedt_bairro.Text    := dm.FDQuery_Cons_Clienteclie_bairro.Value;
  dbedt_cidade.Text    := dm.FDQuery_Cons_Clienteclie_cidade.Value;
  dbedt_rg.Text        := dm.FDQuery_Cons_Clienteclie_rg.Value;
  dbedt_cpf.Text       := dm.FDQuery_Cons_Clienteclie_cpf.Value;
  dbedt_fone.Text      := dm.FDQuery_Cons_Clienteclie_tel.Value;
  dbedt_email.Text     := dm.FDQuery_Cons_Clienteclie_email.Value;
  dbedt_nascimento.Text:= datetostr(dm.FDQuery_Cons_Clienteclie_dtnasc.Value);

end;

procedure Tfrm_clientes.edt_pesquisarKeyPress(Sender: TObject; var Key: Char);
begin
  case rg_opcoes.ItemIndex of
    0, 2 .. 3:
      begin
        if (Key in ['0' .. '9'] = false) and (word(Key) <> VK_BACK) then
        begin // se n?o for n?mero e barra de espa?o.
          ShowMessage('Somente permitido n?meros');
          Key := #0; // considera o ?ltimo caractere digitado invalido.
        end;
      end;
  end;
end;

procedure Tfrm_clientes.FormCreate(Sender: TObject);

begin
  PageControl1.TabIndex := 0;
  tb_consulta.TabVisible := false;

  btn_salvar.Enabled := false;
  btn_cancelar.Enabled := false;

  edt_pesquisar.Visible := false;
  lbl_pesquisar.Visible := false;
  DateTimePicker1.Visible := false;
  btn_pesquisar.Enabled := false;

end;

procedure Tfrm_clientes.RecordCountBD;
begin
  with dm.FDQuery_Cons_Cliente do
  begin
    if RecordCount = 0 then
    begin
      lbl_Contador.Caption := '';
      lbl_Contador.Caption := lbl_Contador.Caption +
        ' nenhum registro encontrado.';
    end
    else
    begin
      lbl_Contador.Caption := '';
      lbl_Contador.Caption := 'Total Registros: ' + inttostr(RecordCount) +
        ' encontrados.';
    end;
  end;
end;


procedure Tfrm_clientes.rg_opcoesClick(Sender: TObject);

{$REGION 'Opcoes de Consulta'}
  procedure rgOpcoesConfiguraTela(pIndex: integer);
  begin

    lbl_pesquisar.Visible := true;
    edt_pesquisar.Visible := (pIndex in [0 .. 3]);
    DateTimePicker1.Visible := not(pIndex in [0 .. 3]);
    btn_pesquisar.Enabled := (pIndex in [0 .. 4]);

    case pIndex of
      0:
        begin // C?digo.
          lbl_pesquisar.Caption := 'Digite o c?digo do Cliente:';
          edt_pesquisar.SetFocus;
        end;
      1:
        begin // Nome.
          lbl_pesquisar.Caption := 'Digite o nome do Cliente:';
          edt_pesquisar.SetFocus;
        end;
      2:
        begin // RG.
          lbl_pesquisar.Caption := 'Digite o RG do Cliente:';
          edt_pesquisar.SetFocus;
        end;
      3:
        begin // CPF
          lbl_pesquisar.Caption := 'Digite o CPF do Cliente:';
          edt_pesquisar.SetFocus;
        end;
      4:
        begin // Dt. Nasc.
          lbl_pesquisar.Caption := 'Digite a Data de Nascimento:';
        end;
    end;
  end;
{$ENDREGION}

begin
  rgOpcoesConfiguraTela(rg_opcoes.ItemIndex);
end;

end.
