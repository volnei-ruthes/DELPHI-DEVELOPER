unit u_fornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons;

type
  TFrmFornecedores = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btn_novo: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    edt_buscarNome: TEdit;
    edt_nome: TEdit;
    edt_endereco: TEdit;
    edt_fone: TMaskEdit;
    db_funcionarios: TDBGrid;
    btn_cancelar: TSpeedButton;
    edt_produto: TEdit;
    Label6: TLabel;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure db_funcionariosCellClick(Column: TColumn);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure db_funcionariosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure inicializaTela;
    procedure listarFornecedores;
    procedure buscarByNome;
    procedure limparCampos;
    procedure HabilitarCampos;
    procedure DesabilitarCampos;
    procedure configuraBtnCancelar;
    procedure configurarBtnNovo;
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
  FrmFornecedores: TFrmFornecedores;
  idFornecedor:string;
implementation

{$R *.dfm}

uses u_dm, u_geralHelper;

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

{ TFrmFornecedores }

procedure TFrmFornecedores.btn_cancelarClick(Sender: TObject);
begin
  listarFornecedores;
  configuraBtnCancelar;
end;

procedure TFrmFornecedores.btn_editarClick(Sender: TObject);
begin
    with dm.FDQuery_fornecedores do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE fornecedores SET nome=:nome, produto=:produto, endereco=:endereco, fone=:fone, datacadastro=:datacadastro');
    SQL.Add('WHERE id='+idFornecedor);
    ParamByName('nome').Value := edt_nome.Text;
    ParamByName('produto').Value := edt_produto.Text;
    ParamByName('endereco').Value := edt_endereco.Text;
    ParamByName('fone').Value := edt_fone.Text;
    ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  Aviso('Registro editado com sucesso!');

  inicializaTela;
  listarFornecedores;
end;

procedure TFrmFornecedores.btn_excluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
     with dm.FDQuery_fornecedores do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM fornecedores');
       SQL.Add('WHERE id='+idFornecedor);
       ExecSQL;
     end;
     Aviso('Registro excluido com sucesso!');
     inicializaTela;
     listarFornecedores;
   end;
end;

procedure TFrmFornecedores.btn_novoClick(Sender: TObject);
begin
  HabilitarCampos;
  limparCampos;
  edt_nome.SetFocus;
  btn_salvar.Visible:=true;
  configurarBtnNovo;
end;

procedure TFrmFornecedores.btn_salvarClick(Sender: TObject);
begin
   with dm.FDQuery_fornecedores do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO fornecedores (nome, produto, endereco, fone, datacadastro)');
    SQL.Add(' VALUES (:nome, :produto, :endereco, :fone, :datacadastro)');
    ParamByName('nome').Value := edt_nome.Text;
    ParamByName('produto').Value := edt_produto.Text;
    ParamByName('endereco').Value := edt_endereco.Text;
    ParamByName('fone').Value := edt_fone.Text;
    ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;
  Aviso('Registro salvo com sucesso!');
  inicializaTela;
  listarFornecedores;
end;

procedure TFrmFornecedores.buscarByNome;
begin
   with dm.FDQuery_funcionarios do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM fornecedores WHERE lower(nome) LIKE ' + QuotedStr(LowerCase(trim(edt_buscarNome.Text+'%'))));
    Open();
  end;
end;

procedure TFrmFornecedores.configuraBtnCancelar;
begin
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure TFrmFornecedores.configurarBtnNovo;
begin
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure TFrmFornecedores.db_funcionariosCellClick(Column: TColumn);
begin
  btn_editar.Visible  := true;
  btn_excluir.Visible := true;
  if not(dm.FDQuery_fornecedores.FieldByName('id').Value = null) then begin
    edt_nome.Text      := dm.FDQuery_fornecedores.FieldByName('nome').Value;
    edt_produto.Text   := dm.FDQuery_fornecedores.FieldByName('produto').Value;
    edt_endereco.Text  := dm.FDQuery_fornecedores.FieldByName('endereco').Value;
    edt_fone.Text      := dm.FDQuery_fornecedores.FieldByName('fone').Value;
  end;
  idFornecedor:=dm.FDQuery_fornecedores.FieldByName('id').Value;
  HabilitarCampos;
end;

procedure TFrmFornecedores.db_funcionariosDblClick(Sender: TObject);
begin
  if doc='EAQ' then begin
    EntradaProdutos.idFornecedor   := dm.FDQuery_fornecedores.FieldByName('id').Value;
    EntradaProdutos.nomeFornecedor := dm.FDQuery_fornecedores.FieldByName('nome').Value;
    doc:='';
    close;
  end;
end;

procedure TFrmFornecedores.DesabilitarCampos;
begin
  edt_nome.Enabled     := false;
  edt_produto.Enabled  := false;
  edt_endereco.Enabled := false;
  edt_fone.Enabled      := false;
end;

procedure TFrmFornecedores.FormShow(Sender: TObject);
begin
  listarFornecedores;
end;

procedure TFrmFornecedores.HabilitarCampos;
begin
  edt_nome.Enabled      := true;
  edt_produto.Enabled   := true;
  edt_endereco.Enabled  := true;
  edt_fone.Enabled      := true;
end;

procedure TFrmFornecedores.inicializaTela;
begin
  limparCampos;
  DesabilitarCampos;
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure TFrmFornecedores.limparCampos;
Var i : Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := '';
    end;
  end;
  edt_fone.Clear;
end;

procedure TFrmFornecedores.listarFornecedores;
begin
  with dm.FDQuery_fornecedores do begin
    Close;
    SQL.clear;
    SQL.Add('SELECT * FROM fornecedores');
    Open();
  end;
end;

end.
