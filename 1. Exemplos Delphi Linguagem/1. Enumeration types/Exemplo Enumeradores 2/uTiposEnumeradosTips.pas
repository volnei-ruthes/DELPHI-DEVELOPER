unit uTiposEnumeradosTips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, typinfo, StdCtrls;

type
  //Tipo Enumerado.
  TEDiasSemanas = (Domingo, Segunda, Terca, Quarta, Quinta, Sexta, Sabado);


  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);

          procedure PopularCombo(combo: TComboBox);
          var
            Dias : TEDiasSemanas;
          begin
            Combo.Clear;
            for Dias := Domingo to Sabado do
              Combo.Items.Add(GetEnumName(TypeInfo(TEDiasSemanas),Integer(Dias)));
          end;
begin
   //1. Popular combobox com Enumarado (**usar o typinfo na uses.)
   PopularCombo(ComboBox1);
end;

procedure TForm1.Button1Click(Sender: TObject);

    //Com IF reduzido.
    function verificaFimSemana2(dia: TEDiasSemanas): boolean;
    begin
      result := not (dia in ([Segunda..Sexta]));
    end;

begin

   if verificaFimSemana2(TEDiasSemanas(ComboBox1.ItemIndex)) = true then
   begin
     showmessage('hora de descansar um pouco...');
   end else begin
     showmessage('Continue trabalhando dedicado');
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  diaQualquer : TEDiasSemanas;
begin
   //2. Verifica se ? fim de semana.
   diaQualquer :=  Sabado;
   if diaQualquer = Segunda then begin
      showmessage('E fim de semana');
   end else begin
      showmessage('NAO E fim de semana');
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
    //Com CASE.
    function verificaFimSemana(dia: TEDiasSemanas): boolean;
    begin
      case dia of
        Segunda..Sexta:
        begin
          result:= false;
        end else
        begin
          result:= true;
        end;
      end;
    end;

    //Com IF reduzido.
    function verificaFimSemana2(dia: TEDiasSemanas): boolean;
    begin
      result := not (dia in ([Segunda..Sexta]));
    end;
Var
  Dia: TEDiasSemanas;
begin
   //popular um combobox e verificar o selecionado por ex. mas simpliicando..   **usar o typinfo na uses.
   Dia := Sabado;
   if verificaFimSemana(Dia) then begin //Com o CASE     
     Showmessage( GetEnumName(TypeInfo(TEDiasSemanas),Integer(Dia)) + ' - indice: ' + inttostr(integer(Dia)) );
   end;

   Dia := Domingo;
   if verificaFimSemana2(Dia) then begin  //Com o If Simplificado
      Showmessage( GetEnumName(TypeInfo(TEDiasSemanas),Integer(Dia)) + ' - indice: ' + inttostr(integer(Dia)) );
   end;
end;

end.


















