program ExemploSingleton;

uses
  Forms,
  View.Formulario in 'View.Formulario.pas' {fTela},
  View.Cadastro in 'View.Cadastro.pas' {fCadastro},
  View.Sorteio in 'View.Sorteio.pas' {fSorteio},
  Pattern.Singleton in 'Pattern.Singleton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Singleton - Andr� Celestino';
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
