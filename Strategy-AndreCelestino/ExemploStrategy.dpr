program ExemploStrategy;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Pattern.Context in 'Pattern.Context.pas',
  Pattern.Strategy in 'Pattern.Strategy.pas',
  Pattern.ConcreteStrategyDLL in 'Pattern.ConcreteStrategyDLL.pas',
  Pattern.ConcreteStrategyRegExLib in 'Pattern.ConcreteStrategyRegExLib.pas',
  Pattern.ConcreteStrategyMailBoxLayer in 'Pattern.ConcreteStrategyMailBoxLayer.pas',
  WebService.RegExLib in 'WebService.RegExLib.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
