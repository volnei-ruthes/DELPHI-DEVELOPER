unit u_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, ComCtrls, Math;

type
  Tfrm_main = class(TForm)
    btnInstalador: TButton;
    Image1: TImage;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    lblCaption: TLabel;
    procedure btnInstaladorClick(Sender: TObject);
    procedure FormShow(Sender: TObject); 
  private
    { Private declarations }
    function  FileSize(fileName : wideString) : Int64;
    function  ConvertBytes(Bytes: Int64): string;
    procedure AddLogInstalacaoDLLs(pTextLog:string);
    procedure ExportaDadosDLLsToTXT;
    procedure SetInfoDLLs;
    Procedure ExtractResourcesDLLs(const NomeResource, NomeArquivo: String);
    procedure SetaConfiguracaoDataModificacao(pNameDLL: string; pLastDate: TDateTime);
    procedure BuscarArquivoMidasDLL(pDiretorio: string; pSub:Boolean);          //Conforme REQUISITO Nº 3 solicitação e-mail (10/05/21). Porém, INATIVADO conforme e-mail 12/05/21.
    procedure RenomeiaCopiaArquivoDLLsMidasDiretorios;                          //Conforme REQUISITO Nº 3 solicitação e-mail (10/05/21). Porém, INATIVADO conforme e-mail 12/05/21.
    procedure CopiaMidasDlltodosDiretoriosWindows;                              //Conforme REQUISITO Nº 3 solicitação e-mail (10/05/21). Porém, INATIVADO conforme e-mail 12/05/21.
    procedure RegistraMidasDllRPWindows;
  public
    { Public declarations }
  end;

  TInfoDLL = record
    nome              : string;
    ultimaModificacao : TDateTime;
  end;

  TPathMidas = record
    fullPath : string;
    path     : string;
    fileName : string;
  end;

var
  frm_main: Tfrm_main;
  InfoDLL : TInfoDLL;
  ListaArrayDLLs : array[0..50] of TInfoDLL;
  ListaArrayPathCMidasDLL : array[0..50] of TPathMidas;
  contBarProgress:integer;
  indexArray : integer;

implementation

{$R *.dfm}

function Tfrm_main.FileSize(fileName: wideString): Int64;                       //Returns file size in bytes or -1 if not found.
var sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then begin
    result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  end else begin
    result := -1;
  end;
  FindClose(sr);
end;

function Tfrm_main.ConvertBytes(Bytes: Int64): string;                          //Convert size byte in format string kb, mb, gb etc.
const
  Description: Array [0 .. 8] of string = ('Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB');
var
  i: Integer;
begin
  i := 0;
  while Bytes > Power(1024, i + 1) do begin
    Inc(i);
  end;
  Result := FormatFloat('###0.##', Bytes / IntPower(1024, i)) + ' ' + Description[i];
end;

procedure Tfrm_main.SetInfoDLLs;                                                //Configura dados de DLLs originais padrões importadas do FTP (nome e data ultima modificação).
begin
   //0. ChakraCore.dll
   ListaArrayDLLs[0].nome                := 'ChakraCore.dll';
   ListaArrayDLLs[0].ultimaModificacao   := StrToDateTime('12/03/2019 18:04:18');
   //1. dbexpdb2.dll
   ListaArrayDLLs[1].nome                := 'dbexpdb2.dll';
   ListaArrayDLLs[1].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //2. dbexpinf.dll
   ListaArrayDLLs[2].nome                := 'dbexpinf.dll';
   ListaArrayDLLs[2].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //3. dbexpint.dll
   ListaArrayDLLs[3].nome                := 'dbexpint.dll';
   ListaArrayDLLs[3].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //4. dbexpmss.dll
   ListaArrayDLLs[4].nome                := 'dbexpmss.dll';
   ListaArrayDLLs[4].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //5. dbexpmys.dll
   ListaArrayDLLs[5].nome                := 'dbexpmys.dll';
   ListaArrayDLLs[5].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //6. dbexpmysql.dll
   ListaArrayDLLs[6].nome                := 'dbexpmysql.dll';
   ListaArrayDLLs[6].ultimaModificacao   := StrToDateTime('01/03/2006 11:46:12');
   //7. dbexpoda.dll
   ListaArrayDLLs[7].nome                := 'dbexpoda.dll';
   ListaArrayDLLs[7].ultimaModificacao   := StrToDateTime('09/06/2020 15:09:14');
   //8. dbexpoda41.dll
   ListaArrayDLLs[8].nome                := 'dbexpoda41.dll';
   ListaArrayDLLs[8].ultimaModificacao   := StrToDateTime('09/06/2020 15:09:44');
   //9. dbexppgsql.dll
   ListaArrayDLLs[9].nome                := 'dbexppgsql.dll';
   ListaArrayDLLs[9].ultimaModificacao   := StrToDateTime('09/06/2020 15:13:30');
   //10. dbexppgsql41.dll
   ListaArrayDLLs[10].nome               := 'dbexppgsql41.dll';
   ListaArrayDLLs[10].ultimaModificacao  := StrToDateTime('09/06/2020 15:13:44');
   //11. dbexpsda.dll
   ListaArrayDLLs[11].nome               := 'dbexpsda.dll';
   ListaArrayDLLs[11].ultimaModificacao  := StrToDateTime('27/08/2020 15:11:06');
   //12. dbexpsda41.dll
   ListaArrayDLLs[12].nome               := 'dbexpsda41.dll';
   ListaArrayDLLs[12].ultimaModificacao  := StrToDateTime('27/08/2020 15:11:16');
   //13. libeay32.dll
   ListaArrayDLLs[13].nome               := 'libeay32.dll';
   ListaArrayDLLs[13].ultimaModificacao  := StrToDateTime('04/07/2016 19:15:36');
   //14. midas.dll
   ListaArrayDLLs[14].nome               := 'libssl32.dll';
   ListaArrayDLLs[14].ultimaModificacao  := StrToDateTime('04/07/2016 19:15:36');
   //15. midas.dll
   ListaArrayDLLs[15].nome               := 'midas.dll';
   ListaArrayDLLs[15].ultimaModificacao  := StrToDateTime('16/05/2020 15:55:00');
   //16. msvcr120.dll
   ListaArrayDLLs[16].nome               := 'msvcr120.dll';
   ListaArrayDLLs[16].ultimaModificacao  := StrToDateTime('04/07/2016 19:15:36');
   //17. oci.dll
   ListaArrayDLLs[17].nome               := 'oci.dll';
   ListaArrayDLLs[17].ultimaModificacao  := StrToDateTime('30/03/2010 06:03:20');
   //18. ociw32.dll
   ListaArrayDLLs[18].nome               := 'ociw32.dll';
   ListaArrayDLLs[18].ultimaModificacao  := StrToDateTime('30/03/2010 05:46:16');
   //19. ssleay32.dll
   ListaArrayDLLs[19].nome               := 'ssleay32.dll';
   ListaArrayDLLs[19].ultimaModificacao  := StrToDateTime('08/04/2014 07:26:36');
end;

procedure Tfrm_main.ExportaDadosDLLsToTXT;                                      //Gera uma lista de dados de todas as DLLs encontradas.
var sr: TSearchRec;
    CurrentDir, Filter: String;
    FileList: TStringList;
    FileLastModificationDate : Integer;
    TamanhoArquivo : Int64;
begin
  FileList := TStringList.Create;
  try
    try
      CurrentDir := ExtractFilePath(Application.ExeName);
      Filter := '*.dll';
      if FindFirst(CurrentDir + Filter, faAnyFile, sr) = 0 then begin
        repeat
          FileLastModificationDate := FileAge(sr.Name);
          TamanhoArquivo := FileSize(sr.Name);
          FileList.Add('Nome: '+sr.Name+' - Ultima modificação: '+DateTimeToStr(FileDateToDateTime(FileLastModificationDate))+' - Tamanho: '+ConvertBytes(TamanhoArquivo) );
        until FindNext(sr) <> 0;
      end;
      SysUtils.FindClose(sr);
      FileList.SaveToFile(ExtractFilePath(Application.ExeName)+'ListaDadosDLLs.txt');
    except on E:Exception do
      showmessage('Não foi possivel exportar uma lista de dados das DLLs. Erro: '+E.Message);
    end;
  finally
    FileList.Free;
  end;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  contBarProgress := 0;
  lblCaption.Caption := '';
end;

procedure Tfrm_main.AddLogInstalacaoDLLs(pTextLog: string);
var F: TextFile;
    PathArquivo: string;
begin
  PathArquivo := ExtractFilePath(Application.ExeName)+'logAtualizaDLLsRP.txt';
  try
    AssignFile(f,PathArquivo);
    if not FileExists(PathArquivo) then begin
      Rewrite(f);
    end else begin
      append(f);
    end;
    Writeln(f,FormatDateTime('dd/mm/yyyy hh:MM:ss', Now), ' - ', pTextLog);
    inc(contBarProgress);
    ProgressBar1.Position := ProgressBar1.Position + contBarProgress;
  finally
    CloseFile(f);
  end;
end;

procedure Tfrm_main.ExtractResourcesDLLs(const NomeResource,  NomeArquivo: String); //Extrai recurso passado por parâmetro (DLL) para a pasta do aplicativo.
var PathToSave : String;
    Res : TResourceStream;
begin
  PathToSave := ExtractFilePath(Application.ExeName)+NomeArquivo;
  if not FileExists(PathToSave) Then begin
     Res := TResourceStream.Create(Hinstance, NomeResource, 'DLLFILE');
     try
       try
         Res.SavetoFile(PathToSave);
         AddLogInstalacaoDLLs('Extraido recurso: '+NomeArquivo);
         inc(contBarProgress);
         ProgressBar1.Position := ProgressBar1.Position + contBarProgress;
       except
         ON E:Exception do begin
           ShowMessage('Erro ao extrair recursos de DLLs '+E.Message);
           AddLogInstalacaoDLLs('Erro ao extrair recurso: '+NomeArquivo);
         end;
       end;
     finally
       Res.Free;
     end;
  end else begin
    AddLogInstalacaoDLLs('Recurso: '+NomeArquivo+ ' já existe no diretório RP.');
  end;
end;

procedure Tfrm_main.btnInstaladorClick(Sender: TObject);
var i:integer;
begin
  ProgressBar1.Position := 0;
  lblCaption.Caption := 'Aguarde processo atualização DLLs...';
  AddLogInstalacaoDLLs('-------Inicio Atualizaçãoao DLLS RP.');
  SetInfoDLLs;                                                                  //1. Configura data de modificação original das DLLs FTP.
  AddLogInstalacaoDLLs('--Extraindo recursos DLLS RP...');
  ExtractResourcesDLLs('ChakraCore_dll',   'ChakraCore.dll');                   //2. Extrai/Salva Recursos de DLLs.
  ExtractResourcesDLLs('dbexpdb2_dll',     'dbexpdb2.dll');
  ExtractResourcesDLLs('dbexpinf_dll',     'dbexpinf.dll');
  ExtractResourcesDLLs('dbexpint_dll',     'dbexpint.dll');
  ExtractResourcesDLLs('dbexpmss_dll',     'dbexpmss.dll');
  ExtractResourcesDLLs('dbexpmys_dll',     'dbexpmys.dll');
  ExtractResourcesDLLs('dbexpmysql_dll',   'dbexpmysql.dll');
  ExtractResourcesDLLs('dbexpoda_dll',     'dbexpoda.dll');
  ExtractResourcesDLLs('dbexpoda41_dll',   'dbexpoda41.dll');
  ExtractResourcesDLLs('dbexppgsql_dll',   'dbexppgsql.dll');
  ExtractResourcesDLLs('dbexppgsql41_dll', 'dbexppgsql41.dll');
  ExtractResourcesDLLs('dbexpsda_dll',     'dbexpsda.dll');
  ExtractResourcesDLLs('dbexpsda41_dll',   'dbexpsda41.dll');
  ExtractResourcesDLLs('libeay32_dll',     'libeay32.dll');
  ExtractResourcesDLLs('libssl32_dll',     'libssl32.dll');
  ExtractResourcesDLLs('midas_dll',        'midas.dll');
  ExtractResourcesDLLs('msvcr120_dll',     'msvcr120.dll');
  ExtractResourcesDLLs('oci_dll',          'oci.dll');
  ExtractResourcesDLLs('ociw32_dll',       'ociw32.dll');
  ExtractResourcesDLLs('ssleay32_dll',     'ssleay32.dll');
  AddLogInstalacaoDLLs('--Configura Data de modificação dos recursos DLLS RP...');
  for i := 0 to High(ListaArrayDLLs) do begin                                   //3. Atualiza DLLs de recurso na data de modificação original configurada.
    SetaConfiguracaoDataModificacao(ListaArrayDLLs[i].nome, ListaArrayDLLs[i].ultimaModificacao);
    inc(contBarProgress);
    ProgressBar1.Position := ProgressBar1.Position + contBarProgress;
  end; 
  AddLogInstalacaoDLLs('--Registra no windows recurso midas.dll padrão RP...');
  RegistraMidasDllRPWindows;                                                    //6. Registra o midas.dll RP no windows.
  ProgressBar1.Position := ProgressBar1.Position + (200 - ProgressBar1.Position);
  lblCaption.Caption := 'Atualização DLLs RP concluída!';
  AddLogInstalacaoDLLs('-------Fim Atualizaçãoao DLLS RP.');
end;

procedure Tfrm_main.SetaConfiguracaoDataModificacao(pNameDLL: string; pLastDate: TDateTime); //Seta atributo do arquivo dt. ultima modificação com a data passada por parâmetro.
var sr: TSearchRec;
    CurrentDir, Filter: String;
    FileLastModificationDate : Integer;
begin
  CurrentDir := ExtractFilePath(Application.ExeName);
  Filter := pNameDLL;
  if FindFirst(CurrentDir + Filter, faAnyFile, sr) = 0 then begin               //Varre diretorio encontrando arquivo especificado no filtro.
    FileSetDate(sr.Name, DateTimeToFileDate(pLastDate));                        //Seta dt. modificação do arquivo encontrado com a data passada como parâmetro. 
  end;
  SysUtils.FindClose(sr);
end;

procedure Tfrm_main.BuscarArquivoMidasDLL(pDiretorio: string; pSub: Boolean);   //Faz varredura em todo o windows procurando midas.dll, sendo encontrado, armazena caminho de path num array.
var F: TSearchRec;
    Ret: Integer;
    TempNome: string;

            function TemAtributo(Attr, Val: Integer): Boolean;
            begin
              Result := Attr and Val = Val;
            end;
        
begin
  //Conforme REQUISITO Nº 3 da solicitação e-mail (10/05/21). OBS. INATIVADO conforme e-mail 12/05/21.
  Ret := FindFirst(pDiretorio+'\*.*', faAnyFile, F);
  try
    try
      while Ret = 0 do begin
        if TemAtributo(F.Attr, faDirectory) then begin
          if (F.Name <> '.') And (F.Name <> '..') then begin
            if pSub = True then begin
              TempNome := pDiretorio+'\' + F.Name;
              BuscarArquivoMidasDLL(TempNome, True); //Forma recursiva.
            end;
          end;
        end
        else
        if Trim(F.Name) = 'midas.dll' then begin
          ListaArrayPathCMidasDLL[indexArray].fullPath := pDiretorio+'\'+F.Name;
          ListaArrayPathCMidasDLL[indexArray].path     := pDiretorio+'\';
          ListaArrayPathCMidasDLL[indexArray].fileName := F.Name;
          AddLogInstalacaoDLLs('Adcionado na Lista Array midas.dll path no windows: '+ListaArrayPathCMidasDLL[indexArray].fullPath);
          //memo1.Lines.Add('Caminho: '+pDiretorio+'\'+F.Name);                 //só p teste
          inc(indexArray);
          inc(contBarProgress);
          ProgressBar1.Position := ProgressBar1.Position + contBarProgress;
        end;
        Ret := FindNext(F);
      end;
    except on E: Exception do
      begin
        AddLogInstalacaoDLLs('Erro ao buscar DLL midas no windows.');
      end;
    end;
  finally
    FindClose(F);
  end;
  //ex. uso: BuscarArquivoMidasDLL('C:', true);
end;

procedure Tfrm_main.RenomeiaCopiaArquivoDLLsMidasDiretorios;                    //Conforme requisito nº 3, renomeia (exceto da RP) todos os arquivos midas.dll nos diretorios no windows.
var i:integer;
    MidasRP, fileRename:string;
begin
  //Conforme REQUISITO Nº 3 solicitação via e-mail 10/05/21. OBS. INATIVADO conforme e-mail 12/05/21.
{ try
    MidasRP := ExtractFilePath(Application.ExeName)+'midas.dll';
    for i := 0 to High(ListaArrayPathCMidasDLL) do begin
      if not(ListaArrayPathCMidasDLL[i].fullPath = MidasRP) AND (trim(ListaArrayPathCMidasDLL[i].fullPath) <> '' ) then begin
         fileRename := ListaArrayPathCMidasDLL[i].fullPath+'.old';
         RenameFile(ListaArrayPathCMidasDLL[i].fullPath, fileRename);                 //Renomeia midas.dll antiga.
         CopyFile(PChar(MidasRP), PChar(ListaArrayPathCMidasDLL[i].fullPath), false); //Copia midas.dll RP padrão.
      end;
    end;
    AddLogInstalacaoDLLs('Renomeadas midas.dlls antigas nos diretorios windows');
    AddLogInstalacaoDLLs('Copiado midas.dlls RP nos diretorios windows');
    inc(contBarProgress,20);
    ProgressBar1.Position := ProgressBar1.Position + contBarProgress;
  except on E:Exception do
    begin
      AddLogInstalacaoDLLs('Erro de renomeação/copia midas.dlls.old nos diretorios windows: '+ListaArrayPathCMidasDLL[i].fullPath);
    end;
  end; }
end;

procedure Tfrm_main.CopiaMidasDlltodosDiretoriosWindows;                        //Conforme requisito nº 3, substitui a midas.dll da RP em todos os diretorios do windows encontrado.
begin
   //Conforme REQUISITO Nº 3 solicitação via e-mail 10/05/21. OBS. INATIVADO conforme e-mail 12/05/21.
{  try
    MidasRP := ExtractFilePath(Application.ExeName)+'midas.dll';
    for i := 0 to High(ListaArrayPathCMidasDLL) do begin
      if not(ListaArrayPathCMidasDLL[i].fullPath = MidasRP) AND (trim(ListaArrayPathCMidasDLL[i].fullPath) <> '' ) then begin
         CopyFile(MidasRP, ListaArrayPathCMidasDLL[i].fullPath, false);
      end;
    end;
    AddLogInstalacaoDLLs('Copiado midas.dll RP nos diretorios windows');
  except on E:Exception do
    begin
      AddLogInstalacaoDLLs('Erro ao copiar midas.dll RP nos diretorios windows: '+ListaArrayPathCMidasDLL[i].fullPath);
    end;
  end;}
end;

procedure Tfrm_main.RegistraMidasDllRPWindows;
var MidasRP : string;
begin
  try
    MidasRP := ExtractFilePath(Application.ExeName)+'midas.dll';
    //WinExec(PChar('regsvr32 '+MidasRP+' /s'),SW_NORMAL);                        //Com ' /S' não mostrar janela de exito da instalação para o usuario.
    WinExec(PChar('regsvr32 '+MidasRP),SW_NORMAL);
    AddLogInstalacaoDLLs('Midas.dll RP registrada no windows com sucesso.');
  except on E:Exception do
    begin
      AddLogInstalacaoDLLs('Erro ao registrar Midas.dll RP no windows.');
    end;
  end;
end;  

end.
