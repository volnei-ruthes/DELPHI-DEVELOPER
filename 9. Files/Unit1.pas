unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, MaskUtils, ExtCtrls, DB, DBClient, Jpeg;

type
  //Exemplo 1
  TPessoa = packed record
    Nome: String[255];
    Telefone: String[255];
  end;

  //Exemplo 2
  TDado = record
    Codigo : Integer;
    Nome: string[50];
    Fone : string [10];
    Endereco : string[50];
    DataCad : TDate;
    Credito : Currency;
  end;


  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Button1: TButton;
    odFile: TOpenDialog;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button2: TButton;
    sdFile: TSaveDialog;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    edtCaminho: TEdit;
    Button5: TButton;
    Button6: TButton;
    memoExe3: TMemo;
    Memo3: TMemo;
    TabSheet5: TTabSheet;
    Button7: TButton;
    Button8: TButton;
    edtCaminho4: TEdit;
    cdsblob: TClientDataSet;
    cdsblobimagem: TBlobField;
    Image1: TImage;
    TabSheet6: TTabSheet;
    Button9: TButton;
    Button10: TButton;
    EdtBuffer: TEdit;
    memobuffer: TMemo;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
    function IncCodigo(Stream : TStream; cInc : Integer) : Integer;
    procedure EscreveRegistro(Stream : TStream; Reg : TDado; RecNo : Integer);
    function RecordCount(Stream : TStream) : Integer;
    procedure LerRegistro(Stream : TStream; var Reg : TDado; RecNo : Integer);
  public
    { Public declarations }
  end;

const
   cCabecalho = 50;//dado arqmazenados no inicio do arquivo pra outra utilização.{Exemplo: o AutoInc}

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Pessoa: TPessoa;
  fPess: TFileStream;
begin
   //Metodo Escrita.
   if sdFile.Execute then // SaveDialog
  begin
    fPess := TFileStream.Create( sdFile.FileName, fmCreate );
    try
      Pessoa.Nome := Self.Edit1.Text;
      Pessoa.Telefone := Self.Edit2.Text;
      fPess.Write( Pessoa, SizeOf( TPessoa ) );
    finally
      FreeAndNil( fPess );
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Pessoa: TPessoa;
  fPess: TFileStream;
  CountRead: Integer;
begin
   { Neste artigo veremos como manipular arquivos binários. Ainda hoje, algumas aplicações fazem uso de arquivos binários
    para armazenar e trocar informações de maneira mais segura do que é possível com arquivos texto.
    Arquivos binários guardam informações no "formato de máquina". Por isso, se um arquivo desse tipo for aberto em um editor de texto comum
    não será possível a sua leitura de maneira compreensível. Para evitar que os dados fiquem desprotegidos, acessíveis para que
    qualquer usuário possa ler, gravaríamos estas informações em formato binário. }

   // OpenDialog
  if odFile.Execute then
  begin
    fPess := TFileStream.Create( odFile.FileName, fmOpenRead );
    try
      CountRead := fPess.Read( Pessoa, SizeOf( TPessoa ) );
      if CountRead = 0 then Exit;
      Self.Edit1.Text := Pessoa.Nome;
      Self.Edit2.Text := Pessoa.Telefone;
    finally
      FreeAndNil( fPess );
    end;
  end;

end;

procedure TForm1.EscreveRegistro(Stream: TStream; Reg: TDado; RecNo: Integer);
begin
  Stream.Position := cCabecalho + (RecNo - 1)*SizeOf(Reg);
  Stream.WriteBuffer(Reg, SizeOf(Reg));
end;

function TForm1.IncCodigo(Stream: TStream; cInc: Integer): Integer;
begin
  Stream.Position := 0;
  if not (Stream.Read(Result, SizeOf(Result)) = SizeOf(Result)) then
    if Stream.Size >=  SizeOf(Result) then
      raise Exception.Create('Erro Lendo código AutoInc')
    else Result := 0;

  Inc(Result);
  Stream.Position := 0;
  Stream.WriteBuffer(Result, SizeOf(Result));
end;

procedure TForm1.LerRegistro(Stream: TStream; var Reg: TDado;  RecNo: Integer);
begin
  Stream.Position := cCabecalho + (RecNo - 1)*SizeOf(Reg);
  Stream.ReadBuffer(Reg, SizeOf(Reg));
end;

function TForm1.RecordCount(Stream: TStream): Integer;
begin
  Result := (Stream.Size - cCabecalho) div SizeOf(TDado);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  R : TDado;
  Stream :TFileStream ;
begin
  R.Nome := 'Gilson';
  R.Fone := '3388991155';
  R.Endereco := 'Rua Olavo Bilac, 5689';
  R.DataCad := Date;
  R.Credito := 35897.89;
  if FileExists('c:\teste.dat') then
    Stream := TFileStream.Create('c:\teste.dat', fmOpenReadWrite)
  else
    Stream := TFileStream.Create('c:\teste.dat', fmCreate);
  try
    R.Codigo := IncCodigo(Stream , 1);//pra pegar o AutoIncremento;
    EscreveRegistro(Stream, R, RecordCount(Stream)+1);
  finally
    Stream.Free;
  end;    
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  R : TDado;
  Stream :TFileStream ;
  I : Integer;
begin
  Memo1.Lines.Clear;
  Stream := TFileStream.Create('c:\teste.dat', fmOpenReadWrite);
  try
    I := RecordCount(Stream);
    for I := 1 to I do
    begin
      LerRegistro(Stream, R, I);
      Memo1.Lines.Add('*** registro '+IntToStr(I)+'***');
      Memo1.Lines.Add('Codigo: '+IntToStr(R.Codigo));
      Memo1.Lines.Add('Nome: '+R.Nome);
      Memo1.Lines.Add('Fone: '+FormatMaskText('!\(99\)9999-9999;0;_', R.Fone));
      Memo1.Lines.Add('Endereço: '+R.Endereco);
      Memo1.Lines.Add('Data Cadastro: '+DateToStr(R.DataCad));
      Memo1.Lines.Add('Crédito: '+Format('%15m', [R.Credito]));
    end;
  finally
    Stream.Free;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
var
   sFilename:string;
begin
   if(odFile.Execute)then
      sFilename:=odFile.FileName;

   edtcaminho.Text:=sFilename;  
end;

procedure TForm1.Button6Click(Sender: TObject);
var
   sFilename:string;
   oFileStream:TFileStream;
begin
   try
      sFilename:=edtcaminho.Text;  //criar um arquivo txt de lista de nomes para o teste.
      oFileStream:=TFileStream.Create(sFilename,fmOpenRead);
      memoExe3.Lines.LoadFromStream(oFileStream);
   finally
      FreeAndNil(oFileStream);
   end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
   odFile.Filter:=EmptyStr;
   odFile.Filter:='Image Files|*.jpg';   //obs. dont forgot include uses library Jpeg.

   if(odFile.Execute)then
      edtCaminho4.Text:=odFile.FileName;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
   sFilename:string;
   oFilestream:TFileStream;
   oMemorystream:TStream;
   oImage:TJPEGImage;
begin
   {salvar essa imagem já selecionada em um FileStream, salvá-la no campo blob e
   depois recuperá-la com a técnica do blobstream combinada com o Jpegimage.}
   try
      sFilename:=edtcaminho4.Text;
      oFilestream:=TFileStream.Create(sFilename,fmOpenRead);
      oMemorystream:=TMemoryStream.Create;
      oImage:=TJPEGImage.Create;
      cdsblob.Open;
      cdsblob.Append;
      cdsblobIMAGEM.LoadFromStream(oFilestream);
      cdsblob.Post;
      oMemorystream:=cdsblob.CreateBlobStream(cdsblobIMAGEM,bmRead);
      oImage.LoadFromStream(oMemorystream);
      Image1.Picture.Assign(oImage);
   finally
      FreeAndNil(oFilestream);
      FreeAndNil(oMemorystream);
      FreeAndNil(oImage);
   end; 
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if(odFile.Execute)then
      EdtBuffer.Text:=odFile.FileName;
end;

procedure TForm1.Button10Click(Sender: TObject);
 var
   oStreamin,
   oStreamout:TFileStream;
   aBufferstream:array[0..1023]of Byte;
   iByteRead:integer;
   sFilename:string;
begin
  { TRABALHANDO COM BUFFERS - Quando trabalhamos com Streams é importante termos em mente que o conteúdo do Stream irá ocupar uma
   certa quantidade de memória no computador. Em algumas situações pode ser importante que tenhamos um controle mais preciso desse espaço
   e de como ele será manipulado. Esse maior controle pode ser conseguido com a técnica de “bufferização”, que consiste em
   alocar previamente um espaço de memória onde o buffer irá trabalhar. é tbm importante destacar duas propriedades importantes
   de um Stream, que são: Size e Position. Size retorna um inteiro com o tamanho ocupado pelo Stream, e Position também retorna
   um inteiro com a posição atual do cursor de leitura do Stream. Assim como os datasets, Streams também possuem um cursor interno
   responsável pela leitura dos dados.}

   try
      ProgressBar1.Position:=0;
      sFilename:=EdtBuffer.Text;
      oStreamin:=TFileStream.Create(sFilename,fmOpenRead);
      oStreamout:=TFileStream.Create('temp.txt',fmCreate);

      repeat
         iByteRead:=oStreamin.Read(aBufferstream,1024);
         oStreamout.Write(abufferstream,iByteRead);
         ProgressBar1.StepBy(1);
      until(iByteRead=0);
      
   finally
      ProgressBar1.Position:=100;
      FreeAndNil(oStreamin);
      FreeAndNil(oStreamout);
      Memo1.Lines.LoadFromFile('temp.txt');
   end;

end;

end.
