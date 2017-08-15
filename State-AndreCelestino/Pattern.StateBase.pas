unit Pattern.StateBase;

interface

uses
  Pattern.State, Utils.Enumerated;

type
  { Concrete State }
  TStateBase = class(TInterfacedObject, IState)
  protected
    // Armazena o valor total do pedido
    FTotalPedido: real;

    // Métodos protegidos que serão sobrescritos pelas classes herdadas
    function ObterValorDesconto: real; virtual;
    function ObterValorFrete: real; virtual;
    function ObterCategoriaPedido: TCategoriaPedido; virtual;
  public
    constructor Create(const TotalPedido: real);

    procedure AdicionarItem(const ValorItem: real);
    procedure RemoverItem(const ValorItem: real);
    function ObterTotalPedido: real;
  end;

implementation

{ TStateBase }

constructor TStateBase.Create(const TotalPedido: real);
begin
  FTotalPedido := TotalPedido;
end;

function TStateBase.ObterTotalPedido: real;
begin
  result := FTotalPedido;
end;

procedure TStateBase.AdicionarItem(const ValorItem: real);
begin
  FTotalPedido := FTotalPedido + ValorItem;
end;

procedure TStateBase.RemoverItem(const ValorItem: real);
begin
  FTotalPedido := FTotalPedido - ValorItem;
end;

function TStateBase.ObterValorDesconto: real;
begin
  // Será implementado nas classes herdadas
  result := 0;
end;

function TStateBase.ObterValorFrete: real;
begin
  // Será implementado nas classes herdadas
  result := 0;
end;

function TStateBase.ObterCategoriaPedido: TCategoriaPedido;
begin
  // Será implementado nas classes herdadas
  result := cpBronze;
end;

end.
