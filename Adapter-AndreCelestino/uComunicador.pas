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
    FoWebServiceViaCEP: IWebServiceViaCEP;
  public
    constructor Create(poWebServiceViaCEP: IWebServiceViaCEP);
    destructor Destroy; override;

    // m�todo respons�vel por utilizar o objeto da classe de consulta
    // para buscar o CEP e preencher o retorno
    function ConsultarEndereco(const psCEP: string): TStringList;
  end;

implementation

uses
  SysUtils;

{ TComunicador }

function TComunicador.ConsultarEndereco(const psCEP: string): TStringList;
var
  slDados: TStringList;
begin
  // chama o m�todo do objeto da classe de consulta para buscar o endere�o
  FoWebServiceViaCEP.ConsultarEnderecoWebService(psCEP);

  // instancia uma TStringList e a preenche com os dados de retorno
  slDados := TStringList.Create;
  slDados.Values['Logradouro'] := FoWebServiceViaCEP.ObterLogradouro;
  slDados.Values['Bairro'] := FoWebServiceViaCEP.ObterBairro;
  slDados.Values['Cidade'] := FoWebServiceViaCEP.ObterCidade;

  // retorna a TStringList ao chamador
  result := slDados;
end;

constructor TComunicador.Create(poWebServiceViaCEP: IWebServiceViaCEP);
begin
  { Atribui o objeto do par�metro � vari�vel da classe.
    Embora o nome seja "FoWebServiceViaCEP", este objeto pode ser:
    - o objeto da classe de consulta do ViaCEP;
    - o adaptador da classe de consulta dos Correios;
    Pois ambos implementam a Interface "IWebServiceConsulta" }
  FoWebServiceViaCEP := poWebServiceViaCEP;
end;

destructor TComunicador.Destroy;
begin
  FoWebServiceViaCEP := nil;
  inherited;
end;

end.
 