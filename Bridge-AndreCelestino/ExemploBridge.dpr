program ExemploBridge;

uses
  Forms,
  uFormulario in 'uFormulario.pas' {fFormulario},
  uInterfaceFormato in 'uInterfaceFormato.pas',
  uFormatoXLS in 'uFormatoXLS.pas',
  uFormatoHTML in 'uFormatoHTML.pas',
  uInterfaceExportador in 'uInterfaceExportador.pas',
  uExportadorClientes in 'uExportadorClientes.pas',
  uExportadorProdutos in 'uExportadorProdutos.pas';
  

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Bridge';
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
