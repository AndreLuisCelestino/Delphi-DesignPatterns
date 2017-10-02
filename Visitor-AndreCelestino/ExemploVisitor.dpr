program ExemploVisitor;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Visitor in 'Pattern.Visitor.pas',
  Pattern.Element in 'Pattern.Element.pas',
  Pattern.ConcreteElement in 'Pattern.ConcreteElement.pas',
  Pattern.ConcreteElement.Programador in 'Pattern.ConcreteElement.Programador.pas',
  Pattern.ConcreteElement.Gerente in 'Pattern.ConcreteElement.Gerente.pas',
  Pattern.ConcreteVisitor.Salario in 'Pattern.ConcreteVisitor.Salario.pas',
  Pattern.ConcreteVisitor.Senioridade in 'Pattern.ConcreteVisitor.Senioridade.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Visitor - André Celestino';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
