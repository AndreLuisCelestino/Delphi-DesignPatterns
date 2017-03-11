program FactoryMethod;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uTipoPrazos in 'uTipoPrazos.pas',
  uInterfaces in 'uInterfaces.pas',
  uFabricaPrazos in 'uFabricaPrazos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Factory Method';
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
