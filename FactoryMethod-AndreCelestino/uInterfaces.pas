unit uInterfaces;

interface

type
  ITipoPrazo = interface
    function ConsultarDescricao: string;
    function ConsultarJuros: string;
    function ConsultarProjecao(const pnValor: real; const pnQtdeParcelas: integer): string;
    function ConsultarTotal: string;
  end;

  IFactoryMethod = interface
    function ConsultarPrazo(const psPrazo: string): ITipoPrazo;
  end;

implementation

end.
