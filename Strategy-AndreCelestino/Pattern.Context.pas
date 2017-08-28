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
    // Variável para manter uma referência ao Strategy selecionado
    FStrategy: IStrategy;
  public
    // Método responsável por encaminhar a validação do e-mail para o Strategy
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
  // Recebe uma instância de um Concrete Strategy conforme o tipo de validação selecionado
  case TipoValidacao of
    avDLL:          FStrategy := TConcreteStrategyDLL.Create;
    avRegExLib:     FStrategy := TConcreteStrategyRegExLib.Create;
    avMailBoxLayer: FStrategy := TConcreteStrategyMailBoxLayer.Create;
  end;

  // Chama a função "ValidarEmail" do Concrete Strategy
  result := FStrategy.ValidarEmail(Email);
end;

end.
