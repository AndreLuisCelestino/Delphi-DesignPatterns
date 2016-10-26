unit uAdapter;

interface

uses
  Classes, SysUtils, uInterfaceViaCEP, uWebServiceCorreios, uWSDL_Correios;

type
  { Adapter }
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // vari�vel para armazenar a inst�ncia do Adaptee (objeto da classe de consulta dos Correios)
    FoWebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(poWebServiceCorreios: TWebServiceCorreios);

    // m�todos da Interface
    procedure ConsultarEnderecoWebService(const psCEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;       
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const psCEP: string);
begin
  // chama os m�todos do Adaptee (objeto da classe de consulta dos Correios)
  FoWebServiceCorreios.DefinirParametrosConsulta(psCEP);
  FoWebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(poWebServiceCorreios: TWebServiceCorreios);
begin
  // atribui o objeto do par�metro � vari�vel da classe
  FoWebServiceCorreios := poWebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o nome do bairro
  result := FoWebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o nome da cidade
  result := FoWebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  // chama o m�todo ObterResposta do Adaptee para retornar o logradouro
  result := FoWebServiceCorreios.ObterResposta('Logradouro');
end;

end.
