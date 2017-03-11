program AbstractFactory;

uses
  Forms,
  uTela in 'uTela.pas' {fAbstractFactory},
  uInterfaces in 'uInterfaces.pas',
  uMarcas in 'uMarcas.pas',
  uNotebooks in 'uNotebooks.pas',
  uDesktops in 'uDesktops.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Abstract Factory';
  Application.CreateForm(TfAbstractFactory, fAbstractFactory);
  Application.Run;
end.
