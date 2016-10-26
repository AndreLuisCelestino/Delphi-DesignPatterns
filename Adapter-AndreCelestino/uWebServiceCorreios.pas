unit uWebServiceCorreios;

interface

uses
  uWSDL_Correios;

type
  { Adaptee }
  TWebServiceCorreios = class
  private
    // vari�veis para armazenar os objetos solicitados na comunica��o do WebService
    FoParametros: consultaCEP;
    FoResposta: enderecoERP;

    // m�todo para sobrescrever a requisi��o SOAP
    procedure BeforeExecute(const MethodName: string; var SOAPRequest: WideString);
  public
    destructor Destroy; override;

    // cria o objeto da classe de par�metros da consulta e o preenche com o CEP informado
    procedure DefinirParametrosConsulta(const psCEP: string);

    // envia uma requisi��o ao WebService para consultar o endere�o
    procedure ConsultarCEP;

    // retorna o conte�do das propridades do objeto da classe "enderecoERP"
    function ObterResposta(const psInformacao: string): string;
  end;

implementation

uses
  SysUtils, SOAPHTTPClient;

{ TWebServiceCorreios }

procedure TWebServiceCorreios.BeforeExecute(const MethodName: string;
  var SOAPRequest: WideString);
begin
  // sobrescreve a requisi��o SOAP para deix�-la de acordo com a estrutura
  // exigida pelo WebService

  SOAPRequest := 
    '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">' +
    '  <soapenv:Header/>' +
    '    <soapenv:Body>' +
    '      <cli:consultaCEP>' +
    '        <cep>' + FoParametros.cep + '</cep>' +
    '      </cli:consultaCEP>' +
    '    </soapenv:Body>' +
    '</soapenv:Envelope>';
end;

procedure TWebServiceCorreios.ConsultarCEP;
var
  Correios: AtendeCliente;
  HTTPRIO: THTTPRIO;
begin
  // instancia o objeto da classe THTTPRIO
  HTTPRIO := THTTPRIO.Create(nil);

  // associa o evento "OnBeforeExecute" para sobrescrever a requisi��o SOAP
  HTTPRIO.OnBeforeExecute := BeforeExecute;

  // obt�m uma inst�ncia do WSDL
  Correios := GetAtendeCliente(True, '', HTTPRIO);

  // chama o m�todo do WebService para consultar o CEP e receber o retorno
  FoResposta := Correios.consultaCEP(FoParametros).return;
end;

procedure TWebServiceCorreios.DefinirParametrosConsulta(
  const psCEP: string);
begin
  // cria o objeto da classe "consultaCEP" e preenche a propriedade "cep"
  FoParametros := consultaCEP.Create;
  FoParametros.cep := psCEP;
end;

destructor TWebServiceCorreios.Destroy;
begin
  FreeAndNil(FoParametros);
  inherited;
end;

function TWebServiceCorreios.ObterResposta(
  const psInformacao: string): string;
begin
  // retorna o conte�do da propriedade do objeto "FoResposta"
  // conforme o tipo de informa��o solicitado no par�metro
  
  result := EmptyStr;

  if psInformacao = 'Logradouro' then
    result := FoResposta.end_
  else if psInformacao = 'Bairro' then
    result := FoResposta.bairro
  else if psInformacao = 'Cidade' then
    result := FoResposta.cidade;
end;

end.
