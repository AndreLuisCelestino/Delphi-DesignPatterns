program FactoryMethod;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Product in 'Pattern.Product.pas',
  Pattern.Creator in 'Pattern.Creator.pas',
  Pattern.ConcreteProduct in 'Pattern.ConcreteProduct.pas',
  Pattern.ConcreteCreator in 'Pattern.ConcreteCreator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Factory Method';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
