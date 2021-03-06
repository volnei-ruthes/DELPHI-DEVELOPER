unit u_movimentacoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls;

type
  TEnumTipoTotalizador = (tpEntrada, tpSaida);

  Tfrm_movimentacoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblTotal: TLabel;
    Label7: TLabel;
    lblVlrEntradas: TLabel;
    Label8: TLabel;
    lblVlrSaidas: TLabel;
    dataInicial: TDateTimePicker;
    gridMovimentos: TDBGrid;
    dataFinal: TDateTimePicker;
    cbEntradaSaida: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cbEntradaSaidaChange(Sender: TObject);
    procedure dataInicialChange(Sender: TObject);
    procedure dataFinalChange(Sender: TObject);
  private
    { Private declarations }
     procedure buscarTudo;
     procedure buscarData;
     procedure totalizarEntradaSaidas(pTipo: TEnumTipoTotalizador);
     procedure totalizarEntradas;
     procedure totalizarSaidas;
     procedure totalizar;
     procedure formatarGrid; //Formatar grid manualmente.
  public
    { Public declarations }
  end;



var
  frm_movimentacoes: Tfrm_movimentacoes;
  TotEntradas, TotSaidas: real;
  //TipoTotalizador : TEnumTipoTotalizador;


implementation

{$R *.dfm}

uses u_dm, u_geralHelper, TypInfo;

procedure Tfrm_movimentacoes.buscarData;
begin
  //1. Totalizadores
  totalizarEntradas;
  totalizarSaidas;
  totalizar;

  //2. Listar movimentações:
  dm.FDQueryMovimentos.Close;
  dm.FDQueryMovimentos.SQL.Clear;
  if cbEntradaSaida.Text = 'Tudo' then begin
    //dm.FDQueryMovimentos.SQL.Add('SELECT * FROM movimentacoes WHERE data >= :pDataInicial AND data <= :pDataFinal ORDER BY id DESC');
    dm.FDQueryMovimentos.SQL.Add('SELECT movimentacoes.id as id, tipo, movimento, valor, funcionarios.nome as funcionario, data FROM movimentacoes ');
    dm.FDQueryMovimentos.SQL.Add('INNER JOIN funcionarios ON funcionarios.id = movimentacoes.funcionario');
    dm.FDQueryMovimentos.SQL.Add('WHERE data >= :pDataInicial AND data <= :pDataFinal ORDER BY movimentacoes.id DESC');
  end else begin //Entrada ou Saida.
    dm.FDQueryMovimentos.SQL.Add('SELECT movimentacoes.id as id, tipo, movimento, valor, funcionarios.nome as funcionario, data FROM movimentacoes ');
    dm.FDQueryMovimentos.SQL.Add('INNER JOIN funcionarios ON funcionarios.id = movimentacoes.funcionario');
    dm.FDQueryMovimentos.SQL.Add('WHERE data >= :pDataInicial AND data <= :pDataFinal AND tipo = :pTipo ORDER BY movimentacoes.id DESC');
    dm.FDQueryMovimentos.ParamByName('pTipo').Value := cbEntradaSaida.Text;
  end;
  dm.FDQueryMovimentos.ParamByName('pDataInicial').Value := FormatDateTime('yyyy/mm/dd', dataInicial.Date);
  dm.FDQueryMovimentos.ParamByName('pDataFinal').Value   := FormatDateTime('yyyy/mm/dd', dataFinal.Date);
  dm.FDQueryMovimentos.Open();

  //Formato a coluna valor do grid em formato de reais (OU pode ir no dm e no field "valor", deixar a propriedade currency marcada)
  TFloatField( dm.FDQueryMovimentos.FieldByName('valor') ).DisplayFormat := 'R$ #,,,,0.00';

  //3. Formatar o Grid.
  formatarGrid;
end;

procedure Tfrm_movimentacoes.buscarTudo;
begin
  totalizarEntradas;
  totalizarSaidas;
  totalizar;

  with dm.FDQueryMovimentos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT movimentacoes.id as id, tipo, movimento, valor, funcionarios.nome as funcionario, data FROM movimentacoes ');
    SQL.Add('INNER JOIN funcionarios ON funcionarios.id = movimentacoes.funcionario');
    SQL.Add('WHERE data = curDate() ORDER BY movimentacoes.id DESC');
    Open();
  end;

  //Formato a coluna valor do grid em formato de reais (OU pode ir no dm e no field "valor", deixar a propriedade currency marcada)
  TFloatField( dm.FDQueryMovimentos.FieldByName('valor') ).DisplayFormat := 'R$ #,,,,0.00';

  formatarGrid;
end;

procedure Tfrm_movimentacoes.cbEntradaSaidaChange(Sender: TObject);
begin
  buscarData;
end;

procedure Tfrm_movimentacoes.dataFinalChange(Sender: TObject);
begin
  buscarData;
end;

procedure Tfrm_movimentacoes.dataInicialChange(Sender: TObject);
begin
  buscarData;
end;

procedure Tfrm_movimentacoes.formatarGrid;
begin
  //1. coluna: ID
  gridMovimentos.Columns.Items[0].FieldName     := 'id';
  gridMovimentos.Columns.Items[0].Title.Caption := 'Id';
  gridMovimentos.Columns.Items[0].Visible       := false;
  gridMovimentos.Columns[0].Alignment           := taCenter;
  //2. coluna: Tipo
  gridMovimentos.Columns.Items[1].FieldName     := 'tipo';
  gridMovimentos.Columns.Items[1].Title.Caption := 'Tipo';
  gridMovimentos.Columns.Items[1].Width         := 80;
  //3. coluna: Movimento
  gridMovimentos.Columns.Items[2].FieldName     := 'movimento';
  gridMovimentos.Columns.Items[2].Title.Caption := 'Movimento';
  gridMovimentos.Columns.Items[2].Width         := 80;
  //4. coluna: Valor
  gridMovimentos.Columns.Items[3].FieldName     := 'valor';
  gridMovimentos.Columns.Items[3].Title.Caption := 'Valor';
  gridMovimentos.Columns.Items[3].Width         := 80;
  gridMovimentos.Columns[3].Alignment           := taCenter;
  //5. coluna: movimentacoes Funcionario
  gridMovimentos.Columns.Items[4].FieldName     := 'funcionario';
  gridMovimentos.Columns.Items[4].Title.Caption := 'Funcionário';
  gridMovimentos.Columns.Items[4].Width         := 200;
  //6. coluna: Data
  gridMovimentos.Columns.Items[5].FieldName     := 'data';
  gridMovimentos.Columns.Items[5].Title.Caption := 'Data';
  gridMovimentos.Columns.Items[5].Width         := 80;
  gridMovimentos.Columns[5].Alignment           := taCenter;
end;

procedure Tfrm_movimentacoes.FormShow(Sender: TObject);
begin
  //Formata as Labels abaixo do grid e demais componentes.
  lblVlrEntradas.Caption := FormatFloat('R$ #,,,,0.00', strToFloat(lblVlrEntradas.Caption));
  lblVlrSaidas.Caption   := FormatFloat('R$ #,,,,0.00', strToFloat(lblVlrSaidas.Caption));
  lblTotal.Caption       := FormatFloat('R$ #,,,,0.00', strToFloat(lblTotal.Caption));
  cbEntradaSaida.ItemIndex := 0;
  dataInicial.Date := Date;
  dataFinal.Date   := Date;

  totalizarEntradas;
  totalizarSaidas;
  totalizar;
  buscarTudo;
end;

procedure Tfrm_movimentacoes.totalizar;
var
  tot: real;
begin
  tot := TotEntradas - TotSaidas;
  if tot >= 0 then begin
    lblTotal.Font.Color := clBlue;
  end else begin
    lblTotal.Font.Color := clRed;
  end;
  lblTotal.Caption := FormatFloat('R$ #,,,,0.00', tot);
end;

procedure Tfrm_movimentacoes.totalizarEntradas;
begin
  totalizarEntradaSaidas(tpEntrada);
end;

procedure Tfrm_movimentacoes.totalizarEntradaSaidas(pTipo: TEnumTipoTotalizador);
var
  total: real;
begin
  //Obs para o uso de funções de banco é necessário não ter fields na query DM e montar o grid manualmente para evitar erro.
  with dm.FDQueryMovimentos do begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT sum(valor) as total FROM movimentacoes WHERE data >= :pDataInicial AND data <= :pDataFinal AND tipo = :pTipo');
    ParamByName('pDataInicial').Value :=  FormatDateTime('yyyy/mm/dd', dataInicial.Date);
    ParamByName('pDataFinal').Value   :=  FormatDateTime('yyyy/mm/dd', dataFinal.Date);
    ParamByName('pTipo').Value       :=  If_s(pTipo = tpEntrada,'Entrada','Saida' );
    Open;
  end;
  total := dm.FDQueryMovimentos.FieldByName('total').AsFloat;
  if (pTipo = tpEntrada) then begin
    TotEntradas := total;
    lblVlrEntradas.Caption := FormatFloat('R$ #,,,,0.00', total);
  end
  else
  if (pTipo = tpSaida) then begin
    TotSaidas := total;
    lblVlrSaidas.Caption := FormatFloat('R$ #,,,,0.00', total);
  end;
end;

procedure Tfrm_movimentacoes.totalizarSaidas;
begin
  totalizarEntradaSaidas(tpSaida);
end;

end.
