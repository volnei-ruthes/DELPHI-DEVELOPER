unit u_certificadoDigital;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids;

type
  Tfrm_certificadoDigital = class(TForm)
    StringGridCertificados: TStringGrid;
    Panel1: TPanel;
    BitBtnCancela: TBitBtn;
    BitBtnOk: TBitBtn;
    procedure StringGridCertificadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_certificadoDigital: Tfrm_certificadoDigital;

implementation

{$R *.dfm}

procedure Tfrm_certificadoDigital.StringGridCertificadosClick(Sender: TObject);
var
  LinhaSelecionada: string;
begin
  LinhaSelecionada := StringGridCertificados.Cells[0, StringGridCertificados.Row];
  if not(LinhaSelecionada.IsEmpty) then begin //OU... not(StringGridCertificados.Cells[0, StringGridCertificados.Row] = '')
    BitBtnOk.Visible := true;
  end else begin
    BitBtnOk.Visible := false;
  end;
end;

end.














{ Modelo de configura??o achado no github

  //certificado A1
  if configuracao_nf.CERTIFICADO_DIGITAL_MODELO = '1' then
  begin
    //se n?o tiver certificado
    if configuracao_nf.CERTIFICADO_DIGITAL_NOME = '' then
    begin
      result.code := 0;
      result.message := 'Certificado n?o configurado';
      exit;
    end;

    str_certificado := load_certificado_a1();
    if (str_certificado = '') or (not FileExists(str_certificado)) then
	  begin
		  result.code := 0;
      result.message := 'Certificado n?o encontrado';
      exit;
    end;

    dm_conexao.ACBrNFe.Configuracoes.Geral.SSLLib := TSSLLib(libOpenSSL);
	  dm_conexao.ACBrNFe.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cryOpenSSL);
	  dm_conexao.ACBrNFe.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(httpOpenSSL);
    dm_conexao.ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(xsLibXml2);
    dm_conexao.ACBrNFe.Configuracoes.Certificados.ArquivoPFX := str_certificado;
    dm_conexao.ACBrNFe.Configuracoes.Certificados.Senha := configuracao_nf.CERTIFICADO_DIGITAL_SENHA;
  end
  else //certificado A3
  begin
    //se n?o tiver certificado
    if configuracao_nf.CERTIFICADO_DIGITAL_SERIE = '' then
    begin
      result.code := 0;
      result.message := 'Certificado n?o configurado';
      exit;
    end;

    dm_conexao.ACBrNFe.Configuracoes.Geral.SSLLib := TSSLLib(libWinCrypt);
	  dm_conexao.ACBrNFe.Configuracoes.Geral.SSLCryptLib := TSSLCryptLib(cryWinCrypt);
	  dm_conexao.ACBrNFe.Configuracoes.Geral.SSLHttpLib := TSSLHttpLib(httpWinHttp);
 	  dm_conexao.ACBrNFe.Configuracoes.Geral.SSLXmlSignLib := TSSLXmlSignLib(xsMsXml);
    dm_conexao.ACBrNFe.Configuracoes.Certificados.NumeroSerie := configuracao_nf.CERTIFICADO_DIGITAL_SERIE;
  end;

  dm_conexao.ACBrNFe.Configuracoes.WebServices.UF := empresa_logado.UF;

  if not dm_conexao.ACBrNFe.Configuracoes.Certificados.VerificarValidade then
  begin
    result.code := 0;
    result.message := 'Certificado inv?lido ou vencido';
    exit;
  end;

}
