unit Pattern.Adaptee;

interface

uses
  WebService.Correios, Classes;

type
  { Adaptee }
  TWebServiceCorreios = class
  private
    // variáveis para armazenar os objetos solicitados na comunicação do WebService
    Parametros: consultaCEP;
    Resposta: enderecoERP;

    // método para sobrescrever a requisição SOAP
    procedure BeforeExecute(const MethodName: string; SOAPRequest: TStream);
  public
    destructor Destroy; override;

    // cria o objeto da classe de parâmetros da consulta e o preenche com o CEP informado
    procedure DefinirParametrosConsulta(const CEP: string);

    // envia uma requisição ao WebService para consultar o endereço
    procedure ConsultarCEP;

    // retorna o conteúdo das propridades do objeto da classe "enderecoERP"
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
  // sobrescreve a requisição SOAP para deixá-la de acordo com a estrutura
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

  // associa o evento "OnBeforeExecute" para sobrescrever a requisição SOAP
  HTTPRIO.OnBeforeExecute := BeforeExecute;

  // obtém uma instância do WSDL
  Correios := GetAtendeCliente(True, '', HTTPRIO);

  // chama o método do WebService para consultar o CEP e receber o retorno
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
  // retorna o conteúdo da propriedade do objeto "FoResposta"
  // conforme o tipo de informação solicitado no parâmetro
  
  result := EmptyStr;

  if Informacao = 'Logradouro' then
    result := Resposta.end_
  else if Informacao = 'Bairro' then
    result := Resposta.bairro
  else if Informacao = 'Cidade' then
    result := Resposta.cidade;
end;

end.
