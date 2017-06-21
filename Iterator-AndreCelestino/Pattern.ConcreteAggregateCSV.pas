unit Pattern.ConcreteAggregateCSV;

interface

uses
  Pattern.Iterator, Pattern.Aggregate, Contnrs;

type
  { Concrete Aggregate }
  TConcreteAggregateCSV = class(TInterfacedObject, IAggregate)
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
  System.Classes, System.SysUtils, Pattern.ConcreteIterator, Model.Cliente;

{ TConcreteAggregateCSV }

constructor TConcreteAggregateCSV.Create(const CaminhoArquivo: string);
begin
  // Cria a lista de objetos
  FLista := TObjectList.Create;

  // Preenche a lista de objetos
  PreencherLista(CaminhoArquivo);
end;

destructor TConcreteAggregateCSV.Destroy;
begin
  // Libera a lista de objetos da memória
  FLista.Free;
  inherited;
end;

function TConcreteAggregateCSV.GetIterator: IIterator;
begin
  // Cria e retorna uma instância do Iterator
  result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateCSV.GetLista: TObjectList;
begin
  // Retorna uma referência da lista de objetos
  result := FLista;
end;

procedure TConcreteAggregateCSV.PreencherLista(const CaminhoArquivo: string);
var
  ArquivoCSV: TextFile;
  StringListValores: TStringList;
  Linha: string;
  Cliente: TCliente;
begin
  // Carrega o arquivo CSV
  AssignFile(ArquivoCSV, CaminhoArquivo);
  Reset(ArquivoCSV);

  StringListValores := TStringList.Create;
  try
    // Percorre as linhas do arquivo
    while not Eof(ArquivoCSV) do
    begin
      // Faz a leitura da linha do arquivo
      ReadLn(ArquivoCSV, Linha);

      // Atribui o conteúdo da linha na propriedade CommaText da StringList
      // para extrair cada valor em diferentes posições
      StringListValores.StrictDelimiter := True;
      StringListValores.CommaText := Linha;

      // Cria e preenche o objeto com os dados da linha do arquivo
      Cliente := TCliente.Create;
      Cliente.Codigo := StrToIntDef(StringListValores[0], 0);
      Cliente.Nome := StringListValores[1];
      Cliente.Endereco := StringListValores[2];
      Cliente.Pais := StringListValores[3];
      Cliente.Email := StringListValores[4];

      // Adiciona o objeto na lista
      FLista.Add(Cliente);
    end;
  finally
    StringListValores.Free;
    CloseFile(ArquivoCSV);
  end;
end;

end.
