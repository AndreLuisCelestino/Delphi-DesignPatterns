program ExemploState;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Context in 'Pattern.Context.pas',
  Pattern.State in 'Pattern.State.pas',
  Pattern.StateBronze in 'Pattern.StateBronze.pas',
  Pattern.StatePrata in 'Pattern.StatePrata.pas',
  Pattern.StateOuro in 'Pattern.StateOuro.pas',
  Utils.Enumerated in 'Utils.Enumerated.pas',
  Pattern.StateBase in 'Pattern.StateBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
