unit u_filtroRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls;

type
  Tfrm_filtroRelatorios = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dataInicial: TDateTimePicker;
    dataFinal: TDateTimePicker;
    btn_Relatorio: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    { Private declarations }
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
  frm_filtroRelatorios: Tfrm_filtroRelatorios;


implementation

{$R *.dfm}

uses u_geralHelper, u_dm;

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

procedure Tfrm_filtroRelatorios.btn_RelatorioClick(Sender: TObject);
begin
  if relatorioGeral.tipo = 'caixa' then begin


  end;
end;

procedure Tfrm_filtroRelatorios.FormShow(Sender: TObject);
begin
 dataInicial.Date := Date;
 dataFinal.Date   := Date;
end;

end.
