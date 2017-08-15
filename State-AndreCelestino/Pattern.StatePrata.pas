unit Pattern.StatePrata;

interface

uses
  Pattern.StateBase, Utils.Enumerated;

type
  { Concrete State }
  TStatePrata = class(TStateBase)
  protected
    function ObterValorDesconto: real; override;
    function ObterValorFrete: real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

const
  PORCENTAGEM_DESCONTO = 0.07;
  PORCENTAGEM_FRETE = 0.05;

{ TStatePrata }

function TStatePrata.ObterCategoriaPedido: TCategoriaPedido;
begin
  result := cpPrata;
end;

function TStatePrata.ObterValorDesconto: real;
begin
  // Aplica 7% de desconto
  result := FTotalPedido * PORCENTAGEM_DESCONTO;

  // Se o pedido for maior que 700,00, aplica mais 2% de desconto
  if FTotalPedido > 700 then
    result := result * 0.02;
end;

function TStatePrata.ObterValorFrete: real;
begin
  // Aplica uma porcentagem de 5% para o frete
  result := FTotalPedido * PORCENTAGEM_FRETE;
end;

end.
