program ExemploDecorator;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Component in 'Pattern.Component.pas',
  Pattern.ConcreteComponent in 'Pattern.ConcreteComponent.pas',
  Pattern.Decorator in 'Pattern.Decorator.pas',
  Pattern.Decorator.DataHora in 'Pattern.Decorator.DataHora.pas',
  Pattern.Decorator.NomeUsuario in 'Pattern.Decorator.NomeUsuario.pas',
  Pattern.Decorator.VersaoWindows in 'Pattern.Decorator.VersaoWindows.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Decorator';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
