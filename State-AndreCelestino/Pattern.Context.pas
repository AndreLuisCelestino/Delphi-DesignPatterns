unit Pattern.Context;

interface

uses
  Pattern.State, Utils.Enumerated;

type
  { Context }
  TContext = class
  private
    // Mant�m uma refer�ncia para o estado atual do objeto
    FState: IState;

    // M�todo principal do padr�o de projeto, respons�vel por trocar os estados
    procedure AlterarEstado;
  public
    constructor Create;

    procedure AdicionarItem(const ValorItem: real);
    procedure RemoverItem(const ValorItem: real);

    function ObterTotalPedido: real;
    function ObterValorDesconto: real;
    function ObterValorFrete: real;
    function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

uses
  Pattern.StateBronze, Pattern.StatePrata, Pattern.StateOuro;

{ TContext }

constructor TContext.Create;
begin
  // Inicia a categoria como "Bronze", pois n�o h� itens adicionados
  FState := TStateBronze.Create(0);
end;

procedure TContext.AdicionarItem(const ValorItem: real);
begin
  // Chama o m�todo "AdicionarItem" do estado atual
  FState.AdicionarItem(ValorItem);

  // Chama o m�todo para alterar o estado conforme o total do pedido
  AlterarEstado;
end;

procedure TContext.RemoverItem(const ValorItem: real);
begin
  // Chama o m�todo "RemoverItem" do estado atual
  FState.RemoverItem(ValorItem);

  // Chama o m�todo para alterar o estado conforme o total do pedido
  AlterarEstado;
end;

procedure TContext.AlterarEstado;
var
  TotalPedido: real;
begin
  TotalPedido := FState.ObterTotalPedido;

  // Se o total do pedido for at� 500,00, devolve uma inst�ncia do estado "Bronze"
  if (TotalPedido <= 500) then
  begin
    FState := TStateBronze.Create(TotalPedido);
    Exit;
  end;

  // Se o total do pedido for at� 1.000,00, devolve uma inst�ncia do estado "Prata"
  if (TotalPedido <= 1000) then
  begin
    FState := TStatePrata.Create(TotalPedido);
    Exit;
  end;

  // Acima de 1.000,00, devolve uma inst�ncia do estado "Ouro"
  FState := TStateOuro.Create(TotalPedido);
end;

function TContext.ObterCategoriaPedido: TCategoriaPedido;
begin
  // Obt�m a categoria do pedido, acessando o estado atual
  result := FState.ObterCategoriaPedido;
end;

function TContext.ObterTotalPedido: real;
begin
  // Obt�m o total do pedido, acessando o estado atual
  result := FState.ObterTotalPedido;
end;

function TContext.ObterValorDesconto: real;
begin
  // Obt�m o valor do desconto, acessando o estado atual
  result := FState.ObterValorDesconto;
end;

function TContext.ObterValorFrete: real;
begin
  // Obt�m o valor do frete, acessando o estado atual
  result := FState.ObterValorFrete;
end;

end.
