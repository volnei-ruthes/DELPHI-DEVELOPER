unit u_gastos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ComCtrls;

type
  Tfrm_gastos = class(TForm)
    btn_novo: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    Label2: TLabel;
    btn_cancelar: TSpeedButton;
    dbGastos: TDBGrid;
    edt_motivo: TEdit;
    Label1: TLabel;
    edt_valor: TEdit;
    DataBuscar: TDateTimePicker;
    Label3: TLabel;
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure dbGastosCellClick(Column: TColumn);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataBuscarChange(Sender: TObject);
  private
    { Private declarations }
    procedure listarGastos;
    procedure configuraBtnCancelar;
    procedure buscarPorData;
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

  TGastos = record
    id: string;
    motivo: string;
    valor: currency;
    data: TDate;
  end;

var
  frm_gastos: Tfrm_gastos;
  Gasto : TGastos;


implementation

{$R *.dfm}

uses u_dm, u_geralHelper, TypInfo;

{ TAviso }

procedure TAviso.Aviso(pMsg: PWideChar);
begin
  Application.MessageBox(pMsg,'Informação',MB_OK + MB_ICONINFORMATION)
end;

procedure TAviso.AvisoAlerta(pMsg:PWideChar);
begin
   Application.MessageBox(pMsg,'Alerta!',MB_OK + MB_ICONWARNING)
end;

procedure TAviso.AvisoErro(pMsg:PWideChar);
begin
   Application.MessageBox(pMsg,'Erro!',MB_OK + MB_ICONERROR);
end;

{ Tfrm_gastos }

procedure Tfrm_gastos.btn_cancelarClick(Sender: TObject);
begin
  listarGastos;
  configuraBtnCancelar;
  edt_motivo.SetFocus;
end;

procedure Tfrm_gastos.btn_editarClick(Sender: TObject);
begin
  with dm.FDQueryGastos do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE gastos SET motivo=:pMotivo, valor=:pValor, funcionario_id=:pFuncionario_Id, data=:pData');
    SQL.Add('WHERE id='+user.funcionarioId);
    ParamByName('pMotivo').Value         := edt_motivo.Text;
    ParamByName('pValor').AsCurrency     := StrToCurr(edt_valor.Text);
    ParamByName('pFuncionario_Id').Value := user.funcionarioId;
    ParamByName('pData').AsDate          := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;
  Aviso('Registro editado com sucesso!');
  listarGastos;
end;

procedure Tfrm_gastos.btn_excluirClick(Sender: TObject);
var
  valor:string;
begin
   valor := FormatFloat('R$ #,,,,0.00', gasto.valor);
   if MessageDlg('Deseja excluir o registro '+gasto.id+' com valor de: R$ '+valor+'?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
     //1. Deleta da tabela Gastos.
     with dm.FDQueryGastos do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM gastos');
       SQL.Add('WHERE id='+Gasto.id);
       ExecSQL;
     end;
     //2. Se deleta o Gasto, deleta tbm na tabela movimentações.
     with dm.FDQueryMovimentos do begin
       Close;
       SQL.Clear;
       SQL.Add('DELETE FROM movimentacoes');
       SQL.Add('WHERE movimento_id = '+Gasto.id);
       ExecSQL;
     end;
     Aviso('Registro excluido com sucesso!');
     btn_excluir.Enabled := false;
     listarGastos;
   end;
end;

procedure Tfrm_gastos.btn_novoClick(Sender: TObject);
begin
  //configura botões:
  btn_salvar.Visible:=true;
  edt_motivo.Clear;
  edt_motivo.Enabled:=true;
  edt_motivo.SetFocus;
  edt_valor.Clear;
  edt_valor.Enabled:=true;
end;

procedure Tfrm_gastos.btn_salvarClick(Sender: TObject);
begin
  Gasto.valor :=  StrToCurr(edt_valor.Text);
  //1. INSERT DADOS NA TABELA DE GASTOS.
  with dm.FDQueryGastos do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO gastos (motivo, valor, funcionario_id, data)');
    SQL.Add('VALUES (:pMotivo, :pValor, :pFuncionario_Id, curDate())');
    ParamByName('pMotivo').Value         := edt_motivo.Text;
    ParamByName('pValor').AsCurrency     := Gasto.valor;
    ParamByName('pFuncionario_Id').Value := User.funcionarioId;
    //ParamByName('datacadastro').AsDate := StrToDate(FormatDateTime('dd/mm/yyyy',Now));
    ExecSQL;
  end;

  //GET ID ULTIMO GASTO INSERIDO.
  with dm.FDQueryGastos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT id FROM gastos WHERE funcionario_id = :pFuncionario_id ORDER BY id desc LIMIT 1');
    ParamByName('pFuncionario_id').Value  := user.funcionarioId;
    Open();
  end;
  Gasto.id := dm.FDQueryGastos['id'];

  //2. INSERT DADOS TBM NA TABELA MOVIMENTACOES.
  with dm.FDQueryMovimentos do begin
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO movimentacoes (tipo, movimento, valor, funcionario, data, movimento_id)');
    SQL.Add('VALUES (:pTipo, :pMovimento, :pValor, :pFuncionario, curDate(), :pMovimento_id)');     //curDate() é um função do própio mySQL para salvar a data atual do servidor.
    ParamByName('pTipo').Value               := GetEnumName(TypeInfo(TEnumTipoMovimento),integer(Entrada));  //Para fazer uso do recurso "enumerações em delphi".
    ParamByName('pMovimento').Value          := 'Gasto';
    ParamByName('pValor').AsCurrency         := Gasto.valor;
    ParamByName('pFuncionario').Value        := User.funcionarioId;
    ParamByName('pMovimento_id').Value       := Gasto.id;  //Neste caso é o ID do GASTO.
    ExecSQL;
  end;
  Aviso('Registro salvo com sucesso!');
  listarGastos;
  btn_salvar.Visible  := false;
  btn_excluir.Visible := false;
  edt_motivo.Enabled  := false;
  edt_valor.Enabled   := false;
end;

procedure Tfrm_gastos.buscarPorData;
begin
   with dm.FDQueryGastos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT gastos.id as id, motivo, valor, data, nome as funcionario FROM gastos ');
    SQL.Add('INNER JOIN funcionarios ON funcionarios.id = gastos.funcionario_id');
    SQL.Add('WHERE data = :pData ORDER BY data ASC');
    ParamByName('pData').Value := FormatDateTime('yyyy/mm/dd',DataBuscar.Date);
    Open();
  end;
  TFloatField( dm.FDQueryGastos.FieldByName('valor') ).DisplayFormat := 'R$ #,,,,0.00';
end;

procedure Tfrm_gastos.configuraBtnCancelar;
begin
  btn_salvar.Visible  := false;
  btn_excluir.Visible := false;
  edt_motivo.Enabled  := false;
  edt_valor.Enabled   := false;
end;

procedure Tfrm_gastos.DataBuscarChange(Sender: TObject);
begin
  buscarPorData;
end;

procedure Tfrm_gastos.dbGastosCellClick(Column: TColumn);
begin
  //1. habilita componentes.
  btn_excluir.Visible := true;
  edt_motivo.Enabled  := true;
  edt_valor.Enabled   := true;
  //2. carrega componentes.
  if not(dm.FDQueryGastos.FieldByName('id').Value = null) then begin
    edt_motivo.Text      := dm.FDQueryGastos.FieldByName('motivo').Value;
    edt_valor.Text       := dm.FDQueryGastos.FieldByName('valor').Value;
  end;
  //3. Carrega var global para fins de deleção.
  Gasto.id    := dm.FDQueryGastos.FieldByName('id').Value;
  Gasto.valor := dm.FDQueryGastos.FieldByName('valor').Value;
end;

procedure Tfrm_gastos.FormShow(Sender: TObject);
begin
  DataBuscar.Date := Date;
  listarGastos;
end;

procedure Tfrm_gastos.listarGastos;
begin
  with dm.FDQueryGastos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT gastos.id as id, motivo, valor, data, nome as funcionario FROM gastos ');
    SQL.Add('INNER JOIN funcionarios ON funcionarios.id = gastos.funcionario_id');
    SQL.Add('ORDER BY data ASC');
    Open();
  end;
  TFloatField( dm.FDQueryGastos.FieldByName('valor') ).DisplayFormat := 'R$ #,,,,0.00';
end;

end.
