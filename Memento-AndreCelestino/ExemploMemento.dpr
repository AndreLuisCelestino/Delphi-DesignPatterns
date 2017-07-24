program ExemploMemento;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Memento in 'Pattern.Memento.pas',
  Pattern.Originator in 'Pattern.Originator.pas',
  Pattern.Caretaker in 'Pattern.Caretaker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
