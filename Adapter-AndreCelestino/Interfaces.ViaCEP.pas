unit Interfaces.ViaCEP;

interface

type
  IWebServiceViaCEP = interface
    procedure ConsultarEnderecoWebService(const psCEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;
  end;

implementation

end.
