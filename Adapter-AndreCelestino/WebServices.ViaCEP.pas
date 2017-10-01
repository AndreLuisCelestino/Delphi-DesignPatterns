unit WebServices.ViaCEP;

interface

uses
  XMLDoc, XMLIntf, Interfaces.ViaCEP;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // variável para armazenar o XML de retorno do ViaCEP
    XMLDocument: IXMLDocument;
  public
    constructor Create;
    destructor Destroy; override;

    // métodos da Interface
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
  // instancia o objeto que armazenará o XML de retorno
  XMLDocument := TXMLDocument.Create(nil);
end;

function TWebServiceViaCEP.ObterBairro: string;
begin
  // encontro o Node (nó) "bairro" para acessar o conteúdo
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: string;
begin
  // encontro o Node (nó) "localidade" para acessar o conteúdo
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: string;
begin
  // encontro o Node (nó) "logradouro" para acessar o conteúdo
  result := VarToStr(XMLDocument.DocumentElement.ChildValues['logradouro']);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  XMLDocument := nil;
  inherited;
end;

end.
