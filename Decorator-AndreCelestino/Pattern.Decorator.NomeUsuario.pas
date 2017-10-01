unit Pattern.Decorator.NomeUsuario;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TNomeUsuarioDecorator = class(TDecorator)
  private
    function ObterNomeUsuario: string;
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  Windows;

function TNomeUsuarioDecorator.ObterDadosExcecao: string;
begin
  // retorna a string dos outros decoradores primeiro
  result := inherited ObterDadosExcecao;

  // adiciona o nome do usuário
  result := result + 'Usuário: ' + ObterNomeUsuario;
end;

function TNomeUsuarioDecorator.ObterNomeUsuario: string;
var
  Size: DWord;
begin
  // retorna o login do usuário do sistema operacional
  Size := 1024;
  SetLength(result, Size);
  GetUserName(PChar(result), Size);
  SetLength(result, Size - 1);
end;

end.
