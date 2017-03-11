program ExemploProxy;

uses
  Vcl.Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uSubject in 'uSubject.pas',
  uProxy in 'uProxy.pas',
  uRealSubject in 'uRealSubject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Proxy';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
