program ExemploInterpreter;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uContext in 'uContext.pas',
  uAbstractExpression in 'uAbstractExpression.pas',
  uTerminalExpression in 'uTerminalExpression.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Interpreter';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
