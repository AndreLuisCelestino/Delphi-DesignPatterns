unit uProduto;

interface

uses
  Classes, uInterfaces;

type
  // implementação da interface ICestaProdutos
  TCestaProdutos = class(TInterfacedObject, ICestaProdutos)
  private
    // armazena a lista de produtos da cesta
    FslListaProdutos: TStringList;

    // armazena o valor total da cesta
    FnValorTotalCesta: real;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarProdutoNaCesta(const psProduto: string); virtual;
    function ObterListaProdutos: string;
    function ObterValorTotalCesta: string;
  end;

implementation

uses
  SysUtils, uDataModulo;

{ TCesta }

procedure TCestaProdutos.AdicionarProdutoNaCesta(const psProduto: string);
var
  nValorProduto: real;
begin
  // consulta o valor do produto
  nValorProduto := dmProdutos.ConsultarValorProduto(psProduto);

  // atualiza o valor total da cesta
  FnValorTotalCesta := FnValorTotalCesta + nValorProduto;

  // adiciona o produto na lista de produtos
  FslListaProdutos.Add(Format('Produto: %s - %.2f', [psProduto, nValorProduto]));
end;

constructor TCestaProdutos.Create;
begin
  FslListaProdutos := TStringList.Create;
  FnValorTotalCesta := 0;
end;

destructor TCestaProdutos.Destroy;
begin
  FreeAndNil(FslListaProdutos);
  inherited;
end;

function TCestaProdutos.ObterListaProdutos: string;
begin
  result := FslListaProdutos.Text;
end;

function TCestaProdutos.ObterValorTotalCesta: string;
begin
  result := 'Total: ' + Format('%.2f', [FnValorTotalCesta]);
end;

end.
