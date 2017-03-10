unit uComunicador;

interface

uses
  Classes, uInterfaceViaCEP;

type
  { Target }
  TComunicador = class
  private
    // vari�vel para armazenar a inst�ncia do objeto da classe de consulta,
    // que pode ser do ViaCEP ou dos Correios (adaptado)
    WebServiceViaCEP: IWebServiceViaCEP;
  public
    constructor Create(WebServiceViaCEP: IWebServiceViaCEP);
    destructor Destroy; override;

    // m�todo respons�vel por utilizar o objeto da classe de consulta
    // para buscar o CEP e preencher o retorno
    function ConsultarEndereco(const CEP: string): TStringList;
  end;

implementation

uses
  SysUtils;

{ TComunicador }

function TComunicador.ConsultarEndereco(const CEP: string): TStringList;
var
  Dados: TStringList;
begin
  // chama o m�todo do objeto da classe de consulta para buscar o endere�o
  WebServiceViaCEP.ConsultarEnderecoWebService(CEP);

  // instancia uma TStringList e a preenche com os dados de retorno
  Dados := TStringList.Create;
  Dados.Values['Logradouro'] := WebServiceViaCEP.ObterLogradouro;
  Dados.Values['Bairro'] := WebServiceViaCEP.ObterBairro;
  Dados.Values['Cidade'] := WebServiceViaCEP.ObterCidade;

  // retorna a TStringList ao chamador
  result := Dados;
end;

constructor TComunicador.Create(WebServiceViaCEP: IWebServiceViaCEP);
begin
  { Atribui o objeto do par�metro � vari�vel da classe.
    Embora o nome seja "FoWebServiceViaCEP", este objeto pode ser:
    - o objeto da classe de consulta do ViaCEP;
    - o adaptador da classe de consulta dos Correios;
    Pois ambos implementam a Interface "IWebServiceConsulta" }
  Self.WebServiceViaCEP := WebServiceViaCEP;
end;

destructor TComunicador.Destroy;
begin
  WebServiceViaCEP := nil;
  inherited;
end;

end.
