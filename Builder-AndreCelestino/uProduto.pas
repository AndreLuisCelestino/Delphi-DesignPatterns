unit uProduto;

interface

uses
  Classes, uInterfaces;

type
  // implementação da interface ICestaProdutos
  TCestaProdutos = class(TInterfacedObject, ICestaProdutos)
  private
    // armazena a lista de produtos da cesta
    ListaProdutos: TStringList;

    // armazena o valor total da cesta
    ValorTotalCesta: real;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarProdutoNaCesta(const Produto: string); virtual;
    function ObterListaProdutos: string;
    function ObterValorTotalCesta: string;
  end;

implementation

uses
  SysUtils, uDataModulo;

{ TCesta }

procedure TCestaProdutos.AdicionarProdutoNaCesta(const Produto: string);
var
  ValorProduto: real;
begin
  // consulta o valor do produto
  ValorProduto := DataModuleProdutos.ConsultarValorProduto(Produto);

  // atualiza o valor total da cesta
  ValorTotalCesta := ValorTotalCesta + ValorProduto;

  // adiciona o produto na lista de produtos
  ListaProdutos.Add(Format('Produto: %s - %.2f', [Produto, ValorProduto]));
end;

constructor TCestaProdutos.Create;
begin
  ListaProdutos := TStringList.Create;
  ValorTotalCesta := 0;
end;

destructor TCestaProdutos.Destroy;
begin
  FreeAndNil(ListaProdutos);
  inherited;
end;

function TCestaProdutos.ObterListaProdutos: string;
begin
  result := ListaProdutos.Text;
end;

function TCestaProdutos.ObterValorTotalCesta: string;
begin
  result := 'Total: ' + Format('%.2f', [ValorTotalCesta]);
end;

end.
