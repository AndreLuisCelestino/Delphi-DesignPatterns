// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl
// Encoding : UTF-8
// Version  : 1.0
// ************************************************************************ //

unit WebService.BCB;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"

  WSValorSerieVO       = class;                 { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br" }
  WSSerieVO            = class;                 { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br" }

  ArrayOfflong = array of Int64;                { "http://DefaultNamespace" }


  // ************************************************************************ //
  // Namespace : http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br
  // ************************************************************************ //
  WSValorSerieVO = class(TRemotable)
  private
    Fano: Integer;
    FanoFim: Integer;
    Fbloqueado: Boolean;
    FbloqueioLiberado: Boolean;
    Fdia: Integer;
    FdiaFim: Integer;
    Fmes: Integer;
    FmesFim: Integer;
    Foid: Int64;
    FoidSerie: Int64;
    Fsvalor: WideString;
    Fvalor: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property ano: Integer read Fano write Fano;
    property anoFim: Integer read FanoFim write FanoFim;
    property bloqueado: Boolean read Fbloqueado write Fbloqueado;
    property bloqueioLiberado: Boolean read FbloqueioLiberado write FbloqueioLiberado;
    property dia: Integer read Fdia write Fdia;
    property diaFim: Integer read FdiaFim write FdiaFim;
    property mes: Integer read Fmes write Fmes;
    property mesFim: Integer read FmesFim write FmesFim;
    property oid: Int64 read Foid write Foid;
    property oidSerie: Int64 read FoidSerie write FoidSerie;
    property svalor: WideString read Fsvalor write Fsvalor;
    property valor: TXSDecimal read Fvalor write Fvalor;
  end;

  ArrayOf_tns2_WSValorSerieVO = array of WSValorSerieVO;   { "https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS" }


  // ************************************************************************ //
  // Namespace : http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br
  // ************************************************************************ //
  WSSerieVO = class(TRemotable)
  private
    FanoFim: Integer;
    FanoInicio: Integer;
    Faviso: WideString;
    FdiaFim: Integer;
    FdiaInicio: Integer;
    Fespecial: Boolean;
    Ffonte: WideString;
    FfullName: WideString;
    FgestorProprietario: WideString;
    FmesFim: Integer;
    FmesInicio: Integer;
    FnomeAbreviado: WideString;
    FnomeCompleto: WideString;
    Foid: Int64;
    Fperiodicidade: WideString;
    FperiodicidadeSigla: WideString;
    FpossuiBloqueios: Boolean;
    Fpublica: Boolean;
    FshortName: WideString;
    FultimoValor: WSValorSerieVO;
    FunidadePadrao: WideString;
    FunidadePadraoIngles: WideString;
    FvalorDiaNaoUtil: Boolean;
    Fvalores: ArrayOf_tns2_WSValorSerieVO;
  public
    destructor Destroy; override;
  published
    property anoFim: Integer read FanoFim write FanoFim;
    property anoInicio: Integer read FanoInicio write FanoInicio;
    property aviso: WideString read Faviso write Faviso;
    property diaFim: Integer read FdiaFim write FdiaFim;
    property diaInicio: Integer read FdiaInicio write FdiaInicio;
    property especial: Boolean read Fespecial write Fespecial;
    property fonte: WideString read Ffonte write Ffonte;
    property fullName: WideString read FfullName write FfullName;
    property gestorProprietario: WideString read FgestorProprietario write FgestorProprietario;
    property mesFim: Integer read FmesFim write FmesFim;
    property mesInicio: Integer read FmesInicio write FmesInicio;
    property nomeAbreviado: WideString read FnomeAbreviado write FnomeAbreviado;
    property nomeCompleto: WideString read FnomeCompleto write FnomeCompleto;
    property oid: Int64 read Foid write Foid;
    property periodicidade: WideString read Fperiodicidade write Fperiodicidade;
    property periodicidadeSigla: WideString read FperiodicidadeSigla write FperiodicidadeSigla;
    property possuiBloqueios: Boolean read FpossuiBloqueios write FpossuiBloqueios;
    property publica: Boolean read Fpublica write Fpublica;
    property shortName: WideString read FshortName write FshortName;
    property ultimoValor: WSValorSerieVO read FultimoValor write FultimoValor;
    property unidadePadrao: WideString read FunidadePadrao write FunidadePadrao;
    property unidadePadraoIngles: WideString read FunidadePadraoIngles write FunidadePadraoIngles;
    property valorDiaNaoUtil: Boolean read FvalorDiaNaoUtil write FvalorDiaNaoUtil;
    property valores: ArrayOf_tns2_WSValorSerieVO read Fvalores write Fvalores;
  end;

  ArrayOffWSSerieVO = array of WSSerieVO;       { "http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br" }

  // ************************************************************************ //
  // Namespace : http://publico.ws.casosdeuso.sgs.pec.bcb.gov.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FachadaWSSGSSoapBinding
  // service   : FachadaWSSGSService
  // port      : FachadaWSSGS
  // URL       : https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS
  // ************************************************************************ //
  FachadaWSSGS = interface(IInvokable)
  ['{A1C63EC0-C9C9-66FD-56BD-D3EE44F902C2}']
    function  getValoresSeriesVO(const in0: ArrayOfflong; const in1: WideString; const in2: WideString): ArrayOffWSSerieVO; stdcall;
    function  getUltimosValoresSerieVO(const in0: Int64; const in1: Int64): WSSerieVO; stdcall;
    function  getValoresSeriesXML(const in0: ArrayOfflong; const in1: WideString; const in2: WideString): WideString; stdcall;
    function  getUltimoValorVO(const in0: Int64): WSSerieVO; stdcall;
    function  getUltimoValorXML(const in0: Int64): WideString; stdcall;
    function  getValor(const in0: Int64; const in1: WideString): TXSDecimal; stdcall;
    function  getValorEspecial(const in0: Int64; const in1: WideString; const in2: WideString): TXSDecimal; stdcall;
  end;

function GetFachadaWSSGS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): FachadaWSSGS;


implementation

function GetFachadaWSSGS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): FachadaWSSGS;
const
  defWSDL = 'https://www3.bcb.gov.br/sgspub/JSP/sgsgeral/FachadaWSSGS.wsdl';
  defURL  = 'https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS';
  defSvc  = 'FachadaWSSGSService';
  defPrt  = 'FachadaWSSGS';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as FachadaWSSGS);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor WSValorSerieVO.Destroy;
begin
  if Assigned(Fvalor) then
    Fvalor.Free;
  inherited Destroy;
end;

destructor WSSerieVO.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fvalores)-1 do
    if Assigned(Fvalores[I]) then
      Fvalores[I].Free;
  SetLength(Fvalores, 0);
  if Assigned(FultimoValor) then
    FultimoValor.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(FachadaWSSGS), 'http://publico.ws.casosdeuso.sgs.pec.bcb.gov.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FachadaWSSGS), '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfflong), 'http://DefaultNamespace', 'ArrayOfflong');
  RemClassRegistry.RegisterXSClass(WSValorSerieVO, 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'WSValorSerieVO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOf_tns2_WSValorSerieVO), 'https://www3.bcb.gov.br/wssgs/services/FachadaWSSGS', 'ArrayOf_tns2_WSValorSerieVO');
  RemClassRegistry.RegisterXSClass(WSSerieVO, 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'WSSerieVO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOffWSSerieVO), 'http://comum.ws.casosdeuso.sgs.pec.bcb.gov.br', 'ArrayOffWSSerieVO');

end.