unit Pattern.ConcreteCreator;

interface

uses
  Pattern.Creator, Pattern.Product;

type
  TFabricaPrazos = class(TInterfacedObject, IFactoryMethod)
    function ConsultarPrazo(const Prazo: string): ITipoPrazo;
  end;

implementation

uses
  Pattern.ConcreteProduct;

{ TFabricaPrazos }

function TFabricaPrazos.ConsultarPrazo(const Prazo: string): ITipoPrazo;
begin
  // Factory Method
  // A decis�o de qual m�todo criar fica a crit�rio deste m�todo

  if Prazo = 'Mensal' then
    result := TPrazoMensal.Create
  else if Prazo = 'Semestral' then
    result := TPrazoSemestral.Create
  else if Prazo = 'Anual' then
    result := TPrazoAnual.Create;
end;

end.
