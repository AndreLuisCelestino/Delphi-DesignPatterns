unit Pattern.Subsystem.CotacaoDolar;

interface

type
  { Subsystem }
  TSubsystemCotacaoDolar = class
  public
    function ConsultarCotacaoDolar: real;
  end;

implementation

uses
  SysUtils, WebService.BCB, SOAPHTTPClient, Windows;

{ TSubsystemCotacaoDolar }

function TSubsystemCotacaoDolar.ConsultarCotacaoDolar: real;
var
  WebServiceCotacao: FachadaWSSGS;
  HTTPRIO: THTTPRIO;
  FormatSettings : TFormatSettings;
begin
  // cria uma instância da classe THTTPRIO
  HTTPRIO := THTTPRIO.Create(nil);

  // obtém uma instância do WSDL
  WebServiceCotacao := GetFachadaWSSGS(True, '', HTTPRIO);

  // customiza o separador de decimais para evitar erro de conversão
  FormatSettings.DecimalSeparator := '.';

  // invoca o WebService para buscar a cotação do Dólar do dia
  result := StrToFloat(WebServiceCotacao.getUltimoValorVO(1).ultimoValor.sValor, FormatSettings);
end;

end.
 