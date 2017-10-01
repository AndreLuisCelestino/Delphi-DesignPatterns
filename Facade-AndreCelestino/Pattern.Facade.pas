unit Pattern.Facade;

interface

type
  { Façade }
  TFacade = class
  public
    // operação do Façade
    procedure CalcularValorDeVenda(const Fidelidade: integer; const Preco: real);
  end;

implementation

uses
  SysUtils, Pattern.Subsystem.CotacaoDolar, Pattern.Subsystem.CalculoLoja,
  Pattern.Subsystem.Historico;

{ TFacade }

procedure TFacade.CalcularValorDeVenda(const Fidelidade: integer;
  const Preco: real);
var
  SubsystemCotacaoDolar: TSubsystemCotacaoDolar;
  SubsystemCalculoLoja: TSubsystemCalculoLoja;
  SubsystemHistorico: TSubsystemHistorico;
  CotacaoDolar: real;
  ValorVenda: real;
begin
  // cria as instâncias dos Subsystems
  SubsystemCotacaoDolar := TSubsystemCotacaoDolar.Create;
  SubsystemCalculoLoja := TSubsystemCalculoLoja.Create;
  SubsystemHistorico := TSubsystemHistorico.Create;
  try
    // utiliza o primeiro Subsystem para consultar a cotação do Dólar
    CotacaoDolar := SubsystemCotacaoDolar.ConsultarCotacaoDolar;

    // converte em Reais
    ValorVenda := Preco * CotacaoDolar;

    // utiliza o segundo Subsytem para aplicar desconto e margem de venda
    ValorVenda := SubsystemCalculoLoja.CalcularPrecoFinal(Fidelidade, ValorVenda);

    // utiliza o terceiro Subsystem para armazenar o histórico do cálculo
    SubsystemHistorico.RegistrarHistoricoDoCalculo(Fidelidade, CotacaoDolar, Preco, ValorVenda);
  finally
    // libera as instâncias da memória
    FreeAndNil(SubsystemCotacaoDolar);
    FreeAndNil(SubsystemCalculoLoja);
    FreeAndNil(SubsystemHistorico);
  end;
end;

end.
