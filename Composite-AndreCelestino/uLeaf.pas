unit uLeaf;

interface

uses
  uComponent;

type
  { Leaf }
  TViagem = class(TInterfacedObject, IViagem)
  private
    Origem: string;
    Destino: string;
  public
    procedure DefinirOrigem(const Cidade: string);
    procedure DefinirDestino(const Cidade: string);

    { Operation }
    function CalcularValor: double;
  end;

implementation

uses
  uValoresSingleton;

{ TViagem }

function TViagem.CalcularValor: double;
var
  ValoresSingleton: TValoresSingleton;
begin
  // Obtém a instância do Singleton para consultar o valor da viagem
  ValoresSingleton := TValoresSingleton.ObterInstancia;
  result := ValoresSingleton.ConsultarValorViagem(Origem, Destino);
end;

procedure TViagem.DefinirDestino(const Cidade: string);
begin
  Destino := Cidade;
end;

procedure TViagem.DefinirOrigem(const Cidade: string);
begin
  Origem := Cidade;
end;

end.
