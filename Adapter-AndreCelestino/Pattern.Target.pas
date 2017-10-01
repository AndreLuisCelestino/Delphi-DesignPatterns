unit Pattern.Target;

interface

uses
  Classes, Interfaces.ViaCEP;

type
  { Target }
  TComunicador = class
  private
    // variável para armazenar a instância do objeto da classe de consulta,
    // que pode ser do ViaCEP ou dos Correios (adaptado)
    WebServiceViaCEP: IWebServiceViaCEP;
  public
    constructor Create(WebServiceViaCEP: IWebServiceViaCEP);
    destructor Destroy; override;

    // método responsável por utilizar o objeto da classe de consulta
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
  // chama o método do objeto da classe de consulta para buscar o endereço
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
  { Atribui o objeto do parâmetro à variável da classe.
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
