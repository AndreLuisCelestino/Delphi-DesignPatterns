unit Pattern.Product;

interface

type
  { Product }
  ITipoPrazo = interface
    function ConsultarDescricao: string;
    function ConsultarJuros: string;
    function ConsultarProjecao(const Valor: real; const QtdeParcelas: integer): string;
    function ConsultarTotal: string;
  end;

implementation

end.
