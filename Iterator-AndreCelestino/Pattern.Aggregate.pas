unit Pattern.Aggregate;

interface

uses
  Contnrs, Pattern.Iterator;

type
  { Aggregate }
  IAggregate = interface

    // Retorna uma referência da lista de objetos
    function GetLista: TObjectList;

    // Retorna uma instância do Iterator
    function GetIterator: IIterator;

  end;

implementation

end.
