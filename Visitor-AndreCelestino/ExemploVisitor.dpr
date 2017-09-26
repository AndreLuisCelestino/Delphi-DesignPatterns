program ExemploVisitor;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Visitor in 'Pattern.Visitor.pas',
  Pattern.Element in 'Pattern.Element.pas',
  Pattern.ConcreteElementProgramador in 'Pattern.ConcreteElementProgramador.pas',
  Pattern.ConcreteElementGerente in 'Pattern.ConcreteElementGerente.pas',
  Pattern.ConcreteVisitorSalario in 'Pattern.ConcreteVisitorSalario.pas',
  Pattern.ConcreteVisitorSenioridade in 'Pattern.ConcreteVisitorSenioridade.pas',
  Pattern.ConcreteElement in 'Pattern.ConcreteElement.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
