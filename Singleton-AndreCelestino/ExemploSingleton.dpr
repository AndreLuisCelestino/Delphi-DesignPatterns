program ExemploSingleton;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  View.Cadastro in 'View.Cadastro.pas' {fCadastro},
  View.Sorteio in 'View.Sorteio.pas' {fSorteio},
  Pattern.Singleton in 'Pattern.Singleton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Singleton - André Celestino';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
