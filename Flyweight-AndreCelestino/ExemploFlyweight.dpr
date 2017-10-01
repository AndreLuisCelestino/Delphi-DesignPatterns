program ExemploFlyweight;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Flyweight in 'Pattern.Flyweight.pas',
  Pattern.ConcreteFlyweight in 'Pattern.ConcreteFlyweight.pas',
  Pattern.FlyweightFactory in 'Pattern.FlyweightFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Flyweight';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
