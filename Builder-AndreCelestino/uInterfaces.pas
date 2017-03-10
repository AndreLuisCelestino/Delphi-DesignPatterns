unit uInterfaces;

interface

type
  ICestaProdutos = interface
    procedure AdicionarProdutoNaCesta(const Produto: string);
    function ObterListaProdutos: string;
    function ObterValorTotalCesta: string;
  end;
  
  ICestaBuilder = interface
    function MontarCestaBasica: ICestaProdutos;
    function MontarCestaCompleta: ICestaProdutos;
    function MontarCestaEspecial: ICestaProdutos;
  end;

implementation

end.
