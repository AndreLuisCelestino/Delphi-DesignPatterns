unit Pattern.ConcreteStrategyMailBoxLayer;

interface

uses
  Pattern.Strategy;

type
  { Concrete Strategy - MailBoxLayer }
  TConcreteStrategyMailBoxLayer = class(TInterfacedObject, IStrategy)
  private
    // Envia uma requisi��o � API do MailBoxLayer e recebe um JSON como retorno
    function ObterJSONValidacao(const Email: string): string;
  public
    // Assinatura da Interface Strategy
    function ValidarEmail(const Email: string): boolean;
  end;

implementation

uses
  System.SysUtils, System.JSON, System.Classes, IdHTTP;

{ TConcreteStrategyMailBoxLayer }

function TConcreteStrategyMailBoxLayer.ObterJSONValidacao(const Email: string): string;
var
  URL: string;
  IdHTTP: TIdHTTP;
  Resposta: TMemoryStream;
begin
  // Monta a URL que ser� enviada na requisi��o
  URL := 'https://apilayer.net/api/check';
  URL := URL + '?access_key=98d5dfa2c5213713e70c2476db5c01f0';
  URL := URL + '&email=%s&format=1';

  // Cria um objeto da classe TIdHTTP para enviar a requisi��o
  IdHTTP := TIdHTTP.Create(nil);

  // Cria um objeto da classe TMemoryStream para receber o retorno
  Resposta := TMemoryStream.Create;
  try
    // Envia a requisi��o e recebe a resposta
    IdHTTP.Get(Format(URL, [Email]), Resposta);

    // Converte o conte�do do objeto da classe TMemoryStream para string
    SetString(result, PAnsiChar(Resposta.Memory), Resposta.Size);
  finally
    // Libera os objetos da mem�ria
    IdHTTP.Free;
    Resposta.Free;
  end;
end;

function TConcreteStrategyMailBoxLayer.ValidarEmail(const Email: string): boolean;
var
  Resposta: string;
  JSON: TJSONObject;
begin
  // Obt�m a resposta JSON da chamada � API
  Resposta := ObterJSONValidacao(Email);

  // Cria o objeto para trabalhar com JSON
  JSON := TJSONObject.Create;
  try
    // Atribui o conte�do JSON ao objeto
    JSON.Parse(TEncoding.ASCII.GetBytes(Resposta), 0);

    // Se o valor da chave "format_valid" for "true", significa que o e-mail � v�lido
    result := JSON.GetValue('format_valid') is TJSONTrue;
  finally
    // Libera o objeto da mem�ria
    JSON.Free;
  end;
end;

end.
