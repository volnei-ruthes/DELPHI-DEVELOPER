unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, MaskUtils;

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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
   cCabecalho = 50;//dado arqmazenados no inicio do arquivo pra outra utiliza��o.{Exemplo: o AutoInc}

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
   { Neste artigo veremos como manipular arquivos bin�rios. Ainda hoje, algumas aplica��es fazem uso de arquivos bin�rios
    para armazenar e trocar informa��es de maneira mais segura do que � poss�vel com arquivos texto.
    Arquivos bin�rios guardam informa��es no "formato de m�quina". Por isso, se um arquivo desse tipo for aberto em um editor de texto comum
    n�o ser� poss�vel a sua leitura de maneira compreens�vel. Para evitar que os dados fiquem desprotegidos, acess�veis para que
    qualquer usu�rio possa ler, gravar�amos estas informa��es em formato bin�rio. }

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
      raise Exception.Create('Erro Lendo c�digo AutoInc')
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
      Memo1.Lines.Add('Endere�o: '+R.Endereco);
      Memo1.Lines.Add('Data Cadastro: '+DateToStr(R.DataCad));
      Memo1.Lines.Add('Cr�dito: '+Format('%15m', [R.Credito]));
    end;
  finally
    Stream.Free;
  end;

end;

end.
