unit Pattern.Originator;

interface

uses
  Pattern.Memento;

type
  { Originator }
  TOriginator = class
  private
    FTitulo: string;
    FTexto: WideString;
  public
    // Propriedade referente ao título do texto
    property Titulo: string read FTitulo write FTitulo;

    // Propriedade referente ao corpo do texto
    property Texto: WideString read FTexto write FTexto;

    // Função que cria, preenche e retorna um Memento
    function SalvarEstado: TMemento;

    // Método que usa o Memento informado no parâmetro para restaurar o estado
    procedure RestaurarEstado(Memento: TMemento);
  end;

implementation

{ TOriginator }

procedure TOriginator.RestaurarEstado(Memento: TMemento);
begin
  // Sobrescreve as propriedades com os dados do Memento do parâmetro
  FTitulo := Memento.Titulo;
  FTexto := Memento.Texto;
end;

function TOriginator.SalvarEstado: TMemento;
begin
  // Cria uma instância do Memento
  result := TMemento.Create;

  // Preenche o objeto
  result.Titulo := FTitulo;
  result.Texto := FTexto;
end;

end.
