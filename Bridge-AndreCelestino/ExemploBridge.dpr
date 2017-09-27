program ExemploBridge;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Implementor in 'Pattern.Implementor.pas',
  Pattern.ConcreteImplementorXLS in 'Pattern.ConcreteImplementorXLS.pas',
  Pattern.ConcreteImplementorHTML in 'Pattern.ConcreteImplementorHTML.pas',
  Pattern.Abstraction in 'Pattern.Abstraction.pas',
  Pattern.RefinedAbstractionClientes in 'Pattern.RefinedAbstractionClientes.pas',
  Pattern.RefinedAbstractionProdutos in 'Pattern.RefinedAbstractionProdutos.pas';
  

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Bridge';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
