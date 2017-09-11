unit Pattern.AbstractClass;

interface

uses
  System.JSON, REST.Client, IPPeerClient;

type
  { Abstract Class }
  TAbstractClass = class
  private
    // Objetos necessário para a comunicação com a API
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

    // Métodos internos da classe
    procedure InicializarObjetos;
    procedure EnviarRequisicao;
    procedure LiberarObjetos;
  protected
    // Variável para armazenar o parâmetro de consulta que será enviado na URL
    FParametros: string;
    // Objeto para receber o JSON de retorno
    FJSON: TJSONObject;

    // Método que será implementado nas subclasses
    function ProcessarRetorno: olevariant; virtual; abstract;
  public
    // Template Method
    function ConsultarDadosGitHub: olevariant;
  end;

implementation

uses
  System.SysUtils, REST.Types;

{ TAbstractClass }

procedure TAbstractClass.EnviarRequisicao;
begin
  // Configura os parâmetros da requisição
  FRESTRequest.Resource := FParametros;

  // Executa a requisição
  FRESTRequest.Execute;

  // Recebe o retorno em JSON e o atribui ao objeto FJSON
  FJSON.Parse(TEncoding.ASCII.GetBytes(FRESTResponse.JSONValue.ToString), 0);
end;

procedure TAbstractClass.InicializarObjetos;
begin
  // Cria o objeto da classe TRESTClient
  FRESTClient := TRESTClient.Create('https://api.github.com/search/');

  // Cria o objeto da classe TRESTResponse
  FRESTResponse := TRESTResponse.Create(nil);

  // Cria e configura o objeto da classe TRESTRequest
  FRESTRequest := TRESTRequest.Create(nil);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Method := rmGET;

  // Cria o objeto para manipular o JSON
  FJSON := TJSONObject.Create;
end;

procedure TAbstractClass.LiberarObjetos;
begin
  // Libera os objetos da memória
  FRESTRequest.Free;
  FRESTResponse.Free;
  FRESTClient.Free;
end;

function TAbstractClass.ConsultarDadosGitHub: olevariant;
begin
  // Este é o Template Method
  // O comportamento do método "ProcessarRetorno" será definido em tempo de execução

  InicializarObjetos;
  EnviarRequisicao;
  result := ProcessarRetorno;
  LiberarObjetos;
end;

end.
