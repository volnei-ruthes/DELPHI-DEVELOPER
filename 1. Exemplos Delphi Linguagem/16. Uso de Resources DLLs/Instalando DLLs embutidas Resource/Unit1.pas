unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ResourcesExtractToSaveDLLs(const NomeResource, NomeArquivo: String);
    procedure SetArquivoInfoDlls(pNameArquivo, pArqDll: String);
    Procedure ResourcesExtractToReadInfoDLLs(const NomeResource, NomeArquivo: String);
    //Procedure BuscaMidasDLL(const cPath, cFile: String): Boolean;
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
   //1. Escrever bloco txt com as informa?es das dlls...
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
 