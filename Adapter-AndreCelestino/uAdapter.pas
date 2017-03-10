unit uAdapter;

interface

uses
  Classes, SysUtils, uInterfaceViaCEP, uWebServiceCorreios, uWSDL_Correios;

type
  { Adapter }
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // vari�vel para armazenar a inst�ncia do Adaptee (objeto da classe de consulta dos Correios)
    WebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(WebServiceCorreios: TWebServiceCorreios);

    // m�todos da Interface
    procedure ConsultarEnderecoWebService(const CEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;       
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const CEP: string);
begin
  // chama os m�todos do Adaptee (objeto da classe de consulta dos Correios)
  WebServiceCorreios.DefinirParametrosConsulta(CEP);
  WebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(WebServiceCorreios: TWebServiceCorreios);
begin
  // atribui o objeto do par�metro � vari�vel da classe
  Self.WebServiceCorreios := WebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o nome do bairro
  result := WebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o nome da cidade
  result := WebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o logradouro
  result := WebServiceCorreios.ObterResposta('Logradouro');
end;

end.
