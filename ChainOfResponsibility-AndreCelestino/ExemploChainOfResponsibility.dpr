program ExemploChainOfResponsibility;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Handler in 'Pattern.Handler.pas',
  Pattern.ConcreteHandler in 'Pattern.ConcreteHandler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Chain of Responsibility';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
