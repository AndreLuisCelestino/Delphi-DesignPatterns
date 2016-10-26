unit uBuilder;

interface

uses
  uInterfaces;        

type
  // implementação da interface ICestaBuilder
  TCestaBuilder = class(TInterfacedObject, ICestaBuilder)
  public
    function MontarCestaBasica: ICestaProdutos;
    function MontarCestaCompleta: ICestaProdutos;
    function MontarCestaEspecial: ICestaProdutos;
  end;

implementation

uses
  uProduto;

function TCestaBuilder.MontarCestaBasica: ICestaProdutos;
var
  Cesta: ICestaProdutos;
begin
  Cesta := TCestaProdutos.Create;
  Cesta.AdicionarProdutoNaCesta('Arroz');
  Cesta.AdicionarProdutoNaCesta('Feijão');
  Cesta.AdicionarProdutoNaCesta('Macarrão');
  Cesta.AdicionarProdutoNaCesta('Óleo');
  result := Cesta;
end;

function TCestaBuilder.MontarCestaCompleta: ICestaProdutos;
var
  Cesta: ICestaProdutos;
begin
  Cesta := TCestaProdutos.Create;
  Cesta.AdicionarProdutoNaCesta('Arroz');
  Cesta.AdicionarProdutoNaCesta('Feijão');
  Cesta.AdicionarProdutoNaCesta('Açúcar');
  Cesta.AdicionarProdutoNaCesta('Óleo');
  Cesta.AdicionarProdutoNaCesta('Refrigerante');
  Cesta.AdicionarProdutoNaCesta('Leite');
  Cesta.AdicionarProdutoNaCesta('Café');
  result := Cesta;
end;

function TCestaBuilder.MontarCestaEspecial: ICestaProdutos;
var
  Cesta: ICestaProdutos;
begin
  Cesta := TCestaProdutos.Create;
  Cesta.AdicionarProdutoNaCesta('Arroz');
  Cesta.AdicionarProdutoNaCesta('Feijão');
  Cesta.AdicionarProdutoNaCesta('Ravioli');
  Cesta.AdicionarProdutoNaCesta('Caixa de Bombons');
  Cesta.AdicionarProdutoNaCesta('Champanhe');
  Cesta.AdicionarProdutoNaCesta('Panetone');
  result := Cesta;
end;

end.
