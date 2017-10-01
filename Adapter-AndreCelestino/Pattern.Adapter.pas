unit Pattern.Adapter;

interface

uses
  Classes, SysUtils, Interfaces.ViaCEP, Pattern.Adaptee;

type
  { Adapter }
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // variável para armazenar a instância do Adaptee (objeto da classe de consulta dos Correios)
    WebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(WebServiceCorreios: TWebServiceCorreios);

    // métodos da Interface
    procedure ConsultarEnderecoWebService(const CEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;       
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const CEP: string);
begin
  // chama os métodos do Adaptee (objeto da classe de consulta dos Correios)
  WebServiceCorreios.DefinirParametrosConsulta(CEP);
  WebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(WebServiceCorreios: TWebServiceCorreios);
begin
  // atribui o objeto do parâmetro à variável da classe
  Self.WebServiceCorreios := WebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o nome do bairro
  result := WebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o nome da cidade
  result := WebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  // chama o método ObterResposta do Adaptee para retornar o logradouro
  result := WebServiceCorreios.ObterResposta('Logradouro');
end;

end.
