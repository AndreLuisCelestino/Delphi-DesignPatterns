unit Pattern.State;

interface

uses
  Utils.Enumerated;

type
  { State }
  IState = interface

    // Método para somar o valor do item ao total do pedido
    procedure AdicionarItem(const ValorItem: real);

    // Método para subtrair o valor do item do total do pedido
    procedure RemoverItem(const ValorItem: real);

    function ObterTotalPedido: real;
    function ObterValorDesconto: real;
    function ObterValorFrete: real;
    function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

end.
