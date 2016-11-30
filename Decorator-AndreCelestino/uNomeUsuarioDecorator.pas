unit uNomeUsuarioDecorator;

interface

uses
  uDecorator;

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
  nSize: DWord;
begin
  // retorna o login do usuário do sistema operacional
  nSize := 1024;
  SetLength(result, nSize);
  GetUserName(PChar(result), nSize);
  SetLength(result, nSize - 1);
end;

end.
