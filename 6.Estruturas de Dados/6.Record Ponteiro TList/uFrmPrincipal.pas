unit uFrmPrincipal;

//http://www.planetadelphi.com.br/artigo/137/usando-estrutura-(record),-ponteiro-e-tlist-na-aplica%C3%A7%C3%A3o.

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPessoa = record
    Nome:string;
    Email:string;
  end;

  ptrPessoa = ^TPessoa; //Ponteiro para meu Record.

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtNome: TEdit;
    Label2: TLabel;
    edtEmail: TEdit;
    btnAdicionar: TButton;
    btnMostrar: TButton;
    btnExcluir: TButton;
    btnConferir: TButton;
    ListBox1: TListBox;
    Label3: TLabel;
    btnModificar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConferirClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Ponteiro : ptrPessoa;  //Var tipo ponteiro da estrutura record pessoa.
    listaCadastrados: TList;
    procedure operacao(flag:boolean);
    procedure limpaLista(var Lista:TList);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.limpaLista(var Lista: TList);
var
  i:integer;
begin
   //Limpa uma TList.
   for i:= (Lista.Count -1) downto 0 do
   begin
     Dispose(Lista.Items[i]);
     Lista.Delete(i);
   end;
end;

procedure TForm1.operacao(flag: boolean);
begin

  if flag then //se for true add um dado na estrutura
  begin

    Ponteiro := new( ptrPessoa ); //Quando usar ponteiro dar um new para alocar memoria.
    Ponteiro^.Nome := edtNome.Text;
    Ponteiro^.Email := edtEmail.Text;

    ListBox1.Items.Add(
       inttostr(listaCadastrados.Add(Ponteiro))+'-'+
       inttostr(Integer(Ponteiro))+'-'+
       Ponteiro^.Nome+'-'+
       Ponteiro^.Email);
  end
  else //Se for false altera o item.
  begin
    Ponteiro^.Nome:=edtNome.Text;
    Ponteiro^.Email:=edtEmail.Text;

    ListBox1.Items.Strings[ListBox1.ItemIndex] := inttostr(listaCadastrados.IndexOf(Ponteiro))
                                                    + ' - ' + IntToStr( Integer( Ponteiro ) )
                                                    + ' - ' + Ponteiro^.Nome
                                                    + ' - ' + Ponteiro^.Email;
  end;
  // Limpa edits
  edtNome.Text := EmptyStr;
  edtEmail.Text := EmptyStr;
  
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  listaCadastrados:=TList.Create; //Cria lista de cadastrados.
end;

procedure TForm1.btnConferirClick(Sender: TObject);
var
  i:integer;
begin
   for i:=0 to listaCadastrados.Count -1 do
   begin
      Ponteiro:= listaCadastrados.Items[i];

      showmessage(
            IntToStr( listaCadastrados.IndexOf( Ponteiro ) )
            + ' - ' + IntToStr( Integer( Ponteiro ) )
            + ' - ' + Ponteiro^.Nome
            + ' - ' + Ponteiro^.Email ); 
   end;
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
   BtnModificar.Visible := True;
   try
      // A variável ponteiro recebe o endereço de memória da estrutura guardada no Tlist.
      Ponteiro := listaCadastrados.Items[ListBox1.ItemIndex];
      EdtNome.Text := Ponteiro^.Nome;
      EdtEmail.Text := Ponteiro^.Email;
   except
      ShowMessage( 'Selecione um item.' );
   end;
end;

procedure TForm1.btnExcluirClick(Sender: TObject);
begin
   try
      listaCadastrados.Delete(ListBox1.ItemIndex);
      ListBox1.Items.Delete(ListBox1.ItemIndex);
   except
      on E : Exception do Abort;
   end;
end;

procedure TForm1.btnModificarClick(Sender: TObject);
begin
    // Operacao(False) - indica que está alterando um item
   Operacao(False);
   BtnModificar.Visible := False;
end;

procedure TForm1.btnAdicionarClick(Sender: TObject);
begin
   // Operacao(True) - Indica que está adicionando item
   Operacao(True);
end;

end.
