unit Pattern.ConcreteStrategyRegExLib;

interface

uses
  Pattern.Strategy;

type
  { Concrete Strategy - RegExLib }
  TConcreteStrategyRegExLib = class(TInterfacedObject, IStrategy)
  private
    // Acessa o WebService para consultar a express�o regular
    function ObterExpressao: string;
  public
    // Assinatura da Interface Strategy
    function ValidarEmail(const Email: string): boolean;
  end;

implementation

uses
  System.RegularExpressions, WebService.RegExLib, Soap.SOAPHTTPClient;

{ TConcreteStrategyRegExLib }

function TConcreteStrategyRegExLib.ObterExpressao: string;
var
  WebServiceRegExLib: WebservicesSoap;
  HTTPRIO: THTTPRIO;
  Expressao: RegExpDetails;
begin
  // Cria um objeto da classe THTTPRIO
  HTTPRIO := THTTPRIO.Create(nil);

  // Obt�m uma inst�ncia do consumidor do WebService
  WebServiceRegExLib := GetWebservicesSoap(True, '', HTTPRIO);

  // Consulta os dados da express�o regular (o ID 3122 corresponde a uma valida��o de e-mail)
  Expressao := WebServiceRegExLib.getRegExpDetails(3122);

  // Obt�m a string referente � express�o regular
  result := Expressao.regular_expression;

  // Libera o objeto da mem�ria
  Expressao.Free;
end;

function TConcreteStrategyRegExLib.ValidarEmail(const Email: string): boolean;
var
  RegEx: TRegEx;
begin
  // Cria uma inst�ncia do record TRegEx informando a express�o consultada no WebService
  RegEx := TRegEx.Create(ObterExpressao);

  // Valida o e-mail com a express�o regular
  result := RegEx.Match(Email).Success;
end;

end.
