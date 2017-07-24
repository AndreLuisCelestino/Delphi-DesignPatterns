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
    // Propriedade referente ao t�tulo do texto
    property Titulo: string read FTitulo write FTitulo;

    // Propriedade referente ao corpo do texto
    property Texto: WideString read FTexto write FTexto;

    // Fun��o que cria, preenche e retorna um Memento
    function SalvarEstado: TMemento;

    // M�todo que usa o Memento informado no par�metro para restaurar o estado
    procedure RestaurarEstado(Memento: TMemento);
  end;

implementation

{ TOriginator }

procedure TOriginator.RestaurarEstado(Memento: TMemento);
begin
  // Sobrescreve as propriedades com os dados do Memento do par�metro
  FTitulo := Memento.Titulo;
  FTexto := Memento.Texto;
end;

function TOriginator.SalvarEstado: TMemento;
begin
  // Cria uma inst�ncia do Memento
  result := TMemento.Create;

  // Preenche o objeto
  result.Titulo := FTitulo;
  result.Texto := FTexto;
end;

end.
