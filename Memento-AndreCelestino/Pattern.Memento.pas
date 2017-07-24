unit Pattern.Memento;

interface

type
  { Memento }
  TMemento = class
  private
    FTitulo: string;
    FTexto: WideString;
  public
    // Propriedade referente ao título do texto
    property Titulo: string read FTitulo write FTitulo;

    // Propriedade referente ao corpo do texto
    property Texto: WideString read FTexto write FTexto;
  end;

implementation

end.
