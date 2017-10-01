unit View.Formulario;

{
  Exemplo de Interpreter com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Grids, DBGrids, Buttons, Contnrs;

type
  { Client }
  TfFormulario = class(TForm)
    LabelInstrucao: TLabel;
    LabelSQL: TLabel;
    EditInstrucao: TEdit;
    GroupBox1: TGroupBox;
    BitBtnInterpretar: TBitBtn;
    EditExemplo1: TEdit;
    EditExemplo3: TEdit;
    EditExemplo2: TEdit;
    EditExemplo4: TEdit;
    EditSaida: TEdit;
    procedure BitBtnInterpretarClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Pattern.Context, Pattern.AbstractExpression, Pattern.TerminalExpression;

{$R *.dfm}

procedure TfFormulario.BitBtnInterpretarClick(Sender: TObject);
var
  Contexto: TContext;
  ArvoreSintatica: TObjectList;
  Contador: integer;
begin
  // Cria o contexto
  Contexto := TContext.Create;

  // Cria a árrvore sintática
  ArvoreSintatica := TObjectList.Create;
  try
    // Preenche a entrada do contexto
    Contexto.Entrada := EditInstrucao.Text;

    // Configura a árrvore sintática com as expressões
    ArvoreSintatica.Add(TComandoExpression.Create);
    ArvoreSintatica.Add(TColunasExpression.Create);
    ArvoreSintatica.Add(TTabelaExpression.Create);
    ArvoreSintatica.Add(TCondicaoExpression.Create);

    // Percorre as expressões para traduzir a entrada em instrução SQL
    for Contador := 0 to Pred(ArvoreSintatica.Count) do
      TAbstractExpression(ArvoreSintatica[Contador]).Interpretar(Contexto);

    // Exibe a saída do contexto (SQL)
    EditSaida.Text := Contexto.Saida;
  finally
    // Libera as variáveis da memória
    FreeAndNil(ArvoreSintatica);
    FreeAndNil(Contexto);
  end;
end;

end.
