program ExemploSingleton;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uLoggerSingleton in 'uLoggerSingleton.pas',
  uCadastro in 'uCadastro.pas' {fCadastro},
  uSorteio in 'uSorteio.pas' {fSorteio};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
