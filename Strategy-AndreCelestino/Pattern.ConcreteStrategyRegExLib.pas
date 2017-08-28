unit Pattern.ConcreteStrategyRegExLib;

interface

uses
  Pattern.Strategy;

type
  { Concrete Strategy - RegExLib }
  TConcreteStrategyRegExLib = class(TInterfacedObject, IStrategy)
  private
    // Acessa o WebService para consultar a expressão regular
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

  // Obtém uma instância do consumidor do WebService
  WebServiceRegExLib := GetWebservicesSoap(True, '', HTTPRIO);

  // Consulta os dados da expressão regular (o ID 3122 corresponde a uma validação de e-mail)
  Expressao := WebServiceRegExLib.getRegExpDetails(3122);

  // Obtém a string referente à expressão regular
  result := Expressao.regular_expression;

  // Libera o objeto da memória
  Expressao.Free;
end;

function TConcreteStrategyRegExLib.ValidarEmail(const Email: string): boolean;
var
  RegEx: TRegEx;
begin
  // Cria uma instância do record TRegEx informando a expressão consultada no WebService
  RegEx := TRegEx.Create(ObterExpressao);

  // Valida o e-mail com a expressão regular
  result := RegEx.Match(Email).Success;
end;

end.
