program ExemploComposite;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Component in 'Pattern.Component.pas',
  Pattern.Leaf in 'Pattern.Leaf.pas',
  Pattern.Composite in 'Pattern.Composite.pas',
  Singleton.Valores in 'Singleton.Valores.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Composite';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
