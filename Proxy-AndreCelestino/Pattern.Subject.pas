unit Pattern.Subject;

interface

type
  { Subject }
  ICalculador = interface
    // M�todo comum entre o Proxy e o Real Subject
    function CalcularDistancia(const Origem, Destino: string): string;
  end;

implementation

end.
