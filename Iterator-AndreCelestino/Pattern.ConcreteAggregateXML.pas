unit Pattern.ConcreteAggregateXML;

interface

uses
  Pattern.Iterator, Pattern.Aggregate, Contnrs;

type
  { Concrete Aggregate }
  TConcreteAggregateXML = class(TInterfacedObject, IAggregate)
  private
    // Lista de objetos para armazenar os clientes
    FLista: TObjectList;

    // Método para preencher a lista de objetos
    procedure PreencherLista(const CaminhoArquivo: string);
  public
    constructor Create(const CaminhoArquivo: string);
    destructor Destroy; override;

    // Retorna uma referência da lista de objetos
    function GetLista: TObjectList;

    // Retorna uma instância do Iterator
    function GetIterator: IIterator;
  end;

implementation

uses
  Xml.XMLIntf, Xml.XMLDoc, System.Classes, System.SysUtils,
  Pattern.ConcreteIterator, Model.Cliente;


{ TConcreteAggregate }

constructor TConcreteAggregateXML.Create(const CaminhoArquivo: string);
begin
  // Cria a lista de objetos
  FLista := TObjectList.Create;

  // Preenche a lista de objetos
  PreencherLista(CaminhoArquivo);
end;

destructor TConcreteAggregateXML.Destroy;
begin
  // Libera a lista de objetos da memória
  FLista.Free;
  inherited;
end;

function TConcreteAggregateXML.GetIterator: IIterator;
begin
  // Cria e retorna uma instância do Iterator
  result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateXML.GetLista: TObjectList;
begin
  // Retorna uma referência da lista de objetos
  result := FLista;
end;

procedure TConcreteAggregateXML.PreencherLista(const CaminhoArquivo: string);
var
  XMLDocument: IXMLDocument;
  NodeImportacao: IXMLNode;
  NodeDados: IXMLNode;
  Contador: Integer;
  Cliente: TCliente;
begin
  // Carrega o arquivo XML
  XMLDocument := LoadXMLDocument(CaminhoArquivo);
  XMLDocument.Active := True;

  // Seleciona o nó principal do XML (chamado "dataset")
  NodeImportacao := XMLDocument.DocumentElement;
  for Contador := 0 to Pred(NodeImportacao.ChildNodes.Count) do
  begin
    // Acessa o nó filho
    NodeDados := NodeImportacao.ChildNodes[Contador];

    // Cria e preenche o objeto com os dados do nó
    Cliente := TCliente.Create;
    Cliente.Codigo := StrToInt(NodeDados.ChildNodes['codigo'].Text);
    Cliente.Nome := NodeDados.ChildNodes['nome'].Text;
    Cliente.Endereco := NodeDados.ChildNodes['endereco'].Text;
    Cliente.Pais := NodeDados.ChildNodes['pais'].Text;
    Cliente.Email := NodeDados.ChildNodes['email'].Text;

    // Adiciona o objeto na lista
    FLista.Add(Cliente);
  end;
end;

end.
