unit u_fluxoCaixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls;

type
  Tfrm_fluxoCaixa = class(TForm)
    DateTimePickerAbertura: TDateTimePicker;
    Label1: TLabel;
    GridCaixa: TDBGrid;
    btn_Relatorio: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure DateTimePickerAberturaChange(Sender: TObject);
    procedure btn_RelatorioClick(Sender: TObject);
  private
    { Private declarations }
    procedure buscarByData;
  public
    { Public declarations }
  end;

var
  frm_fluxoCaixa: Tfrm_fluxoCaixa;

implementation

{$R *.dfm}

uses u_geralHelper, u_dm, u_filtroRelatorios;

{ Tfrm_fluxoCaixa }

procedure Tfrm_fluxoCaixa.btn_RelatorioClick(Sender: TObject);
begin
  relatorioGeral.tipo := 'caixafluxo';
  frm_filtroRelatorios := Tfrm_filtroRelatorios.Create(self);
  frm_filtroRelatorios.ShowModal;
end;

procedure Tfrm_fluxoCaixa.buscarByData;
begin
  with dm.FDQueryCaixa do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT *, funcionarios.nome as funcAbertura, funcionarios.nome as funcOperador, usuarios.nome as gerenteAutorizador FROM caixa_pdv ');
    SQL.Add('INNER JOIN funcionarios ON funcionarios.id = caixa_pdv.funcionario_abertura');
    SQL.Add('INNER JOIN usuarios     ON usuarios.id = caixa_pdv.gerente_autorizador');
    SQL.Add('WHERE data_abertura = :pDataAbertura ORDER BY data_abertura DESC');
    ParamByName('pDataAbertura').Value := FormatDateTime('yyyy/mm/dd',DateTimePickerAbertura.Date);
    Open();
  end;
end;

procedure Tfrm_fluxoCaixa.DateTimePickerAberturaChange(Sender: TObject);
begin
   buscarByData;
end;

procedure Tfrm_fluxoCaixa.FormShow(Sender: TObject);
begin
  DateTimePickerAbertura.Date := Date;
  buscarByData;
end;

end.
