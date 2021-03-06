unit u_cancelaItemPDV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  Tfrm__cancelaItemPDV = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edt_cancelarItem: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //Aviso Sistema
  TAviso = class helper for TForm
    procedure AvisoAlerta(pMsg:PWideChar);
    procedure Aviso(pMsg:PWideChar);
  end;

var
  frm__cancelaItemPDV  : Tfrm__cancelaItemPDV;


implementation

{$R *.dfm}

uses u_geralHelper, u_dm;

{ TAviso }

procedure TAviso.Aviso(pMsg: PWideChar);
begin
  Application.MessageBox(pMsg,'Informa??o',MB_OK + MB_ICONINFORMATION)
end;

procedure TAviso.AvisoAlerta(pMsg:PWideChar);
begin
   //MessageDlg(pMsg,mtWarning,mbOKCancel,0);
   Application.MessageBox(pMsg,'Alerta!',MB_OK + MB_ICONWARNING)
end;

procedure Tfrm__cancelaItemPDV.FormKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);

{$REGION 'Atualiza Estoque Produto ap?s Exclus?o do Item'}
          procedure atualizaEstoquePosExclusaoPorItem;
          var
            EstoqueAtualProdutoBD, NewEstoque: integer;
          begin
            //1. Get Qtde Estoque Total no BD - PRODUTO.
            with dm.FDQuery_produtos do begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT estoque FROM produtos WHERE id = :pIdProduto');
              ParamByName('pIdProduto').Value := VendaItemProdutoPDV.idProduto;
              Open();
              EstoqueAtualProdutoBD := dm.FDQuery_produtos.FieldByName('estoque').Value;
            end;
            NewEstoque := EstoqueAtualProdutoBD + ItemExcluidoPDV.Qtde;  //Acrescenta a quantidade do item cancelado ao estoque.
            //2. Atualiza estoque produto + (Devolvendo o a quantidade do item cancelado).
            with dm.FDQuery_produtos do begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE produtos SET estoque = :pEstoque WHERE id = :pId');
              ParamByName('pEstoque').Value    := NewEstoque;
              ParamByName('pId').Value := VendaItemProdutoPDV.idProduto;
              ExecSQL;
            end;
          end;
{$ENDREGION}

begin
  If key = VK_RETURN then Begin //Enter.

     if edt_cancelarItem.isVazio then begin
        AvisoAlerta('? necessario digitar o c?digo do produto!');
        edt_cancelarItem.Clear;
        edt_cancelarItem.SetFocus;
        exit;
     end;

     if MessageDlg('Deseja excluir o item da venda?',mtConfirmation,[mbyes,mbno],0)= mryes then begin
        ItemExcluidoPDV.id := edt_cancelarItem.Text; //Id do item a excluir.
        with dm.FDQuerySuporte do begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM vendas_pdv_d WHERE id = :pId');
          ParamByName('pId').Value := ItemExcluidoPDV.id; //Id do item a excluir.
          Open();
        end;
        ItemExcluidoPDV.Qtde  := dm.FDQuerySuporte.FieldByName('quantidade').Value; //Antes de excluir pega a qtde para ser devolvida ao estoque produto.
        ItemExcluidoPDV.total := dm.FDQuerySuporte.FieldByName('total').Value;      //Ao excluir o item, ? necess?rio excluir este total do item do total da venda.
        if not(dm.FDQuerySuporte.IsEmpty) then  begin
          with dm.FDQuerySuporte do begin
            Close;
            SQL.Clear;
            SQL.Add('DELETE FROM vendas_pdv_d WHERE id = :pId');
            ParamByName('pId').Value := ItemExcluidoPDV.id;
            ExecSQL;
            Close;
          end;
          atualizaEstoquePosExclusaoPorItem; //Devolve para o Estoque em produtos a QTDE do ITEM cancelado.
          Close;
        end else begin
           AvisoAlerta('ID do item n?o corresponde ao grid da lista da venda');
           edt_cancelarItem.SetFocus;
        end;
     end;
  end;
end;

procedure Tfrm__cancelaItemPDV.FormShow(Sender: TObject);
begin
  edt_cancelarItem.SetFocus;
end;

end.
