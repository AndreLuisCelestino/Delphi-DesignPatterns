unit uInterfaces;

interface

type
  ITipoPrazo = interface
    function ConsultarDescricao: string;
    function ConsultarJuros: string;
    function ConsultarProjecao(const Valor: real; const QtdeParcelas: integer): string;
    function ConsultarTotal: string;
  end;

  IFactoryMethod = interface
    function ConsultarPrazo(const Prazo: string): ITipoPrazo;
  end;

implementation

end.
