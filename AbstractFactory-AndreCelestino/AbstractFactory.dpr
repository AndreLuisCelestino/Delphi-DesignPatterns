program AbstractFactory;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.AbstractFactory in 'Pattern.AbstractFactory.pas',
  Pattern.AbstractProduct in 'Pattern.AbstractProduct.pas',
  Pattern.ConcreteFactory in 'Pattern.ConcreteFactory.pas',
  Pattern.Product.Notebooks in 'Pattern.Product.Notebooks.pas',
  Pattern.Product.Desktops in 'Pattern.Product.Desktops.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Abstract Factory - André Celestino';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
