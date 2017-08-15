unit Pattern.StateOuro;

interface

uses
  Pattern.StateBase, Utils.Enumerated;

type
  { Concrete State }
  TStateOuro = class(TStateBase)
  protected
    function ObterValorDesconto: real; override;
    function ObterValorFrete: real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

const
  PORCENTAGEM_FRETE = 0.02;
  DESCONTO_PADRAO = 0.08;
  DESCONTO_PREMIUM = 0.1;

{ TStateOuro }

function TStateOuro.ObterCategoriaPedido: TCategoriaPedido;
begin
  result := cpOuro;
end;

function TStateOuro.ObterValorDesconto: real;
begin
  // Aplica um desconto de 8%...
  result := FTotalPedido * DESCONTO_PADRAO;

  // ... e mais um desconto de 10% (que beleza, hein?)
  result := result * DESCONTO_PREMIUM;
end;

function TStateOuro.ObterValorFrete: real;
begin
  result := 0;

  // Se o total do pedido for maior que 2 mil, o frete é grátis
  if FTotalPedido > 2000 then
    Exit;

  // Caso contrário, aplica uma porcentagem de 2% para o frete
  result := FTotalPedido * PORCENTAGEM_FRETE;
end;

end.
