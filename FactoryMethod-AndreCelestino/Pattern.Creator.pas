unit Pattern.Creator;

interface

uses
  Pattern.Product;

type
  { Creator }
  IFactoryMethod = interface
    function ConsultarPrazo(const Prazo: string): ITipoPrazo;
  end;

implementation

end.
