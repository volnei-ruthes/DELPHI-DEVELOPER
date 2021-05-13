unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, Vcl.ComCtrls, Math;

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
    Memo3: TMemo;
    ProgressBar1: TProgressBar;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ResourcesExtractToSaveDLLs(const NomeResource, NomeArquivo: String);
    procedure SetArquivoInfoDlls(pNameArquivo, pArqDll: String);
    Procedure ResourcesExtractToReadInfoDLLs(const NomeResource, NomeArquivo: String);
    function  BuscaMidasDLL(const cPath, cFile: String) : boolean;
    procedure ListarArquivos(pDiretorio: string; pSub:Boolean);
    function FileSize(fileName : wideString) : Int64;
    function ConvertBytes(Bytes: Int64): string;
    procedure mudaAlgo(var texto:string);
    procedure ShowDllPath stdcall;
    function GetModuleName: string;
  public
    { Public declarations }

  end;

  TPathMidas = record
    fullPath : string;
    path     : string;
    size     : string;
  end;

var
  Form1: TForm1;
  indexArray : integer;
  ListaArrayPathMidasDLL : array[0..50] of TPathMidas;
  contBar : integer;


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

function TForm1.BuscaMidasDLL(const cPath, cFile: String) : boolean;            //Método de busca Recursivo.
var
  S: String;
  nRet: Integer;
  Search: TSearchRec;
  TamanhoArquivo : Int64;
begin
  nRet := FindFirst(cPath+'*.*', faAnyFile or faArchive or faDirectory, Search);
  while nRet = 0 do
  begin
    if (Trim(Search.Name) <> '.') and (Trim(Search.Name) <> '..') then
    begin
      { Se for um diretório, chama a função para percorrê-lo. }
      if Search.Attr and faDirectory > 0 then begin
        BuscaMidasDLL(IncludeTrailingPathDelimiter(cPath+Search.Name), cFile)
      { Neste caso estamos fazendo uma busca exata, pode-se fazer um if com pos
        para buscar extensões partes do nome e etc. }
      end else if Trim(Search.Name) = cFile then begin
        TamanhoArquivo := FileSize(cPath+Search.Name);
        Memo1.Lines.Add(cPath+Search.Name+' - '+ConvertBytes(TamanhoArquivo));
      end;
    end;
    nRet := FindNext(Search);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  BuscaMidasDLL('C:\Windows\', 'midas.dll');
end;

procedure TForm1.ShowDllPath;
var
  TheFileName : array[0..MAX_PATH] of char;
begin
 {Detecting DLL Filename - How to detect the full path and file name of where the DLL was called from.}
 FillChar(TheFileName, sizeof(TheFileName), #0);
 GetModuleFileName(hInstance, TheFileName, sizeof(TheFileName));
 MessageBox(0, TheFileName, 'The DLL file name is:', mb_ok);
end;


procedure TForm1.Button7Click(Sender: TObject);
begin
 ShowDllPath;
 showmessage(GetModuleName);
end;

procedure TForm1.Button8Click(Sender: TObject);
var i: integer;
begin
 memo2.Lines.Clear;
 indexArray := 0;
 ProgressBar1.Position := 0;
 ListarArquivos('C:', true);
 for i := Low(ListaArrayPathMidasDLL) to High(ListaArrayPathMidasDLL) do begin
   if trim(ListaArrayPathMidasDLL[i].fullPath) <> '' then begin
     memo3.Lines.Add(inttostr(i)+' - '+ListaArrayPathMidasDLL[i].path);
     memo3.Lines.Add(inttostr(i)+' - '+ListaArrayPathMidasDLL[i].fullPath);
   end;
 end;
 ProgressBar1.Position := ProgressBar1.Position + (100 - ProgressBar1.Position);
end;

function TForm1.GetModuleName: string;
var
  szFileName: array[0..MAX_PATH] of Char;
begin
  FillChar(szFileName, SizeOf(szFileName), #0);
  GetModuleFileName(hInstance, szFileName, MAX_PATH);
  Result := szFileName;
end;


procedure TForm1.Button9Click(Sender: TObject);
 var texto, texto2:string;
begin
  texto := 'A';
  showmessage('valor da var texto: '+ texto);
  mudaAlgo(texto);
  showmessage('valor da var texto: '+ texto);
end;

procedure TForm1.mudaAlgo(var texto: string);
begin
 texto := texto+'1';
 showmessage('mensagem dentro do metodo: '+texto);
end;

function TForm1.ConvertBytes(Bytes: Int64): string;
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

function TForm1.FileSize(fileName: wideString): Int64;                          // returns file size in bytes or -1 if not found.
var sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then begin
    result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  end else begin
    result := -1;
  end;
  FindClose(sr);
end;




procedure TForm1.ListarArquivos(pDiretorio: string; pSub:Boolean);
var F: TSearchRec;
    Ret: Integer;
    TempNome: string;
    TamanhoArquivo : Int64;

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
        TamanhoArquivo := FileSize(pDiretorio+'\'+F.Name);  //pega o tamanho do arquivo em bytes
        memo2.Lines.Add('Caminho: '+pDiretorio+'\'+F.Name+ ' - Tamanho: ' + ConvertBytes(TamanhoArquivo) );  //converte bytes para kb ou mb, ou gb.
        ListaArrayPathMidasDLL[indexArray].fullPath := pDiretorio+'\'+F.Name;
        //ListaArrayPathMidasDLL[indexArray].path := pDiretorio+'\';
        inc(indexArray);
        ProgressBar1.Position := indexArray;
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
   //1. Escrever bloco txt com as informaões das dlls...
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
 