program ExemploComposite;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uComponent in 'uComponent.pas',
  uLeaf in 'uLeaf.pas',
  uComposite in 'uComposite.pas',
  uValoresSingleton in 'uValoresSingleton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Composite';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
