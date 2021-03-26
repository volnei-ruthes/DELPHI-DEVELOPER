unit u_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.MySQL, Inifiles, Forms, Dialogs, frxClass,
  frxDBSet ;

type
  Tdm = class(TDataModule)
    FDConnection1: TFDConnection;
    driver: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tb_clientes: TFDTable;
    DataSource1: TDataSource;
    tb_clientesclie_id: TFDAutoIncField;
    tb_clientesclie_nome: TStringField;
    tb_clientesclie_endereco: TStringField;
    tb_clientesclie_bairro: TStringField;
    tb_clientesclie_cidade: TStringField;
    tb_clientesclie_uf: TStringField;
    tb_clientesclie_rg: TStringField;
    tb_clientesclie_cpf: TStringField;
    tb_clientesclie_tel: TStringField;
    tb_clientesclie_email: TStringField;
    tb_clientesclie_dtnasc: TDateField;
    tb_clientesclie_dtcad: TDateField;
    tb_clientesclie_situacao: TStringField;
    FDQuery_Cons_Cliente: TFDQuery;
    DS_Cons_Cliente: TDataSource;
    FDQuery_ImprimeCliente: TFDQuery;
    FDQuery_Cons_Clienteclie_id: TFDAutoIncField;
    FDQuery_Cons_Clienteclie_nome: TStringField;
    FDQuery_Cons_Clienteclie_endereco: TStringField;
    FDQuery_Cons_Clienteclie_bairro: TStringField;
    FDQuery_Cons_Clienteclie_cidade: TStringField;
    FDQuery_Cons_Clienteclie_uf: TStringField;
    FDQuery_Cons_Clienteclie_rg: TStringField;
    FDQuery_Cons_Clienteclie_cpf: TStringField;
    FDQuery_Cons_Clienteclie_tel: TStringField;
    FDQuery_Cons_Clienteclie_email: TStringField;
    FDQuery_Cons_Clienteclie_dtnasc: TDateField;
    FDQuery_Cons_Clienteclie_dtcad: TDateField;
    FDQuery_Cons_Clienteclie_situacao: TStringField;
    FDQuery_ImprimeClienteclie_id: TFDAutoIncField;
    FDQuery_ImprimeClienteclie_nome: TStringField;
    FDQuery_ImprimeClienteclie_endereco: TStringField;
    FDQuery_ImprimeClienteclie_bairro: TStringField;
    FDQuery_ImprimeClienteclie_cidade: TStringField;
    FDQuery_ImprimeClienteclie_uf: TStringField;
    FDQuery_ImprimeClienteclie_rg: TStringField;
    FDQuery_ImprimeClienteclie_cpf: TStringField;
    FDQuery_ImprimeClienteclie_tel: TStringField;
    FDQuery_ImprimeClienteclie_email: TStringField;
    FDQuery_ImprimeClienteclie_dtnasc: TDateField;
    FDQuery_ImprimeClienteclie_dtcad: TDateField;
    FDQuery_ImprimeClienteclie_situacao: TStringField;
    rpt_Cliente: TfrxReport;
    ds_rel_cliente: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function   ConectBD():Boolean;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdm.ConectBD: Boolean;
Var Conf: tinifile;
    Caminho_Arquivo: string;
begin

   {$REGION 'Ajusta Conex�o com o BD'}

   Caminho_Arquivo:=ExtractFilePath(Application.ExeName)+'CONF.INI';
   if not FileExists(Caminho_Arquivo) then
   begin
     ShowMessage('Arquivo CONF.INI, n�o encontrado');
   end
   else
   Conf:=TIniFile.Create(Caminho_Arquivo);

   with FDConnection1 do
   begin
     params.Database:= conf.ReadString('CNX_MYSQL','DATABASE','');
     params.UserName:= conf.ReadString('CNX_MYSQL','USERNAME','');
     params.Password:= conf.ReadString('CNX_MYSQL','PASSWORD','');
     params.DriverID:= conf.ReadString('CNX_MYSQL','DRIVERID','');

     Params.Add('Server=' +conf.ReadString('CNX_MYSQL','SERVER',''));
     Params.Add('Port=' +conf.ReadString('CNX_MYSQL','PORT',''));

     driver.VendorLib:=conf.ReadString('CNX_MYSQL','VendorLib','');

     try
       FDConnection1.Connected:=TRUE;
       ShowMessage('Conex�o realizada com sucesso!');
     Except
       on E : Exception do
       begin
         ShowMessage('Exception class name = '+E.ClassName);
         ShowMessage('Exception message = '+E.Message);
        end;
     end;
   end;

   {$ENDREGION}

end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin


  {$REGION 'Configura Banco de Dado'}

    //Conex�o LOCAL com LocalHost.
    {FDConnection1.Params.Database := 'sistema';
    FDConnection1.Params.UserName := 'root';
    FDConnection1.Params.Password := '';  }

    //Conex�o Hospedagem Humbler.
    //{setar no fdconnection (dois cliques) server: mysql873.umbler.com  port: 41890}
    FDConnection1.Params.Database := 'volneisistema';
    FDConnection1.Params.UserName := 'volneisistema';
    FDConnection1.Params.Password := 'sistema123';

    


  {$ENDREGION}

  {$REGION 'Configura Driver MySQL'}

    driver.VendorLib := GetCurrentDir + '\lib\libmySQL.dll';

  {$ENDREGION}

  {$REGION 'Conecta BD'}

    FDConnection1.Connected := true;

  {$ENDREGION}

  {$REGION 'Configura Tabela Cliente'}

    tb_clientes.TableName := 'clientes';
    tb_clientes.Active := true;

  {$ENDREGION}

  //ou
  //ConectBD; //op�o de ajuste de conex�o com procedure.

end;

end.
