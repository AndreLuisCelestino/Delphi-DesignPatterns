unit Pattern.Element;

interface

type
  { Element }
  IElement = interface
    // Método que chamará o Visitor para executar a operação
    procedure Accept(Visitor: IInterface);
  end;

implementation

end.
