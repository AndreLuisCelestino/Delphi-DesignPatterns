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
  // cria uma inst�ncia da classe THTTPRIO
  HTTPRIO := THTTPRIO.Create(nil);

  // obt�m uma inst�ncia do WSDL
  WebServiceCotacao := GetFachadaWSSGS(True, '', HTTPRIO);

  // customiza o separador de decimais para evitar erro de convers�o
  FormatSettings.DecimalSeparator := '.';

  // invoca o WebService para buscar a cota��o do D�lar do dia
  result := StrToFloat(WebServiceCotacao.getUltimoValorVO(1).ultimoValor.sValor, FormatSettings);
end;

end.
 