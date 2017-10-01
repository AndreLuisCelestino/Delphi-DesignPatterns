unit Pattern.Handler;

interface

uses
  DBClient;

type
  { Handler }
  IParser = interface
    // Setter para atribuir a referência do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

implementation

end.
