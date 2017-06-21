unit Pattern.Aggregate;

interface

uses
  Contnrs, Pattern.Iterator;

type
  { Aggregate }
  IAggregate = interface

    // Retorna uma refer�ncia da lista de objetos
    function GetLista: TObjectList;

    // Retorna uma inst�ncia do Iterator
    function GetIterator: IIterator;

  end;

implementation

end.
