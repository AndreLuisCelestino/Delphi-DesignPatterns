program ExemploBuilder;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uDataModulo in 'uDataModulo.pas' {DataModuleProdutos: TDataModule},
  uBuilder in 'uBuilder.pas',
  uInterfaces in 'uInterfaces.pas',
  uProduto in 'uProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModuleProdutos, DataModuleProdutos);
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
