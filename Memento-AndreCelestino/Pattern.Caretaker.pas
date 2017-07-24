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

    // M�todo para adicionar um novo Memento na lista
    procedure Adicionar(const DataHora: string; Memento: TMemento);

    // Fun��o para retornar um Memento conforme a data e hora
    function Obter(const DataHora: string): TMemento;
  end;

implementation

{ TCaretaker }

constructor TCaretaker.Create;
begin
  // Cria o dicion�rio de objetos
  // "doOwnsValues" significa que o pr�prio dicion�rio ir� liberar os objetos internos
  FHistoricoAlteracoes := TObjectDictionary<string, TMemento>.Create([doOwnsValues]);
end;

destructor TCaretaker.Destroy;
begin
  // Libera o dicion�rio de objetos da mem�ria
  FHistoricoAlteracoes.Free;

  inherited;
end;

procedure TCaretaker.Adicionar(const DataHora: string; Memento: TMemento);
begin
  // Adiciona o Memento no dicion�rio de objetos
  FHistoricoAlteracoes.Add(DataHora, Memento);
end;

function TCaretaker.Obter(const DataHora: string): TMemento;
begin
  // Obt�m o memento conforme a chave, que � uma combina��o da data e hora
  result := FHistoricoAlteracoes.Items[DataHora];
end;

end.
