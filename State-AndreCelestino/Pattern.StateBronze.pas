unit Pattern.StateBronze;

interface

uses
  Pattern.StateBase, Utils.Enumerated;

type
  { Concrete State }
  TStateBronze = class(TStateBase)
  protected
    function ObterValorDesconto: real; override;
    function ObterValorFrete: real; override;
    function ObterCategoriaPedido: TCategoriaPedido; override;
  end;
implementation

const
  PORCENTAGEM_DESCONTO = 0.05;
  PORCENTAGEM_FRETE = 0.06;

{ TStateBronze }

function TStateBronze.ObterCategoriaPedido: TCategoriaPedido;
begin
  result := cpBronze;
end;

function TStateBronze.ObterValorDesconto: real;
begin
  result := 0;

  // Se o valor do pedido for menor que 200,00, não há desconto
  if FTotalPedido <= 200 then
    Exit;

  // Caso contrário, aplica um desconto de 5%
  result := FTotalPedido * PORCENTAGEM_DESCONTO;
end;

function TStateBronze.ObterValorFrete: real;
begin
  // Aplica uma porcentagem de 6% para o frete
  result := FTotalPedido * PORCENTAGEM_FRETE;
end;

end.
