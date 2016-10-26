unit uTipoPrazos;

interface

uses
  uInterfaces;

type
  // classe que implementa a Interface ITipoPrazo
  // e servirá como classe base para os tipos de prazos
  TTipoPrazo = class(TInterfacedObject, ITipoPrazo)
  protected
    FnValorTotal: real;

    function GerarProjecao(const pnValor, pnJuros: real;
      const pnQtdeParcelas, pnIntervalo: smallint): string;
    function ConsultarTotal: string;
  public
    function ConsultarDescricao: string; virtual; abstract;
    function ConsultarJuros: string; virtual; abstract;
    function ConsultarProjecao(const pnValor: real;
      const pnQtdeParcelas: integer): string; virtual; abstract;
  end;

  // classe referente ao tipo de prazo mensal
  TPrazoMensal = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pnValor: real;
      const pnQtdeParcelas: integer): string; override;
  end;

  // classe referente ao tipo de prazo semestral
  TPrazoSemestral = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pnValor: real;
      const pnQtdeParcelas: integer): string; override;
  end;

  // classe referente ao tipo de prazo anual
  TPrazoAnual = class(TTipoPrazo)
  public
    function ConsultarDescricao: string; override;
    function ConsultarJuros: string; override;
    function ConsultarProjecao(const pnValor: real;
      const pnQtdeParcelas: integer): string; override;
  end;

implementation

uses
  SysUtils, Classes;

{ TPrazo }

function TTipoPrazo.GerarProjecao(const pnValor, pnJuros: real;
  const pnQtdeParcelas, pnIntervalo: smallint): string;
var
  // TStringList para armazenar os dados das parcelas
  slProjecao: TStringList;
  // contador do número de parcelas
  nContador: smallint;
  // variável para armazenar o valor ajustado conforme os juros
  nValorAjustado: real;
  // variável para armazenar o valor com formatação de casas decimais
  sValorFormatado: string;
  // variável referente à data da parcela
  sDataParcela: string;
begin
  // acumulador do valor de parcelas
  FnValorTotal := 0;

  nValorAjustado := pnValor;
  sDataParcela := DateToStr(Date);
  slProjecao := TStringList.Create;
  try
    for nContador := 1 to pnQtdeParcelas do
    begin
      // calcula o valor
      nValorAjustado := nValorAjustado + (pnValor * pnJuros);
      // soma o valor na variável acumuladora
      FnValorTotal := FnValorTotal + nValorAjustado;
      // formata o valor calculado
      sValorFormatado := FormatFloat('###,##0.00', nValorAjustado);
      // incrementa a data conforme o tipo de prazo (1, 6 ou 12)
      sDataParcela := FormatDateTime('dd/mm/yyyy', IncMonth(StrToDate(sDataParcela), pnIntervalo));

      // adiciona os dados da parcela na TStringList
      slProjecao.Add(Format('Parcela %.2d (%s): %s', [nContador, sDataParcela, sValorFormatado]));
    end;
    // retorna o conteúdo da TStringList
    result := slProjecao.Text;
  finally
    FreeAndNil(slProjecao);
  end;
end;

function TTipoPrazo.ConsultarTotal: string;
begin
  result := 'Total: ' + FormatFloat('###,##0.00', FnValorTotal);
end;

{ TPrazoMensal }

function TPrazoMensal.ConsultarDescricao: string;
begin
  result := 'Prazo Mensal para Pagamento';
end;

function TPrazoMensal.ConsultarJuros: string;
begin
  result := 'Juros de 3,1% simples ao mês' + sLineBreak;
end;

function TPrazoMensal.ConsultarProjecao(const pnValor: real;
  const pnQtdeParcelas: integer): string;
begin
  // chama o método da classe base,
  // informando o percentual de 3,1% e intervalo de 1 mês
  result := GerarProjecao(pnValor, 0.031, pnQtdeParcelas, 1);
end;

{ TPrazoSemestral }

function TPrazoSemestral.ConsultarDescricao: string;
begin
    result := 'Prazo Semestral para Pagamento';
end;

function TPrazoSemestral.ConsultarJuros: string;
begin
  result := 'Juros de 5,8% simples ao semestre' + sLineBreak;
end;

function TPrazoSemestral.ConsultarProjecao(const pnValor: real;
  const pnQtdeParcelas: integer): string;
begin
  // chama o método da classe base,
  // informando o percentual de 5,8% e intervalo de 6 meses
  result := GerarProjecao(pnValor, 0.058, pnQtdeParcelas, 6);
end;

{ TPrazoAnual }

function TPrazoAnual.ConsultarDescricao: string;
begin
  result := 'Prazo Anual para Pagamento';
end;

function TPrazoAnual.ConsultarJuros: string;
begin
  result := 'Juros de 10,5% simples ao ano' + sLineBreak;
end;

function TPrazoAnual.ConsultarProjecao(const pnValor: real;
  const pnQtdeParcelas: integer): string;
begin
  // chama o método da classe base,
  // informando o percentual de 10,5% e intervalo de 12 meses
  result := GerarProjecao(pnValor, 0.105, pnQtdeParcelas, 12);
end;

end.
