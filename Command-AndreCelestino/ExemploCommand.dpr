program ExemploCommand;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Invoker in 'Pattern.Invoker.pas',
  Pattern.Command in 'Pattern.Command.pas',
  Pattern.Receiver in 'Pattern.Receiver.pas',
  Pattern.ConcreteCommand in 'Pattern.ConcreteCommand.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Command';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
