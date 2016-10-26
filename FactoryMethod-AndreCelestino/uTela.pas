unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfTela = class(TForm)
    cmbPrazoPagamento: TComboBox;
    edtValor: TEdit;
    lbValor: TLabel;
    lbPrazoPagamento: TLabel;
    btnGerarProjecao: TBitBtn;
    Memo: TMemo;
    lbQtdeParcelas: TLabel;
    edtQtdeParcelas: TEdit;
    procedure btnGerarProjecaoClick(Sender: TObject);
    procedure edtValorKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
  end;

var
  fTela: TfTela;

implementation

uses
  uInterfaces, uFabricaPrazos;

{$R *.dfm}

procedure TfTela.btnGerarProjecaoClick(Sender: TObject);
var
  FabricaPrazos: IFactoryMethod;
  TipoPrazo: ITipoPrazo;
  nValor: real;
  nQtdeParcelas: integer;
begin
  // valida se o tipo de prazo foi informado
  if cmbPrazoPagamento.ItemIndex < 0 then
  begin
    MessageDlg('Selecione o prazo de pagamento.', mtInformation, [mbOK], 0);
    cmbPrazoPagamento.DroppedDown := True;
    Exit;
  end;

  // cria a fábrica (Factory Method)
  FabricaPrazos := TFabricaPrazos.Create;
  // retorna um objeto de tipo de prazo de acordo com o tipo de prazo
  TipoPrazo := FabricaPrazos.ConsultarPrazo(cmbPrazoPagamento.Text);

  // alimenta as variáveis
  nValor := StrToFloatDef(edtValor.Text, 0);
  nQtdeParcelas := StrToIntDef(edtQtdeParcelas.Text, 0);

  // consulta o conteúdo do tipo de prazo retornado pela fábrica
  Memo.Lines.Clear;
  Memo.Lines.Add(TipoPrazo.ConsultarDescricao);
  Memo.Lines.Add(TipoPrazo.ConsultarJuros);
  Memo.Lines.Add(TipoPrazo.ConsultarProjecao(nValor, nQtdeParcelas));
  Memo.Lines.Add(TipoPrazo.ConsultarTotal);
end;

procedure TfTela.edtValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, #44, '0'..'9']) then
  begin
    Key := #0;
  end;
end;

procedure TfTela.edtQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then
  begin
    Key := #0;
  end;
end;

end.
