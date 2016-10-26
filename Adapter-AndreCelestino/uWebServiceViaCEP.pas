unit uWebServiceViaCEP;

interface

uses
  XMLDoc, XMLIntf, uInterfaceViaCEP;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
  private
    // variável para armazenar o XML de retorno do ViaCEP
    FoXMLDocument: IXMLDocument;
  public
    constructor Create;
    destructor Destroy; override;

    // métodos da Interface
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
  // instancia o objeto que armazenará o XML de retorno
  FoXMLDocument := TXMLDocument.Create(nil);
end;

function TWebServiceViaCEP.ObterBairro: string;
begin
  // encontro o Node (nó) "bairro" para acessar o conteúdo
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: string;
begin
  // encontro o Node (nó) "localidade" para acessar o conteúdo
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: string;
begin
  // encontro o Node (nó) "logradouro" para acessar o conteúdo
  result := VarToStr(FoXMLDocument.DocumentElement.ChildValues['logradouro']);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  FoXMLDocument := nil;
  inherited;
end;

end.
