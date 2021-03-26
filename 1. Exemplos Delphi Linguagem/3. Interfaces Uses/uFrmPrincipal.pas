unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type

  //1. Interface (Contrato) Exemplo (é Reciclável)
  IisReciclavel = interface(IInterface)
    function getIsReciclavel : boolean;
    property isReciclavel : boolean read getIsReciclavel;
  end;

  //2. Classe Carro.
  TCarro = class(TInterfacedObject, IisReciclavel)
  private
    FAno: integer;
    FNome: string;
    CarroIsRecicle: boolean;
    procedure SetAno(const Value: integer);
    procedure SetNome(const Value: string);
    function getIsReciclavel : boolean;
  published
     //Propertys Classe Carro.
     property Nome: string read FNome write SetNome;
     property Ano: integer read FAno write SetAno;
     //Propertys Interface IisReciclavel (obrigatorio).
     property isReciclavel : boolean read getIsReciclavel;

     constructor Create(pNome:string);
  end;

  //2. Classe Bicicleta.
  TBicicleta = class(TInterfacedObject, IisReciclavel)
  private
    FTamanhoAro: integer;
    FNome: string;
    BicicletaIsReciclavel: boolean;
    procedure SetNome(const Value: string);
    procedure SetTamanhoAro(const Value: integer);
    function getIsReciclavel : boolean;
  published
    //Property Classe Bicicleta:
    property Nome: string read FNome write SetNome;
    property TamanhoAro: integer read FTamanhoAro write SetTamanhoAro;
    //Propertys Interface IisReciclavel (obrigatorio).
    property isReciclavel: boolean read getIsReciclavel;

    constructor Create(pNome:string; pTamanhoAro:integer);
  end;


  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Carro: TCarro;
  Bicicleta: TBicicleta;
  Resultado:String;

implementation

{$R *.dfm}


{ TCar }

constructor TCarro.Create(pNome: string);
begin
  Nome:= pNome;
  Ano:= 0;
  CarroIsRecicle:= false;
end;

function TCarro.getIsReciclavel: boolean;
begin
  result := CarroIsRecicle;
end;

procedure TCarro.SetAno(const Value: integer);
begin
  FAno := Value;
end;

procedure TCarro.SetNome(const Value: string);
begin
  FNome := Value;
end;

{ TBicicleta }

constructor TBicicleta.Create(pNome: string; pTamanhoAro:integer);
begin
  Nome:= pNome;
  TamanhoAro:=pTamanhoAro;
  BicicletaIsReciclavel:=true;
end;

function TBicicleta.getIsReciclavel: boolean;
begin
  result:= BicicletaIsReciclavel;
end;

procedure TBicicleta.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TBicicleta.SetTamanhoAro(const Value: integer);
begin
  FTamanhoAro := Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    try
      Carro:= TCarro.Create('Celta Furious');
      Carro.Ano:=2002;

      case ord(Carro.CarroIsRecicle) of
      1: Resultado:='Carro: '+'Ano/Modelo: '+Carro.Nome+#13+inttostr(Carro.Ano)+#13+'modelo reciclavel)';
      else
         Resultado:='Carro: '+'Ano/Modelo: '+Carro.Nome+#13+inttostr(Carro.Ano)+#13+'modelo não reciclavel';
      end;
      showmessage(Resultado);
    except
      on E: Exception do begin
        showmessage('Erro ao gerar classe Carro. '+E.Message);
      end;
    end;
  finally
    Carro.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   try
    try
      Bicicleta:= TBicicleta.Create('Monark XS',28);
      case ord(Bicicleta.BicicletaIsReciclavel) of
      1: Resultado:='Bicicleta: '+Bicicleta.Nome+#13+'Aro: '+inttostr(Bicicleta.TamanhoAro)+#13+'modelo: reciclavel)';
      else
         Resultado:='Bicicleta: '+Bicicleta.Nome+#13+'Aro: '+inttostr(Bicicleta.TamanhoAro)+#13+'modelo não reciclavel)';
      end;
      showmessage(Resultado);
    except
      on E: Exception do begin
        showmessage('Erro ao gerar classe Carro. '+E.Message);
      end;
    end;
  finally
    Bicicleta.Free;
  end;
end;

end.
