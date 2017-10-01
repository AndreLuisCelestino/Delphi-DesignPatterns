program ExemploAdapter;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Interfaces.ViaCEP in 'Interfaces.ViaCEP.pas',
  WebServices.Correios in 'WebServices.Correios.pas',
  WebServices.ViaCEP in 'WebServices.ViaCEP.pas',
  Pattern.Target in 'Pattern.Target.pas',
  Pattern.Adapter in 'Pattern.Adapter.pas',
  Pattern.Adaptee in 'Pattern.Adaptee.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Adapter - André Celestino';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
