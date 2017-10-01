unit Pattern.RealSubject;

interface

uses
  Pattern.Subject;

type
  { Real Subject }
  TCalculadorReal = class(TInterfacedObject, ICalculador)
  public
    // Método da Interface
    function CalcularDistancia(const Origem, Destino: string): string;
  end;

implementation

uses
  SysUtils, IdURI, IdHTTP, System.JSON;

const
  // Endereço da API do Google Maps
  GOOGLE_MAPS_API =
    'http://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=%s&destinations=%s';

{ TCalculadorReal }

function TCalculadorReal.CalcularDistancia(const Origem,
  Destino: string): string;
var
  IdHTTP: TIdHTTP;
  Endereco: string;
  Resposta: string;
  Status: string;
  // Classe para trabalhar com JSON
  JSON: TJSONObject;
begin
  // Cria o componente IdHTTP para executar a consulta na API
  IdHTTP := TIdHTTP.Create(nil);
  try
    // Configura o endereço de envio de dados para a API
    Endereco := Format(GOOGLE_MAPS_API, [Origem, Destino]);

    // "Codifica" a URL no formato correto (por exemplo, tratando acentos)
    Endereco := TIdURI.URLEncode(Endereco);

    // Recebe a resposta
    Resposta := IdHTTP.Get(Endereco);

    // Interpreta a resposta da API como JSON
    JSON := TJSONObject.ParseJSONValue(Resposta) as TJSONObject;

    // Faz a leitura do valor do rótulo "status" do JSON
    Status :=
       TJSONObject(
          TJSONArray(
            TJSONObject(
              TJSONArray(
                JSON.GetValue('rows')
              ).Items[0]
            ).GetValue('elements')
          ).Items[0]
        ).GetValue('status')
      .Value;

    // Valida o status do retorno,
    // apresentando uma exceção caso as cidades não sejam encontradas
    if (Status = '"NOT_FOUND"') or (Status = '"ZERO_RESULTS"') then
      raise Exception.Create('A cidade de origem ou destino não foi encontrada.');

    // Obtém o valor do rótulo "distance"
    result :=
      TJSONObject(
        TJSONObject(
          TJSONArray(
            TJSONObject(
              TJSONArray(
                JSON.GetValue('rows')
              ).Items[0]
            ).GetValue('elements')
          ).Items[0]
        ).GetValue('distance')
      ).GetValue('text')
    .Value;
  finally
    // Libera o componente IdHTTP da memória
    FreeAndNil(IdHTTP);
  end;
end;

end.
