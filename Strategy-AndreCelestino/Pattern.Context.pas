unit Pattern.Context;

interface

uses
  Pattern.Strategy;

type
  // Tipo enumerado que corresponde a cada Concrete Strategy
  TTipoValidacao = (avDLL, avRegExLib, avMailBoxLayer);

  { Context }
  TContext = class
  private
    // Vari�vel para manter uma refer�ncia ao Strategy selecionado
    FStrategy: IStrategy;
  public
    // M�todo respons�vel por encaminhar a valida��o do e-mail para o Strategy
    function ValidarEmail(const TipoValidacao: TTipoValidacao; const Email: string): boolean;
  end;

implementation

uses
  Pattern.ConcreteStrategyDLL,
  Pattern.ConcreteStrategyRegExLib,
  Pattern.ConcreteStrategyMailBoxLayer;

{ TContext }

function TContext.ValidarEmail(const TipoValidacao: TTipoValidacao;
  const Email: string): boolean;
begin
  // Recebe uma inst�ncia de um Concrete Strategy conforme o tipo de valida��o selecionado
  case TipoValidacao of
    avDLL:          FStrategy := TConcreteStrategyDLL.Create;
    avRegExLib:     FStrategy := TConcreteStrategyRegExLib.Create;
    avMailBoxLayer: FStrategy := TConcreteStrategyMailBoxLayer.Create;
  end;

  // Chama a fun��o "ValidarEmail" do Concrete Strategy
  result := FStrategy.ValidarEmail(Email);
end;

end.
