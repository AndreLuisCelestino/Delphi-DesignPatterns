program ExemploProxy;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Subject in 'Pattern.Subject.pas',
  Pattern.Proxy in 'Pattern.Proxy.pas',
  Pattern.RealSubject in 'Pattern.RealSubject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Proxy';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
