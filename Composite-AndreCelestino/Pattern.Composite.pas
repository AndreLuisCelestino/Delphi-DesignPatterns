unit Pattern.Composite;

interface

uses
  Classes, Pattern.Component, Pattern.Leaf, System.Generics.Collections;

type
  { Composite }
  TPacoteViagem = class(TInterfacedObject, IViagem)
  private
    // lista de objetos para armazenar as viagens (Leaf) do pacote
    Viagens: TObjectList<TViagem>;
  public
    constructor Create;

    { Operation }
    function CalcularValor: double;

    procedure AdicionarViagem(Viagem: TViagem);
  end;

implementation

{ TPacoteViagens }

procedure TPacoteViagem.AdicionarViagem(Viagem: TViagem);
begin
  // Adiciona o Leaf (viagem) na lista de objetos
  Viagens.Add(Viagem);
end;

function TPacoteViagem.CalcularValor: double;
var
  Viagem: TViagem;
begin
  // Este é o método principal (Operation) que dá propósito ao padrão Composite.
  // O método irá ler cada uma das viagens dentro do pacote,
  // ou seja, cada Leaf dentro do Composite,
  // para calcular o valor de cada viagem, e por fim, obter o valor total do pacote

  result := 0;
  for Viagem in Viagens do
  begin
    // Chama o Operation do Leaf
    result := result + Viagem.CalcularValor;
  end;
end;

constructor TPacoteViagem.Create;
begin
  Viagens := TObjectList<TViagem>.Create;
end;

end.
