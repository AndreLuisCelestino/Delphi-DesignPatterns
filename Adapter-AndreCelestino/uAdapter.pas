unit uAdapter;

interface

uses
  Classes, SysUtils, uInterfaceViaCEP, uWebServiceCorreios, uWSDL_Correios;

type
  { Adapter }
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // variável para armazenar a instância do Adaptee (objeto da classe de consulta dos Correios)
    FoWebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(poWebServiceCorreios: TWebServiceCorreios);

    // métodos da Interface
    procedure ConsultarEnderecoWebService(const psCEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;       
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const psCEP: string);
begin
  // chama os métodos do Adaptee (objeto da classe de consulta dos Correios)
  FoWebServiceCorreios.DefinirParametrosConsulta(psCEP);
  FoWebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(poWebServiceCorreios: TWebServiceCorreios);
begin
  // atribui o objeto do parâmetro à variável da classe
  FoWebServiceCorreios := poWebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o nome do bairro
  result := FoWebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o nome da cidade
  result := FoWebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o logradouro
  result := FoWebServiceCorreios.ObterResposta('Logradouro');
end;

end.
