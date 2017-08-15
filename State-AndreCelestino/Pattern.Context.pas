unit Pattern.Context;

interface

uses
  Pattern.State, Utils.Enumerated;

type
  { Context }
  TContext = class
  private
    // Mantém uma referência para o estado atual do objeto
    FState: IState;

    // Método principal do padrão de projeto, responsável por trocar os estados
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
  // Inicia a categoria como "Bronze", pois não há itens adicionados
  FState := TStateBronze.Create(0);
end;

procedure TContext.AdicionarItem(const ValorItem: real);
begin
  // Chama o método "AdicionarItem" do estado atual
  FState.AdicionarItem(ValorItem);

  // Chama o método para alterar o estado conforme o total do pedido
  AlterarEstado;
end;

procedure TContext.RemoverItem(const ValorItem: real);
begin
  // Chama o método "RemoverItem" do estado atual
  FState.RemoverItem(ValorItem);

  // Chama o método para alterar o estado conforme o total do pedido
  AlterarEstado;
end;

procedure TContext.AlterarEstado;
var
  TotalPedido: real;
begin
  TotalPedido := FState.ObterTotalPedido;

  // Se o total do pedido for até 500,00, devolve uma instância do estado "Bronze"
  if (TotalPedido <= 500) then
  begin
    FState := TStateBronze.Create(TotalPedido);
    Exit;
  end;

  // Se o total do pedido for até 1.000,00, devolve uma instância do estado "Prata"
  if (TotalPedido <= 1000) then
  begin
    FState := TStatePrata.Create(TotalPedido);
    Exit;
  end;

  // Acima de 1.000,00, devolve uma instância do estado "Ouro"
  FState := TStateOuro.Create(TotalPedido);
end;

function TContext.ObterCategoriaPedido: TCategoriaPedido;
begin
  // Obtém a categoria do pedido, acessando o estado atual
  result := FState.ObterCategoriaPedido;
end;

function TContext.ObterTotalPedido: real;
begin
  // Obtém o total do pedido, acessando o estado atual
  result := FState.ObterTotalPedido;
end;

function TContext.ObterValorDesconto: real;
begin
  // Obtém o valor do desconto, acessando o estado atual
  result := FState.ObterValorDesconto;
end;

function TContext.ObterValorFrete: real;
begin
  // Obtém o valor do frete, acessando o estado atual
  result := FState.ObterValorFrete;
end;

end.
