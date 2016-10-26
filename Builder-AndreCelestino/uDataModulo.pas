unit uDataModulo;

interface

uses
  SysUtils, Classes, DB, DBClient;

type
  TdmProdutos = class(TDataModule)
    cdsProdutos: TClientDataSet;
    cdsProdutosCodigo: TIntegerField;
    cdsProdutosDescricao: TStringField;
    cdsProdutosValor: TFloatField;
  public
    function ConsultarValorProduto(const psProduto: string): real;
  end;

var
  dmProdutos: TdmProdutos;

implementation

{$R *.dfm}

{ TdmProdutos }

function TdmProdutos.ConsultarValorProduto(const psProduto: string): real;
begin
  result := 0;
  dmProdutos.cdsProdutos.DisableControls;

  if dmProdutos.cdsProdutos.Locate('Descricao', psProduto, []) then
  begin
    result := dmProdutos.cdsProdutos.FieldByName('Valor').AsFloat;
  end;

  dmProdutos.cdsProdutos.First;
  dmProdutos.cdsProdutos.EnableControls;
end;

end.
