unit Pattern.Caretaker;

interface

uses
  Pattern.Memento, System.Generics.Collections;

type
  { Caretaker }
  TCaretaker = class
  private
    FHistoricoAlteracoes: TObjectDictionary<string, TMemento>;
  public
    constructor Create;
    destructor Destroy; override;

    // Método para adicionar um novo Memento na lista
    procedure Adicionar(const DataHora: string; Memento: TMemento);

    // Função para retornar um Memento conforme a data e hora
    function Obter(const DataHora: string): TMemento;
  end;

implementation

{ TCaretaker }

constructor TCaretaker.Create;
begin
  // Cria o dicionário de objetos
  // "doOwnsValues" significa que o próprio dicionário irá liberar os objetos internos
  FHistoricoAlteracoes := TObjectDictionary<string, TMemento>.Create([doOwnsValues]);
end;

destructor TCaretaker.Destroy;
begin
  // Libera o dicionário de objetos da memória
  FHistoricoAlteracoes.Free;

  inherited;
end;

procedure TCaretaker.Adicionar(const DataHora: string; Memento: TMemento);
begin
  // Adiciona o Memento no dicionário de objetos
  FHistoricoAlteracoes.Add(DataHora, Memento);
end;

function TCaretaker.Obter(const DataHora: string): TMemento;
begin
  // Obtém o memento conforme a chave, que é uma combinação da data e hora
  result := FHistoricoAlteracoes.Items[DataHora];
end;

end.
