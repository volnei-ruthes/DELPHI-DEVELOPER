unit uCliente;

interface

type
  TCliente = class
  private
    FIdCliente: integer;
    FNome: string;
    FCNPJ: string;
    procedure SetCNPJ(const Value: string);
    procedure SetIdCliente(const Value: integer);
    procedure SetNome(const Value: string);

  protected

  public
    constructor Create; 
    destructor Destroy; override;

    property IdCliente: integer read FIdCliente write SetIdCliente;
    property Nome: string read FNome write SetNome;
    property CNPJ: string read FCNPJ write SetCNPJ;
  published 

  end;




implementation

{ TCliente }

constructor TCliente.Create;
begin
  inherited;

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

procedure TCliente.SetCNPJ(const Value: string);
begin
  FCNPJ := Value;
end;

procedure TCliente.SetIdCliente(const Value: integer);
begin
  FIdCliente := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
