unit u_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Buttons;

type
  Tfrm_login = class(TForm)
    Panel1: TPanel;
    imgfundo: TImage;
    pnl_login: TPanel;
    img_login: TImage;
    edt_loginUserName: TEdit;
    edt_loginPassword: TEdit;
    btn_loginEntrar: TSpeedButton;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btn_loginEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure centralizaPainelLogin;
    procedure login;
  public
    { Public declarations }
  end;

var
  frm_login: Tfrm_login;

implementation

{$R *.dfm}

uses u_menu, u_dm, u_geralHelper;

procedure Tfrm_login.btn_loginEntrarClick(Sender: TObject);
begin
  {if trim(edt_loginUserName.Text) = '' then begin
    MessageDlg('Preencha o usu?rio', mtWarning,mbOKCancel,0);
    edt_loginUserName.SetFocus;
    exit;
  end;
  if trim(edt_loginPassword.Text) = '' then begin
    MessageDlg('Preencha a senha', mtWarning,mbOKCancel,0);
    edt_loginUserName.SetFocus;
    exit;
  end;   }
  login;
end;

procedure Tfrm_login.centralizaPainelLogin;
begin
  //posicionar o panel login no centro do form.
  pnl_login.Top := (self.Height div 2) - pnl_login.Height div 2;
  pnl_login.Left := (self.Width div 2) - pnl_login.Width div 2;
end;

procedure Tfrm_login.FormCanResize(Sender: TObject; var NewWidth,  NewHeight: Integer; var Resize: Boolean);
begin
   //Ajusta Responsividade.
   centralizaPainelLogin; //OnCanResize executa sempre quando for dimensionado o form.
end;

procedure Tfrm_login.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //verifica se a tecla pressionada ? a tecla ENTER, conhecida como #13
  If key = #13 then Begin
    //se for, passa o foco para o pr?ximo campo, zerando o valor da vari?vel Key
    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure Tfrm_login.login;
begin
  //LOGIN
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

    User.usuario  := dm.FDQuery_Usuarios['usuario'];
    User.Password := dm.FDQuery_Usuarios['senha'];
    User.nivelUser    := dm.FDQuery_Usuarios['cargo'];
    User.funcionarioId  := dm.FDQuery_Usuarios['id_funcionario'];

  end;    }
  User.funcionarioId  := '1';
  frm_menu := Tfrm_menu.Create(frm_login);
  frm_menu.ShowModal;
end;

end.
