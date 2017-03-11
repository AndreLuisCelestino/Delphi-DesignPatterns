program ExemploFacade;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uFacade in 'uFacade.pas',
  uWSDL_BCB in 'uWSDL_BCB.pas',
  uSubsystemCotacaoDolar in 'uSubsystemCotacaoDolar.pas',
  uSubsystemCalculoLoja in 'uSubsystemCalculoLoja.pas',
  uSubsystemHistorico in 'uSubsystemHistorico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Façade';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
