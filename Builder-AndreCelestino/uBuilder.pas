unit uBuilder;

interface

uses
  uInterfaces;        

type
  // implementa��o da interface ICestaBuilder
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
  Cesta.AdicionarProdutoNaCesta('Feij�o');
  Cesta.AdicionarProdutoNaCesta('Macarr�o');
  Cesta.AdicionarProdutoNaCesta('�leo');
  result := Cesta;
end;

function TCestaBuilder.MontarCestaCompleta: ICestaProdutos;
var
  Cesta: ICestaProdutos;
begin
  Cesta := TCestaProdutos.Create;
  Cesta.AdicionarProdutoNaCesta('Arroz');
  Cesta.AdicionarProdutoNaCesta('Feij�o');
  Cesta.AdicionarProdutoNaCesta('A��car');
  Cesta.AdicionarProdutoNaCesta('�leo');
  Cesta.AdicionarProdutoNaCesta('Refrigerante');
  Cesta.AdicionarProdutoNaCesta('Leite');
  Cesta.AdicionarProdutoNaCesta('Caf�');
  result := Cesta;
end;

function TCestaBuilder.MontarCestaEspecial: ICestaProdutos;
var
  Cesta: ICestaProdutos;
begin
  Cesta := TCestaProdutos.Create;
  Cesta.AdicionarProdutoNaCesta('Arroz');
  Cesta.AdicionarProdutoNaCesta('Feij�o');
  Cesta.AdicionarProdutoNaCesta('Ravioli');
  Cesta.AdicionarProdutoNaCesta('Caixa de Bombons');
  Cesta.AdicionarProdutoNaCesta('Champanhe');
  Cesta.AdicionarProdutoNaCesta('Panetone');
  result := Cesta;
end;

end.
