unit Pattern.ConcreteHandler;

interface

uses
  DBClient, Pattern.Handler;

type
  { Concrete Handler - Processador de TXT}
  TParserTXT = class(TInterfacedObject, IParser)
  private
    // Referência para o Concrete Handler superior
    ProximoParser: IParser;
  public
    // Atribui a referência do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

  { Concrete Handler - Processador de CSV}
  TParserCSV = class(TInterfacedObject, IParser)
  private
    // Referência para o Concrete Handler superior
    ProximoParser: IParser;
  public
    // Atribui a referência do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

  { Concrete Handler - Processador de XML }
  TParserXML = class(TInterfacedObject, IParser)
  private
    // Referência para o Concrete Handler superior
    ProximoParser: IParser;
  public
    // Atribui a referência do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

  { Concrete Handler - Processaor de JSON }
  TParserJSON = class(TInterfacedObject, IParser)
  private
    // Referência para o Concrete Handler superior
    ProximoParser: IParser;
  public
    // Atribui a referência do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

implementation

uses
  SysUtils, Classes, System.JSON, XMLIntf, XMLDoc, Dialogs;

{ TParserTXT }

procedure TParserTXT.ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
var
  Arquivo: TextFile;
  Linha: string;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(NomeArquivo)) <> '.TXT' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(ProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    ProximoParser.ProcessarInclusao(NomeArquivo, DataSet);
    Exit;
  end;

  // Exibe uma mensagem informando que a classe "aceitou" a mensagem
  ShowMessage('Classe que irá processar a mensagem: ' + Self.ClassName);

  // Associa o arquivo TXT à variável "Arquivo"
  AssignFile(Arquivo, NomeArquivo);

  // Move pará o início do arquivo
  Reset(Arquivo);

  // Executa um loop as linhas do arquivo, preenchendo o DataSet
  while not Eof(Arquivo) do
  begin
    DataSet.Append;

    ReadLn(Arquivo, Linha);
    DataSet.FieldByName('Codigo').AsString := Linha;
    ReadLn(Arquivo, Linha);
    DataSet.FieldByName('Nome').AsString := Linha;
    ReadLn(Arquivo, Linha);
    DataSet.FieldByName('Cidade').AsString := Linha;
    ReadLn(Arquivo, Linha);

    DataSet.Post;
  end;
end;

procedure TParserTXT.SetProximoParser(Parser: IParser);
begin
  // Atribui o próximo Parser
  ProximoParser := Parser;
end;

{ TParserCSV }

procedure TParserCSV.ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
var
  Valores: TStringList;
  Linha: TStringList;
  Contador: integer;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(NomeArquivo)) <> '.CSV' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(ProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    ProximoParser.ProcessarInclusao(NomeArquivo, DataSet);
    Exit;
  end;

  // Exibe uma mensagem informando que a classe "aceitou" a mensagem
  ShowMessage('Classe que irá processar a mensagem: ' + Self.ClassName);

  // Cria a TStringList que irá carregar o arquivo selecionado
  Valores := TStringList.Create;

  // Cria a TStringList que receberá os valores de cada linha
  Linha := TStringList.Create;
  try
    // Carrega o arquivo
    Valores.LoadFromFile(NomeArquivo);

    // Executa um loop nos itens da TStringList
    for Contador := 0 to Pred(Valores.Count) do
    begin
      Linha.Clear;

      // Utiliza o ExtractStrings para quebrar os valores
      // que estão separados por vírgula
      ExtractStrings([','], [' '], PChar(Valores[Contador]), Linha);

      // Preenche o DataSet com os dados da linha
      DataSet.AppendRecord([Linha[0], Linha[1], UTF8ToAnsi(Linha[2])]);
    end;
  finally
    // Libera as variáveis da memória
    FreeAndNil(Linha);
    FreeAndNil(Valores);
  end;
end;

procedure TParserCSV.SetProximoParser(Parser: IParser);
begin
  // Atribui o próximo Parser
  ProximoParser := Parser;
end;

{ TParserJSON }

procedure TParserJSON.ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
var
  Valores: TStringList;
  JSON: TJSONObject;
  ArrayDados: TJSONArray;
  Contador: integer;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(NomeArquivo)) <> '.JSON' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(ProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    ProximoParser.ProcessarInclusao(NomeArquivo, DataSet);
    Exit;
  end;

  // Exibe uma mensagem informando que a classe "aceitou" a mensagem
  ShowMessage('Classe que irá processar a mensagem: ' + Self.ClassName);

  // Cria a TStringList que irá carregar o arquivo selecionado
  Valores := TStringList.Create;
  try
    // Carrega o arquivo
    Valores.LoadFromFile(NomeArquivo);

    // Interpreta o conteúdo do arquivo como JSON
    JSON := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Valores.Text),0) as TJSONObject;

    // Seleciona o array "dados" do JSON
    ArrayDados := JSON.GetValue('dados') as TJSONArray;

    // Executa um loop nos itens do array
    for Contador := 0 to Pred(ArrayDados.Count) do
    begin
      // Converte o item atual do array para um objeto JSON
      JSON := ArrayDados.Items[Contador] as TJSONObject;

      // Preenche o DataSet acessando os pares do item do array
      DataSet.Append;
      DataSet.FieldByName('Codigo').AsString := JSON.Pairs[0].JsonValue.ToString;
      DataSet.FieldByName('Nome').AsString := UTF8ToAnsi(JSON.Pairs[1].JsonValue.Value);
      DataSet.FieldByName('Cidade').AsString := UTF8ToAnsi(JSON.Pairs[2].JsonValue.Value);
      DataSet.Post;
    end;
  finally
    // Libera a variável da memória
    FreeAndNil(Valores);
  end;
end;

procedure TParserJSON.SetProximoParser(Parser: IParser);
begin
  // Atribui o próximo Parser
  ProximoParser := Parser;
end;

{ TParserXML }

procedure TParserXML.ProcessarInclusao(const NomeArquivo: string;
  DataSet: TClientDataSet);
var
  XMLDocument: IXMLDocument;
  NodeImportacao: IXMLNode;
  NodeDados: IXMLNode;
  Contador: Integer;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(NomeArquivo)) <> '.XML' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(ProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    ProximoParser.ProcessarInclusao(NomeArquivo, DataSet);
    Exit;
  end;

  // Exibe uma mensagem informando que a classe "aceitou" a mensagem
  ShowMessage('Classe que irá processar a mensagem: ' + Self.ClassName);

  // Carrega e abre o arquivo XML
  XMLDocument := LoadXMLDocument(NomeArquivo);
  XMLDocument.Active := True;

  // Seleciona o nó principal do XML (importacao"
  NodeImportacao := XMLDocument.DocumentElement;

  // Executa um loop nos filhos do nó principal
  for Contador := 0 to Pred(NodeImportacao.ChildNodes.Count) do
  begin
    // Acessa o nó filho atual
    NodeDados := NodeImportacao.ChildNodes[Contador];

    // Preenche o DataSet com os dados do nó
    DataSet.Append;
    DataSet.FieldByName('Codigo').AsString := NodeDados.ChildNodes['codigo'].Text;
    DataSet.FieldByName('Nome').AsString := NodeDados.ChildNodes['nome'].Text;
    DataSet.FieldByName('Cidade').AsString := NodeDados.ChildNodes['cidade'].Text;
    DataSet.Post;
  end;
end;

procedure TParserXML.SetProximoParser(Parser: IParser);
begin
  // Atribui o próximo Parser
  ProximoParser := Parser;
end;

end.
