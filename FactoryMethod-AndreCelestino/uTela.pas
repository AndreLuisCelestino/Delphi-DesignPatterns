unit uTela;

{
  Exemplo de Chain of Factory Method com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfTela = class(TForm)
    ComboBoxPrazoPagamento: TComboBox;
    EditValor: TEdit;
    LabelValor: TLabel;
    LabelPrazoPagamento: TLabel;
    BitBtnGerarProjecao: TBitBtn;
    Memo: TMemo;
    LabelQtdeParcelas: TLabel;
    EditQtdeParcelas: TEdit;
    procedure BitBtnGerarProjecaoClick(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
    procedure EditQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
  end;

var
  fTela: TfTela;

implementation

uses
  System.UITypes, uInterfaces, uFabricaPrazos;

{$R *.dfm}

procedure TfTela.BitBtnGerarProjecaoClick(Sender: TObject);
var
  FabricaPrazos: IFactoryMethod;
  TipoPrazo: ITipoPrazo;
  Valor: real;
  QtdeParcelas: integer;
begin
  // valida se o tipo de prazo foi informado
  if ComboBoxPrazoPagamento.ItemIndex < 0 then
  begin
    MessageDlg('Selecione o prazo de pagamento.', mtInformation, [mbOK], 0);
    ComboBoxPrazoPagamento.DroppedDown := True;
    Exit;
  end;

  // cria a fábrica (Factory Method)
  FabricaPrazos := TFabricaPrazos.Create;
  // retorna um objeto de tipo de prazo de acordo com o tipo de prazo
  TipoPrazo := FabricaPrazos.ConsultarPrazo(ComboBoxPrazoPagamento.Text);

  // alimenta as variáveis
  Valor := StrToFloatDef(EditValor.Text, 0);
  QtdeParcelas := StrToIntDef(EditQtdeParcelas.Text, 0);

  // consulta o conteúdo do tipo de prazo retornado pela fábrica
  Memo.Lines.Clear;
  Memo.Lines.Add(TipoPrazo.ConsultarDescricao);
  Memo.Lines.Add(TipoPrazo.ConsultarJuros);
  Memo.Lines.Add(TipoPrazo.ConsultarProjecao(Valor, QtdeParcelas));
  Memo.Lines.Add(TipoPrazo.ConsultarTotal);
end;

procedure TfTela.EditValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

procedure TfTela.EditQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8])) then
    Key := #0;
end;

end.
