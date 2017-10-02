program Prototype;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Prototype in 'Pattern.Prototype.pas',
  Pattern.ConcretePrototype in 'Pattern.ConcretePrototype.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Prototype - André Celestino';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
