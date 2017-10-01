unit View.Formulario;

{
  Exemplo de Interpreter com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
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

  // Cria a �rrvore sint�tica
  ArvoreSintatica := TObjectList.Create;
  try
    // Preenche a entrada do contexto
    Contexto.Entrada := EditInstrucao.Text;

    // Configura a �rrvore sint�tica com as express�es
    ArvoreSintatica.Add(TComandoExpression.Create);
    ArvoreSintatica.Add(TColunasExpression.Create);
    ArvoreSintatica.Add(TTabelaExpression.Create);
    ArvoreSintatica.Add(TCondicaoExpression.Create);

    // Percorre as express�es para traduzir a entrada em instru��o SQL
    for Contador := 0 to Pred(ArvoreSintatica.Count) do
      TAbstractExpression(ArvoreSintatica[Contador]).Interpretar(Contexto);

    // Exibe a sa�da do contexto (SQL)
    EditSaida.Text := Contexto.Saida;
  finally
    // Libera as vari�veis da mem�ria
    FreeAndNil(ArvoreSintatica);
    FreeAndNil(Contexto);
  end;
end;

end.
