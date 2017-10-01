unit Pattern.Component;

interface

type
  { Component }
  // essa Interface ser� implementada pelo Leaf e Composite }
  IViagem = interface
  
    { Operation }
    function CalcularValor: double;
  end;

implementation

end.
