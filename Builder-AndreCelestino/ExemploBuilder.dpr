program ExemploBuilder;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uDataModulo in 'uDataModulo.pas' {dmProdutos: TDataModule},
  uBuilder in 'uBuilder.pas',
  uInterfaces in 'uInterfaces.pas',
  uProduto in 'uProduto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmProdutos, dmProdutos);
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
