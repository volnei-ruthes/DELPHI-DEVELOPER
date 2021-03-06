unit u_funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  Tfrm_funcionarios = class(TForm)
    rb_nome: TRadioButton;
    rb_cpf: TRadioButton;
    edt_buscarNome: TEdit;
    edt_buscarCPF: TMaskEdit;
    Label1: TLabel;
    edt_nome: TEdit;
    Label2: TLabel;
    edt_endereco: TEdit;
    edt_cpf: TMaskEdit;
    Label3: TLabel;
    edtfone: TMaskEdit;
    Label4: TLabel;
    cb_cargo: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    db_funcionarios: TDBGrid;
    btn_novo: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_cancelar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure db_funcionariosCellClick(Column: TColumn);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure edt_buscarNomeChange(Sender: TObject);
    procedure edt_buscarCPFChange(Sender: TObject);
    procedure rb_nomeClick(Sender: TObject);
    procedure rb_cpfClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure db_funcionariosDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure inicializaTela;
    procedure listarFuncionarios;
    procedure carregarCombobox;
    procedure buscarByNome;
    procedure buscarByCPF;
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
  frm_funcionarios: Tfrm_funcionarios;

implementation

{$R *.dfm}

uses u_dm, u_geralHelpers;


var
  idFuncionario: string;

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

{ Tfrm_funcionarios }

procedure Tfrm_funcionarios.btn_novoClick(Sender: TObject);
begin
  HabilitarCampos;
  limparCampos;
  edt_nome.SetFocus;
  btn_salvar.Visible:=true;
  cb_cargo.Enabled:=true;
  carregarCombobox;
  configurarBtnNovo;
end;

procedure Tfrm_funcionarios.btn_salvarClick(Sender: TObject);
begin
  with dm.FDQuery_funcionarios do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO funcionarios (nome, cpf, fone, endereco, cargo, datacadastro)');
    SQL.Add(' VALUES (:nome, :cpf, :fone, :endereco, :cargo, :datacadastro)');
    ParamByName('nome').Value := edt_nome.Text;
    ParamByName('cpf').Value := edt_cpf.Text;
    ParamByName('fone').Value := edtfone.Text;
    ParamByName('endereco').Value := edt_endereco.Text;
    ParamByName('cargo').Value := cb_cargo.Items[cb_cargo.ItemIndex];
    ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  Aviso('Registro salvo com sucesso!');
  inicializaTela;
  listarFuncionarios;
end;

procedure Tfrm_funcionarios.buscarByCPF;
begin
   with dm.FDQuery_funcionarios do begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM funcionarios WHERE cpf = :cpf ');
      ParamByName('cpf').Value := edt_buscarCPF.Text;
      Open();
   end;
end;

procedure Tfrm_funcionarios.buscarByNome;
begin
  with dm.FDQuery_funcionarios do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM funcionarios WHERE lower(nome) LIKE ' + QuotedStr(LowerCase(trim(edt_buscarNome.Text+'%'))));
    Open();
  end;
end;

procedure Tfrm_funcionarios.carregarCombobox;
begin
  with dm.FDQuery_cargos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT cargo FROM cargos order by cargo asc');
    Open();
  end;
  if not(dm.FDQuery_cargos.IsEmpty) then begin
    while not(dm.FDQuery_cargos.Eof) do begin
      cb_cargo.Items.Add(dm.FDQuery_cargos.FieldByName('cargo').AsString);
      dm.FDQuery_cargos.Next;
    end;
  end;
end;

procedure Tfrm_funcionarios.configuraBtnCancelar;
begin
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure Tfrm_funcionarios.configurarBtnNovo;
begin
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure Tfrm_funcionarios.db_funcionariosCellClick(Column: TColumn);
begin
  btn_editar.Visible  := true;
  btn_excluir.Visible := true;
  cb_cargo.Enabled    := true;
  if not(dm.FDQuery_funcionarios.FieldByName('id').Value = null) then begin
    edt_nome.Text      := dm.FDQuery_funcionarios.FieldByName('nome').Value;
    edt_cpf.Text       := dm.FDQuery_funcionarios.FieldByName('cpf').Value;
    edtfone.Text       := dm.FDQuery_funcionarios.FieldByName('fone').Value;
    edt_endereco.Text  := dm.FDQuery_funcionarios.FieldByName('endereco').Value;
    //cb_cargo.Items.Add(dm.FDQuery_funcionarios.FieldByName('cargo').Value);
  end;
  idFuncionario:=dm.FDQuery_funcionarios.FieldByName('id').Value;
  HabilitarCampos;
  carregarCombobox;
end;

procedure Tfrm_funcionarios.db_funcionariosDblClick(Sender: TObject);
begin
  if doc='USU' then begin
    Funcionario.Id    := dm.FDQuery_funcionarios.FieldByName('id').Value;
    Funcionario.Nome  := dm.FDQuery_funcionarios.FieldByName('nome').Value;
    Funcionario.Cargo := dm.FDQuery_funcionarios.FieldByName('cargo').Value;
    doc:='';
    close;
  end;
end;

procedure Tfrm_funcionarios.DesabilitarCampos;
begin
  edt_nome.Enabled     := false;
  edt_endereco.Enabled := false;
  edt_cpf.Enabled      := false;
  edtfone.Enabled      := false;
  cb_cargo.Enabled     := false;
end;

procedure Tfrm_funcionarios.edt_buscarCPFChange(Sender: TObject);
begin
  buscarByCPF;
end;

procedure Tfrm_funcionarios.edt_buscarNomeChange(Sender: TObject);
begin
  buscarByNome;
end;

procedure Tfrm_funcionarios.FormCreate(Sender: TObject);
begin
 dm.FDTableCargos.Active := true;
 limparCampos;
 DesabilitarCampos;
 listarFuncionarios;
 carregarCombobox;
end;

procedure Tfrm_funcionarios.FormShow(Sender: TObject);
begin
   rb_nome.Checked:=true;
   with edt_buscarNome do begin
     Visible:=true;
     Enabled:=true;
     SetFocus;
   end;
   edt_buscarCPF.Visible:=false;
end;

procedure Tfrm_funcionarios.HabilitarCampos;
begin
  edt_nome.Enabled     := true;
  edt_endereco.Enabled := true;
  edt_cpf.Enabled      := true;
  edtfone.Enabled      := true;
  cb_cargo.Enabled     := true;
end;

procedure Tfrm_funcionarios.inicializaTela;
begin
  limparCampos;
  DesabilitarCampos;
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure Tfrm_funcionarios.limparCampos;
Var i : Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TEdit then begin
      TEdit(Components[i]).Text := '';
    end;
  end;
  cb_cargo.Clear;
  edt_cpf.Clear;
  edtfone.Clear;
end;

procedure Tfrm_funcionarios.listarFuncionarios;
begin
 with dm.FDQuery_funcionarios do begin
   Close;
   SQL.Clear;
   SQL.Add('SELECT * FROM funcionarios');
   Open();
 end;
end;

procedure Tfrm_funcionarios.rb_cpfClick(Sender: TObject);
begin
  listarFuncionarios;
  with edt_buscarCPF do begin
    Visible:=true;
    Enabled:=true;
    SetFocus;
  end;
  edt_buscarNome.visible:=false;
end;

procedure Tfrm_funcionarios.rb_nomeClick(Sender: TObject);
begin
 listarFuncionarios;
 with edt_buscarNome do begin
   Visible:=true;
   Enabled:=true;
   SetFocus;
 end;
 edt_buscarCPF.Visible:=false;
end;

procedure Tfrm_funcionarios.btn_cancelarClick(Sender: TObject);
begin
  listarFuncionarios;
  configuraBtnCancelar;
end;

procedure Tfrm_funcionarios.btn_editarClick(Sender: TObject);
begin
  with dm.FDQuery_funcionarios do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE funcionarios SET nome=:nome, cpf=:cpf, fone=:fone, endereco=:endereco, cargo=:cargo, datacadastro=:datacadastro');
    SQL.Add('WHERE id='+idFuncionario);
    ParamByName('nome').Value := edt_nome.Text;
    ParamByName('cpf').Value := edt_cpf.Text;
    ParamByName('fone').Value := edtfone.Text;
    ParamByName('endereco').Value := edt_endereco.Text;
    ParamByName('cargo').Value := cb_cargo.Items[cb_cargo.ItemIndex];
    ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  //Atualiza cargo tabela usu?rios
  with dm.FDQuery_Usuarios do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE usuarios SET cargo=:cargo');
    SQL.Add('WHERE id_funcionario='+idFuncionario);
    ParamByName('cargo').Value := cb_cargo.Items[cb_cargo.ItemIndex];
    ExecSQL;
  end;

  Aviso('Registro editado com sucesso!');

  inicializaTela;
  listarFuncionarios;
end;

procedure Tfrm_funcionarios.btn_excluirClick(Sender: TObject);
begin
   if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
     with dm.FDQuery_funcionarios do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM funcionarios');
       SQL.Add('WHERE id='+idFuncionario);
       ExecSQL;
     end;


      //Se deleta o funcionario Deleta tbm o cadastro de usu?rio.
      with dm.FDQuery_Usuarios do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM usuarios');
       SQL.Add('WHERE id_funcionario='+idFuncionario);
       ExecSQL;
     end;

     Aviso('Registro excluido com sucesso!');
     inicializaTela;
     listarFuncionarios;
   end;
end;

end.
