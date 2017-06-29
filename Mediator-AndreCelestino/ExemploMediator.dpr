program ExemploMediator;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  View.CadastroMembro in 'View.CadastroMembro.pas' {fCadastroMembro},
  Pattern.Mediator in 'Pattern.Mediator.pas',
  Pattern.ConcreteMediator in 'Pattern.ConcreteMediator.pas',
  Pattern.Colleague in 'Pattern.Colleague.pas',
  Pattern.ColleagueUsuario in 'Pattern.ColleagueUsuario.pas',
  Pattern.ColleagueAdministrador in 'Pattern.ColleagueAdministrador.pas';
  

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.CreateForm(TfCadastroMembro, fCadastroMembro);
  Application.Run;
end.
