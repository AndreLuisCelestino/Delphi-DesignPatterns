unit Pattern.Decorator.DataHora;

interface

uses
  Pattern.Decorator;

type
  { Concrete Decorator }
  TDataHoraDecorator = class(TDecorator)
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils;

function TDataHoraDecorator.ObterDadosExcecao: string;
begin
  // retorna a string dos outros decoradores primeiro
  result := inherited ObterDadosExcecao;

  // adiciona a data e hora
  result := result + 'Data/Hora: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
end;

end.
