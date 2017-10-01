program ExemploFacade;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Facade in 'Pattern.Facade.pas',
  WebService.BCB in 'WebService.BCB.pas',
  Pattern.Subsystem.CotacaoDolar in 'Pattern.Subsystem.CotacaoDolar.pas',
  Pattern.Subsystem.CalculoLoja in 'Pattern.Subsystem.CalculoLoja.pas',
  Pattern.Subsystem.Historico in 'Pattern.Subsystem.Historico.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Façade';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
