program ExemploTemplateMethod;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.AbstractClass in 'Pattern.AbstractClass.pas',
  Pattern.ConcreteClassRepositories in 'Pattern.ConcreteClassRepositories.pas',
  Pattern.ConcreteClassUsers in 'Pattern.ConcreteClassUsers.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
