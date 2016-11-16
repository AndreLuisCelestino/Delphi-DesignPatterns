unit uLeaf;

interface

uses
  uComponent;

type
  { Leaf }
  TViagem = class(TInterfacedObject, IViagem)
  private
    FsOrigem: string;
    FsDestino: string;
  public
    procedure DefinirOrigem(const psCidade: string);
    procedure DefinirDestino(const psCidade: string);

    { Operation }
    function CalcularValor: double;
  end;

implementation

uses
  uValoresSingleton;

{ TViagem }

function TViagem.CalcularValor: double;
var
  oValoresSingleton: TValoresSingleton;
begin
  // Obtém a instância do Singleton para consultar o valor da viagem
  oValoresSingleton := TValoresSingleton.ObterInstancia;
  result := oValoresSingleton.ConsultarValorViagem(FsOrigem, FsDestino);
end;

procedure TViagem.DefinirDestino(const psCidade: string);
begin
  FsDestino := psCidade;
end;

procedure TViagem.DefinirOrigem(const psCidade: string);
begin
  FsOrigem := psCidade;
end;

end.
