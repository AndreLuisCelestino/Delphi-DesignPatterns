unit Pattern.Strategy;

interface

type
  { Strategy }
  IStrategy = interface
    function ValidarEmail(const Email: string): boolean;
  end;

implementation

end.
