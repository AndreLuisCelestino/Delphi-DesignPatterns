unit uComunicador;

interface

uses
  Classes, uInterfaceViaCEP;

type
  { Target }
  TComunicador = class
  private
    // variável para armazenar a instância do objeto da classe de consulta,
    // que pode ser do ViaCEP ou dos Correios (adaptado)
    FoWebServiceViaCEP: IWebServiceViaCEP;
  public
    constructor Create(poWebServiceViaCEP: IWebServiceViaCEP);
    destructor Destroy; override;

    // método responsável por utilizar o objeto da classe de consulta
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
  // chama o método do objeto da classe de consulta para buscar o endereço
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
  { Atribui o objeto do parâmetro à variável da classe.
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
 