unit uModelTPessoa;

interface

type
  TPessoa = class
  private
    FNome: string;
    procedure SetNome(const Value: string);
  public
    procedure Dialog;
    constructor create; overload;
    constructor create(uNome:String); overload;  //sobrecarreguei o metodo para permitir criar e preencher o objeto direto no create (menos codigo na view).
    property Nome:string read FNome write SetNome;
  end;

implementation

{ TPessoa }

constructor TPessoa.create;
begin

end;

constructor TPessoa.create(uNome: String);
begin
  FNome:= uNome;
end;

procedure TPessoa.Dialog;
begin

end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
