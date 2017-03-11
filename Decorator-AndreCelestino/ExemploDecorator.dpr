program ExemploDecorator;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uComponent in 'uComponent.pas',
  uConcreteComponent in 'uConcreteComponent.pas',
  uDecorator in 'uDecorator.pas',
  uDataHoraDecorator in 'uDataHoraDecorator.pas',
  uNomeUsuarioDecorator in 'uNomeUsuarioDecorator.pas',
  uVersaoWindowsDecorator in 'uVersaoWindowsDecorator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Decorator';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
