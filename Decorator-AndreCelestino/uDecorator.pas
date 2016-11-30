unit uDecorator;

interface

uses
  uComponent;

type
  { Decorator }
  TDecorator = class(TInterfacedObject, ILogExcecao)
  protected
    FoLogExcecao: ILogExcecao;

    function ObterDadosExcecao: string; virtual;
  public
    constructor Create(LogExcecao: ILogExcecao);
  end;

implementation

constructor TDecorator.Create(LogExcecao: ILogExcecao);
begin
  // armazena uma refer�ncia para o objeto que ser� decorado
  FoLogExcecao := LogExcecao;
end;

function TDecorator.ObterDadosExcecao: string;
begin
  result := FoLogExcecao.ObterDadosExcecao;
  result := result + #13#10;
end;

end.
