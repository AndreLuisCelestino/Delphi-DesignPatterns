unit uConcreteComponent;

interface

uses
  SysUtils, uComponent;

type
  { Concrete Component }
  TLogExcecao = class(TInterfacedObject, ILogExcecao)
  private
    FoExcecao: Exception;

    function ObterDadosExcecao: string;
  public
    constructor Create(Excecao: Exception);
  end;

implementation

constructor TLogExcecao.Create(Excecao: Exception);
begin
  FoExcecao := Excecao;
end;

function TLogExcecao.ObterDadosExcecao: string;
begin
  // retorna a mensagem de exce��o
  result := 'Mensagem: ' + FoExcecao.Message;
end;

end.
