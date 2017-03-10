unit uWebServiceCorreios;

interface

uses
  uWSDL_Correios, Classes;

type
  { Adaptee }
  TWebServiceCorreios = class
  private
    // vari�veis para armazenar os objetos solicitados na comunica��o do WebService
    Parametros: consultaCEP;
    Resposta: enderecoERP;

    // m�todo para sobrescrever a requisi��o SOAP
    procedure BeforeExecute(const MethodName: string; SOAPRequest: TStream);
  public
    destructor Destroy; override;

    // cria o objeto da classe de par�metros da consulta e o preenche com o CEP informado
    procedure DefinirParametrosConsulta(const CEP: string);

    // envia uma requisi��o ao WebService para consultar o endere�o
    procedure ConsultarCEP;

    // retorna o conte�do das propridades do objeto da classe "enderecoERP"
    function ObterResposta(const Informacao: string): string;
  end;

implementation

uses
  SysUtils, SOAPHTTPClient;

{ TWebServiceCorreios }

procedure TWebServiceCorreios.BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  Request: TStringList;
begin
  // sobrescreve a requisi��o SOAP para deix�-la de acordo com a estrutura
  // exigida pelo WebService

  Request := TStringList.Create;
  try
    Request.Text :=
      '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">' +
      '  <soapenv:Header/>' +
      '    <soapenv:Body>' +
      '      <cli:consultaCEP>' +
      '        <cep>' + Parametros.cep + '</cep>' +
      '      </cli:consultaCEP>' +
      '    </soapenv:Body>' +
      '</soapenv:Envelope>';

    SOAPRequest.Position := 0;
    SOAPRequest.Size := Length(Request.Text);
    Request.SaveToStream(SOAPRequest);
  finally
    FreeAndNil(Request);
  end;
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
  Resposta := Correios.consultaCEP(Parametros).return;
end;

procedure TWebServiceCorreios.DefinirParametrosConsulta(const CEP: string);
begin
  // cria o objeto da classe "consultaCEP" e preenche a propriedade "cep"
  Parametros := consultaCEP.Create;
  Parametros.cep := CEP;
end;

destructor TWebServiceCorreios.Destroy;
begin
  FreeAndNil(Parametros);
  inherited;
end;

function TWebServiceCorreios.ObterResposta(const Informacao: string): string;
begin
  // retorna o conte�do da propriedade do objeto "FoResposta"
  // conforme o tipo de informa��o solicitado no par�metro
  
  result := EmptyStr;

  if Informacao = 'Logradouro' then
    result := Resposta.end_
  else if Informacao = 'Bairro' then
    result := Resposta.bairro
  else if Informacao = 'Cidade' then
    result := Resposta.cidade;
end;

end.
