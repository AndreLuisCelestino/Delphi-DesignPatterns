unit Pattern.AbstractClass;

interface

uses
  System.JSON, REST.Client, IPPeerClient;

type
  { Abstract Class }
  TAbstractClass = class
  private
    // Objetos necess�rio para a comunica��o com a API
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;

    // M�todos internos da classe
    procedure InicializarObjetos;
    procedure EnviarRequisicao;
    procedure LiberarObjetos;
  protected
    // Vari�vel para armazenar o par�metro de consulta que ser� enviado na URL
    FParametros: string;
    // Objeto para receber o JSON de retorno
    FJSON: TJSONObject;

    // M�todo que ser� implementado nas subclasses
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
  // Configura os par�metros da requisi��o
  FRESTRequest.Resource := FParametros;

  // Executa a requisi��o
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
  // Libera os objetos da mem�ria
  FRESTRequest.Free;
  FRESTResponse.Free;
  FRESTClient.Free;
end;

function TAbstractClass.ConsultarDadosGitHub: olevariant;
begin
  // Este � o Template Method
  // O comportamento do m�todo "ProcessarRetorno" ser� definido em tempo de execu��o

  InicializarObjetos;
  EnviarRequisicao;
  result := ProcessarRetorno;
  LiberarObjetos;
end;

end.
