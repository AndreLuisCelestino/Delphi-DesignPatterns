unit Pattern.Decorator;

interface

uses
  Pattern.Component;

type
  { Decorator }
  TDecorator = class(TInterfacedObject, ILogExcecao)
  protected
    LogExcecao: ILogExcecao;

    function ObterDadosExcecao: string; virtual;
  public
    constructor Create(LogExcecao: ILogExcecao);
  end;

implementation

constructor TDecorator.Create(LogExcecao: ILogExcecao);
begin
  // armazena uma refer�ncia para o objeto que ser� decorado
  Self.LogExcecao := LogExcecao;
end;

function TDecorator.ObterDadosExcecao: string;
begin
  result := LogExcecao.ObterDadosExcecao;
  result := result + #13#10;
end;

end.
