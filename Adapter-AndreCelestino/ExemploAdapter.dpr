program ExemploAdapter;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uWSDL_Correios in 'uWSDL_Correios.pas',
  uComunicador in 'uComunicador.pas',
  uAdapter in 'uAdapter.pas',
  uInterfaceViaCEP in 'uInterfaceViaCEP.pas',
  uWebServiceViaCEP in 'uWebServiceViaCEP.pas',
  uWebServiceCorreios in 'uWebServiceCorreios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Adapter';
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
