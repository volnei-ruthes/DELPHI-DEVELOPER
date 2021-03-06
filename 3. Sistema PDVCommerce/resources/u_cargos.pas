unit u_cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons;

type
  Tfrm_cargos = class(TForm)
    btn_novo: TSpeedButton;
    btn_editar: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_excluir: TSpeedButton;
    dbCargo: TDBGrid;
    edt_nome: TEdit;
    Label2: TLabel;
    btn_cancelar: TSpeedButton;
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbCargoCellClick(Column: TColumn);
    procedure btn_editarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure associaCampoBD;
    procedure listarCargos;
    procedure configuraBtnCancelar;
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
  frm_cargos: Tfrm_cargos;
  idCargo:string;

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

procedure Tfrm_cargos.associaCampoBD;
begin
  //associa o campo tabela com o edit.
  dm.FDTableCargos.FieldByName('cargo').Value := edt_nome.Text;
end;

procedure Tfrm_cargos.btn_editarClick(Sender: TObject);
var cargo:string;
begin

  if edt_nome.isVazio then begin
    AvisoAlerta('Campo Nome deve ser preenchido!');
    exit;
  end;

  with dm.FDQuery_cargos do begin
    Close;
    SQL.Clear;
    SQL.Add('UPDATE cargos SET cargo = :cargo WHERE id = :Codigo');
    ParamByName('cargo').Value := edt_nome.Text;
    ParamByName('Codigo').Value := idCargo;
    ExecSQL;
  end;

  Aviso(Pchar('Registro Editado com sucesso!'));

  listarCargos; //refresh SELECT *

  edt_nome.Clear;
  edt_nome.Enabled:=false;
  btn_salvar.Visible:=false;
  btn_editar.Visible:=false;
  btn_excluir.Visible:=false;
end;

procedure Tfrm_cargos.btn_excluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes,mbNo],0) = mrYes then begin
  with dm.FDQuery_cargos do begin
    Close;
    SQL.Clear;
    SQL.Add('DELETE FROM cargos WHERE id = :Codigo');
    ParamByName('Codigo').Value := strtoint(idCargo);
    ExecSQL;
  end;
  Aviso(Pchar('Registro Excluido com sucesso!'));

  listarCargos; //refresh SELECT *
  edt_nome.Clear;
  edt_nome.Enabled:=false;
  btn_salvar.Visible:=false;
  btn_editar.Visible:=false;
  btn_excluir.Visible:=false;
  end;

end;

procedure Tfrm_cargos.btn_novoClick(Sender: TObject);
begin
  //configura botões:
  btn_salvar.Visible:=true;
  edt_nome.Clear;
  edt_nome.Enabled:=true;
  edt_nome.SetFocus;
  btn_editar.Visible:=false;
  //configura table cargos no modo inserção.
  dm.FDTableCargos.Insert;
end;

procedure Tfrm_cargos.btn_salvarClick(Sender: TObject);
var cargo:string;
begin

  if edt_nome.isVazio then begin
    AvisoAlerta('Campo Nome deve ser preenchido!');
    exit;
  end;

  //Verifica se o cargo já está cadastrado:
  with dm.FDQuery_cargos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT cargo FROM cargos WHERE lower(cargo) = ' + QuotedStr(LowerCase(trim(edt_nome.Text))));
    Open();

    if not(dm.FDQuery_cargos.IsEmpty) then  begin
      cargo := dm.FDQuery_cargos['cargo']; //ou dm.FDQuery_cargos.FieldByName('cargo').AsString;
      AvisoAlerta(Pchar('Campo '+cargo+' já cadastrado!')); //Usei cast explicito de Pchar para evitar erro de PWidechar X String .
      exit;
    end;
  end;

  //Cadatra novo cargo.
  associaCampoBD;
  dm.FDTableCargos.Post;
  Aviso(Pchar('Registro salvo com sucesso!'));
  edt_nome.Clear;
  edt_nome.Enabled:=false;
  btn_salvar.Visible:=false;
  listarCargos; //refresh SELECT *
end;

procedure Tfrm_cargos.configuraBtnCancelar;
begin
  btn_salvar.Visible  :=false;
  btn_excluir.Visible :=false;
  btn_editar.Visible  :=false;
end;

procedure Tfrm_cargos.dbCargoCellClick(Column: TColumn);
begin
  //*Por ser pequeno o cadastro tabela carga, decidi fazer o DML direto na TableCargo,
  // porém para cadastros maiores, é bom fazer por QUERYs.

  //Ao clicar no grid, habilita edição/exclusão.
  edt_nome.Enabled    :=true;
  btn_editar.Visible  :=true;
  btn_excluir.Visible :=true;


  //deixa em modo edição.
  DM.FDTableCargos.Edit;
  if not(dm.FDQuery_cargos.FieldByName('cargo').Value = null) then begin
     edt_nome.Text := dm.FDQuery_cargos.FieldByName('cargo').Value;
     idCargo       := dm.FDQuery_cargos.FieldByName('id').Value;
  end;
end;

procedure Tfrm_cargos.FormCreate(Sender: TObject);
begin
  dm.FDTableCargos.Active:=true;
  listarCargos; //refresh SELECT *
end;

procedure Tfrm_cargos.listarCargos;
begin
   with dm.FDQuery_cargos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM cargos order by cargo asc ');
    Open();
  end;
end;

procedure Tfrm_cargos.btn_cancelarClick(Sender: TObject);
begin
  listarCargos;
  configuraBtnCancelar;
  edt_nome.SetFocus;
end;

end.
