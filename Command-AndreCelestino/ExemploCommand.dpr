program ExemploCommand;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uInvoker in 'uInvoker.pas',
  uCommand in 'uCommand.pas',
  uReceiver in 'uReceiver.pas',
  uConcreteCommand in 'uConcreteCommand.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
