unit u_loginPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tfrm_loginPDV = class(TForm)
    pnl_login: TPanel;
    img_login: TImage;
    edt_loginUserName: TEdit;
    edt_loginPassword: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edt_loginPasswordExit(Sender: TObject);
  private
    { Private declarations }
    procedure loginPDV;
  public
    { Public declarations }
  end;

  //Aviso Sistema
  TAviso = class helper for TForm
    procedure AvisoAlerta(pMsg:PWideChar);
    procedure AvisoErro(pMsg:PWideChar);
    procedure Aviso(pMsg:PWideChar);
  end;

var
  frm_loginPDV: Tfrm_loginPDV;

implementation

{$R *.dfm}

uses u_geralHelper, u_dm, u_vendasPDV, u_caixa;

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

procedure TAviso.AvisoErro(pMsg:PWideChar);
begin
   Application.MessageBox(pMsg,'Erro!',MB_OK + MB_ICONERROR);
end;

procedure Tfrm_loginPDV.edt_loginPasswordExit(Sender: TObject);
begin
  loginPDV;
end;

procedure Tfrm_loginPDV.FormKeyPress(Sender: TObject; var Key: Char);
begin
   //verifica se a tecla pressionada ? a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o pr?ximo campo, zerando o valor da vari?vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure Tfrm_loginPDV.loginPDV;
begin
   //LOGIN PDV
 { if edt_loginUserName.isVazio then begin
    AvisoAlerta(Pchar('? necess?rio digitar um usu?rio!'));
    exit;
  end;

  if edt_loginPassword.isVazio then begin
    AvisoAlerta(Pchar('? necess?rio digitar uma senha!'));
    exit;
  end;

  with dm.FDQuery_Usuarios do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM usuarios WHERE usuario = :pUsuario');
    ParamByName('pUsuario').Value := edt_loginUserName.Text;
    Open();

    if not(dm.FDQuery_Usuarios['usuario'] = edt_loginUserName.Text) then  begin
      AvisoAlerta(Pchar('Usu?rio n?o confere com o cadastro!'));
      exit;
    end;
    if not(dm.FDQuery_Usuarios['senha'] = edt_loginPassword.Text) then  begin
      AvisoAlerta(Pchar('Senha n?o confere com cadastro!'));
      exit;
    end;

    User.Id            := dm.FDQuery_Usuarios['id'];
    User.usuario       := dm.FDQuery_Usuarios['usuario'];
    User.Password      := dm.FDQuery_Usuarios['senha'];
    User.nivelUser     := dm.FDQuery_Usuarios['cargo'];
    User.funcionarioId := dm.FDQuery_Usuarios['id_funcionario'];
  end;   }
  User.funcionarioId := '1'; //teste tela pdv vendas.
  FuncionarioCaixaPDV.Id := User.funcionarioId;
  //frm_vendasPDV := Tfrm_vendasPDV.Create(self);
  //frm_vendasPDV.ShowModal;
  frm_caixa := Tfrm_caixa.Create(self);
  frm_caixa.ShowModal;
  frm_loginPDV.Close;
end;

end.
