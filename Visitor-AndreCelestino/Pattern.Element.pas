unit Pattern.Element;

interface

type
  { Element }
  IElement = interface
    // M�todo que chamar� o Visitor para executar a opera��o
    procedure Accept(Visitor: IInterface);
  end;

implementation

end.
