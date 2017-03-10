unit uWebServiceViaCEP;

interface

uses
  XMLDoc, XMLIntf, uInterfaceViaCEP;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // vari�vel para armazenar o XML de retorno do ViaCEP
    XMLDocument: IXMLDocument;
  public
    constructor Create;
    destructor Destroy; override;

    // m�todos da Interface
    procedure ConsultarEnderecoWebService(const CEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;    
  end;

implementation

uses
  SysUtils, Variants;

{ TWebServiceViaCEP }

procedure TWebServiceViaCEP.ConsultarEnderecoWebService(const CEP: string);
begin
  // consulta o CEP no link do ViaCEP e atribui ao objeto FoXMLDocument
  XMLDocument.FileName := Format('https://viacep.com.br/ws/%s/xml/', [CEP]);
  XMLDocument.Active := True;
end;

constructor TWebServiceViaCEP.Create;
begin
  // instancia o objeto que armazenar� o XML de retorno
  XMLDocument := TXMLDocument.Create(nil);
end;

function TWebServiceViaCEP.ObterBairro: string;
begin
  // encontro o Node (n�) "bairro" para acessar o conte�do
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: string;
begin
  // encontro o Node (n�) "localidade" para acessar o conte�do
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: string;
begin
  // encontro o Node (n�) "logradouro" para acessar o conte�do
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['logradouro']);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  XMLDocument := nil;
  inherited;
end;

end.
