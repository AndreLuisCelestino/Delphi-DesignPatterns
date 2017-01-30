unit uHandler;

interface

uses
  DBClient;

type
  { Handler }
  IParser = interface
    // Setter para atribuir a refer�ncia do Concrete Handler superior
    procedure SetProximoParser(Parser: IParser);

    // M�todo para processar a inclus�o de dados no DataSet
    procedure ProcessarInclusao(const NomeArquivo: string; DataSet: TClientDataSet);
  end;

implementation

end.
