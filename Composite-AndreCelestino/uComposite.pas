unit uComposite;

interface

uses
  Classes, uComponent, uLeaf, Contnrs;

type
  { Composite }
  TPacoteViagem = class(TInterfacedObject, IViagem)
  private
    // lista de objetos para armazenar as viagens (Leaf) do pacote
    FoViagens: TObjectList;
  public
    constructor Create;

    { Operation }
    function CalcularValor: double;

    procedure AdicionarViagem(poViagem: TViagem);
  end;

implementation

{ TPacoteViagens }

procedure TPacoteViagem.AdicionarViagem(poViagem: TViagem);
begin
  // Adiciona o Leaf (viagem) na lista de objetos
  FoViagens.Add(poViagem);
end;

function TPacoteViagem.CalcularValor: double;
var
  nContador: smallint;
  oViagem: TViagem;
begin
  // Este � o m�todo principal (Operation) que d� prop�sito ao padr�o Composite.
  // O m�todo ir� ler cada uma das viagens dentro do pacote,
  // ou seja, cada Leaf dentro do Composite,
  // para calcular o valor de cada viagem, e por fim, obter o valor total do pacote

  result := 0;
  for nContador := 0 to Pred(FoViagens.Count) do
  begin
    // Aponta a vari�vel "oViagem" para o objeto no �ndice da lista
    oViagem := (FoViagens[nContador]) as TViagem;

    // Chama o Operation do Leaf
    result := result + oViagem.CalcularValor;
  end;
end;

constructor TPacoteViagem.Create;
begin
  FoViagens := TObjectList.Create;
end;

end.
