program ExemploFlyweight;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uFlyweight in 'uFlyweight.pas',
  uConcreteFlyweight in 'uConcreteFlyweight.pas',
  uFlyweightFactory in 'uFlyweightFactory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Flyweight';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
