program ExemploInterpreter;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Context in 'Pattern.Context.pas',
  Pattern.AbstractExpression in 'Pattern.AbstractExpression.pas',
  Pattern.TerminalExpression in 'Pattern.TerminalExpression.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Interpreter';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
