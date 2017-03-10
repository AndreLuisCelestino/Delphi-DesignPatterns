unit uDataModulo;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TDataModuleProdutos = class(TDataModule)
    ClientDataSetProdutos: TClientDataSet;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosDescricao: TStringField;
    ClientDataSetProdutosValor: TFloatField;
  public
    function ConsultarValorProduto(const Produto: string): real;
  end;

var
  DataModuleProdutos: TDataModuleProdutos;

implementation

{$R *.dfm}

{ TdmProdutos }

function TDataModuleProdutos.ConsultarValorProduto(const Produto: string): real;
begin
  result := 0;
  ClientDataSetProdutos.DisableControls;

  if ClientDataSetProdutos.Locate('Descricao', Produto, []) then
  begin
    result := ClientDataSetProdutos.FieldByName('Valor').AsFloat;
  end;

  ClientDataSetProdutos.First;
  ClientDataSetProdutos.EnableControls;
end;

end.
