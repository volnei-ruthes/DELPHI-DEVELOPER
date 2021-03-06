unit uListaCliente;

interface

uses Classes, uCliente, Dialogs;

type
  TListaCliente = class
  private
    FListaCliente: TList;

  protected

  public
    constructor Create;
    destructor Destroy; override;
    procedure Adcionar(pCliente: TCliente);
    procedure Remover(pIndex: integer);
    function Count: integer;
  published 

  end;



implementation

{ TListaCliente }

procedure TListaCliente.Adcionar(pCliente: TCliente);
begin
   FListaCliente.Add(pCliente);
end;

function TListaCliente.Count: integer;
begin
   result:= FListaCliente.Count;
end;

constructor TListaCliente.Create;
begin
  inherited Create;
  FListaCliente:= TList.Create;
end;

destructor TListaCliente.Destroy;
begin

  inherited;
end;

procedure TListaCliente.Remover(pIndex: integer);
begin
  if pIndex < Count then
    FListaCliente.Delete(pIndex)
  else
    showmessage('Item n?o encontrado');
end;

end.
