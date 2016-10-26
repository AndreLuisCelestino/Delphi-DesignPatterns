unit uWebServiceViaCEP;

interface

uses
  XMLDoc, XMLIntf, uInterfaceViaCEP;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // vari�vel para armazenar o XML de retorno do ViaCEP
    FoXMLDocument: IXMLDocument;
  public
    constructor Create;
    destructor Destroy; override;

    // m�todos da Interface
    procedure ConsultarEnderecoWebService(const psCEP: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;    
  end;

implementation

uses
  SysUtils, Variants;

{ TWebServiceViaCEP }

procedure TWebServiceViaCEP.ConsultarEnderecoWebService( const psCEP: string);
begin
  // consulta o CEP no link do ViaCEP e atribui ao objeto FoXMLDocument
  FoXMLDocument.FileName := Format('https://viacep.com.br/ws/%s/xml/', [psCEP]);
  FoXMLDocument.Active := True;
end;

constructor TWebServiceViaCEP.Create;
begin
  // instancia o objeto que armazenar� o XML de retorno
  FoXMLDocument := TXMLDocument.Create(nil);
end;

function TWebServiceViaCEP.ObterBairro: string;
begin
  // encontro o Node (n�) "bairro" para acessar o conte�do
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: string;
begin
  // encontro o Node (n�) "localidade" para acessar o conte�do
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: string;
begin
  // encontro o Node (n�) "logradouro" para acessar o conte�do
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['logradouro']);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  FoXMLDocument := nil;
  inherited;
end;

end.
