unit Pattern.Subsystem.CalculoLoja;

interface

type
  { Subsystem }
  TSubsystemCalculoLoja = class
  private
    function AplicarDesconto(const Fidelidade: integer; const Preco: real): real;
    function AplicarMargemVenda(const Preco: real): real;
  public
    function CalcularPrecoFinal(const Fidelidade: integer; const Preco: real): real;
  end;

implementation

{ TSubsystemCalculoLoja }

function TSubsystemCalculoLoja.AplicarDesconto(const Fidelidade: integer;
  const Preco: real): real;
begin
  // Aplica o desconto conforme a fidelidade do cliente
  result := Preco;
  case Fidelidade of
    0: result := Preco - (Preco * 0.02); // Nenhuma - 2% de desconto
    1: result := Preco - (Preco * 0.06); // Bronze - 6% de desconto
    2: result := Preco - (Preco * 0.1);  // Prata - 10% de desconto
    3: result := Preco - (Preco * 0.18); // Ouro - 18% de desconto
  end;
end;

function TSubsystemCalculoLoja.AplicarMargemVenda(const Preco: real): real;
begin
  // Aplica a margem de venda de 35%
  result := Preco + (Preco * 0.35);
end;

function TSubsystemCalculoLoja.CalcularPrecoFinal(
  const Fidelidade: integer; const Preco: real): real;
begin
  // Operação principal do SubSystem: aplica o desconto e a margem de venda
  result := AplicarDesconto(Fidelidade, Preco);
  result := AplicarMargemVenda(result);
end;

end.
 