program ExemploIterator;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Iterator in 'Pattern.Iterator.pas',
  Pattern.ConcreteIterator in 'Pattern.ConcreteIterator.pas',
  Pattern.Aggregate in 'Pattern.Aggregate.pas',
  Pattern.ConcreteAggregateXML in 'Pattern.ConcreteAggregateXML.pas',
  Pattern.ConcreteAggregateCSV in 'Pattern.ConcreteAggregateCSV.pas',
  Model.Cliente in 'Model.Cliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
