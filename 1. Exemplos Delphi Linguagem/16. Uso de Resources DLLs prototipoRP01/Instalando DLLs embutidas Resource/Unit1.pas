unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, Vcl.ComCtrls;

type

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Button7: TButton;
    Memo2: TMemo;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ResourcesExtractToSaveDLLs(const NomeResource, NomeArquivo: String);
    procedure SetArquivoInfoDlls(pNameArquivo, pArqDll: String);
    Procedure ResourcesExtractToReadInfoDLLs(const NomeResource, NomeArquivo: String);
    function BuscaMidasDLL(const cPath, cFile: String) : boolean;
    procedure ListarArquivos(pDiretorio: string; pSub:Boolean);
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.ResourcesExtractToSaveDLLs(const NomeResource, NomeArquivo: String);
Var PathToSave : String;
    Res : TResourceStream;
Begin
  PathToSave := ExtractFilePath(Application.ExeName)+NomeArquivo;
  if not FileExists(PathToSave) Then begin
     Res := TResourceStream.Create(Hinstance, NomeResource, 'DLLFILE');
     try
       try

         Res.SavetoFile(PathToSave);
         
       except
         ON E:Exception do begin
           ShowMessage('Erro ao extrair recursos de DLLs '+E.Message);
         end;
       end;
     finally
       Res.Free;
     end;
  End;
end;

function TForm1.BuscaMidasDLL(const cPath, cFile: String) : boolean;            //M�todo de busca Recursivo.
var
  S: String;
  nRet: Integer;
  Search: TSearchRec;
begin
  nRet := FindFirst(cPath+'*.*', faAnyFile or faArchive or faDirectory, Search);
  while nRet = 0 do
  begin
    if (Trim(Search.Name) <> '.') and (Trim(Search.Name) <> '..') then
    begin
      { Se for um diret�rio, chama a fun��o para percorr�-lo. }
      if Search.Attr and faDirectory > 0 then begin
        BuscaMidasDLL(IncludeTrailingPathDelimiter(cPath+Search.Name), cFile)
      { Neste caso estamos fazendo uma busca exata, pode-se fazer um if com pos
        para buscar extens�es partes do nome e etc. }
      end else if Trim(Search.Name) = cFile then begin
        Memo1.Lines.Add(cPath+Search.Name);
      end;
    end;
    nRet := FindNext(Search);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  BuscaMidasDLL('C:\Windows\', 'midas.dll');
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 memo2.Lines.Clear;
 ListarArquivos('C:\', true);
end;

procedure TForm1.ListarArquivos(pDiretorio: string; pSub:Boolean);
var F: TSearchRec;
    Ret: Integer;
    TempNome: string;

        function TemAtributo(Attr, Val: Integer): Boolean;
        begin
          Result := Attr and Val = Val;
        end;

begin
  Ret := FindFirst(pDiretorio+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do begin
      if TemAtributo(F.Attr, faDirectory) then begin
        if (F.Name <> '.') And (F.Name <> '..') then begin
          if pSub = True then begin
            TempNome := pDiretorio+'\' + F.Name;
            ListarArquivos(TempNome, True); //Forma recursiva.
          end;
        end;
      end else if Trim(F.Name) = 'midas.dll' then begin
        memo2.Lines.Add(pDiretorio+'\'+F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ResourcesExtractToReadInfoDLLs('infoDLLs_data','infoDLLsteste2.txt');
end;

procedure TForm1.ResourcesExtractToReadInfoDLLs(const NomeResource, NomeArquivo: String);
var
  PathArquivo : string;
  Res : TResourceStream;
begin
   PathArquivo := ExtractFilePath(Application.ExeName)+NomeArquivo;
  if not FileExists(PathArquivo) Then begin
     try
       try
         Res := TResourceStream.Create(Hinstance, NomeResource, 'DLLINFO');
         Res.SavetoFile(PathArquivo); 
       except
         ON E:Exception do begin
           ShowMessage('Erro ao extrair recurso InfoDLLs '+E.Message);
         end;
       end;
     finally
       Res.Free;
     end;
  end;
end;

procedure TForm1.SetArquivoInfoDlls(pNameArquivo, pArqDll: String);
var
  FileLastModificationDate : Integer;
  F: TextFile;
  PathArquivo : string;
begin
   PathArquivo := ExtractFilePath(Application.ExeName)+pNameArquivo;
   //1. Escrever bloco txt com as informa�es das dlls...
   FileLastModificationDate := FileAge(pArqDll);
   AssignFile(f,PathArquivo);
   Rewrite(f); //abre o arquivo para escrita
   Writeln(f,pArqDll, ',', DateTimeToStr(FileDateToDateTime(FileLastModificationDate)) ); //escreve no arquivo e desce uma linha    Write(f,'Clube Delphi'); //escreve no arquivo sem descer a linha
   Closefile(f); //fecha o handle de arquivo
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fileName    : string;
  fileDate    : Integer;
  newDateTime : TDateTime;

begin
  // Try to open the Unit1.DCU file for the current project
  fileName := 'twain_32.dll';
  fileDate := FileAge(fileName);


    // modifico uma data do arquivo para teste
    newDateTime := StrToDateTime('01/01/2000 12:34:56');
    FileSetDate(fileName, DateTimeToFileDate(newDateTime));

  // mostra a data
  fileDate := FileAge(fileName);
  if fileDate > -1 then
    ShowMessage(fileName+' last modified date = '+
                DateTimeToStr(FileDateToDateTime(fileDate)));

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   SetArquivoInfoDlls('infoDLLs.txt','twain_32.dll');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ResourcesExtractToSaveDLLs('twain_32_dll','twain_32TESTE.dll');
end;

procedure TForm1.Button5Click(Sender: TObject);
var sr: TSearchRec;
    CurrentDir, Filter: String;
    FileList: TStringList;
    FileLastModificationDate : Integer;
begin
  CurrentDir := ExtractFilePath(Application.ExeName);
  Filter := '*.dll';
  FileList := TStringList.Create;
  if FindFirst(CurrentDir + Filter, faAnyFile, sr) = 0 then
  repeat
  
    FileLastModificationDate := FileAge(sr.Name);
    FileList.Add(sr.Name+' - '+inttostr(FileLastModificationDate)+' - '+DateTimeToStr(FileDateToDateTime(FileLastModificationDate)));

  until FindNext(sr) <> 0;
  SysUtils.FindClose(sr);
  FileList.SaveToFile(ExtractFilePath(Application.ExeName)+'listaDLLsss.txt');
end;




end.
 