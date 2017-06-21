unit Pattern.Iterator;

interface

type
  { Iterator }
  IIterator = interface

    // Move para o primeiro objeto da lista
    procedure PrimeiroObjeto;

    // Move para o pr�ximo objeto da lista
    procedure ProximoObjeto;

    // Retorna o objeto atual da lista
    function ObjetoAtual: TObject;

    // Verifica se est� no fim da lista
    function FimLista: boolean;

    // Retorna o objeto no ind�ce informado
    function Buscar(const Indice: integer): TObject;

  end;

implementation

end.
