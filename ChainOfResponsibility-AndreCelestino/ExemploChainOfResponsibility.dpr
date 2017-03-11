program ExemploChainOfResponsibility;

uses
  Vcl.Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uHandler in 'uHandler.pas',
  uConcreteHandler in 'uConcreteHandler.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Chain of Responsibility';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
