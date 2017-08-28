// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://regexlib.com/WebServices.asmx?WSDL
//  >Import : http://regexlib.com/WebServices.asmx?WSDL>0
//  >Import : http://regexlib.com/WebServices.asmx?WSDL>1
// Encoding : utf-8
// Version  : 1.0
// (25/08/2017 22:06:17 - - $Rev: 90173 $)
// ************************************************************************ //

unit WebService.RegExLib;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:schema          - "http://www.w3.org/2001/XMLSchema"[GblElm]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]

  listRegExpResult     = class;                 { "http://regexlib.com/webservices.asmx"[Cplx] }
  BaseDataObject       = class;                 { "http://regexlib.com/webservices.asmx"[GblCplx] }
  Expression           = class;                 { "http://regexlib.com/webservices.asmx"[GblCplx] }
  RegExpDetails        = class;                 { "http://regexlib.com/webservices.asmx"[GblCplx] }



  // ************************************************************************ //
  // XML       : listRegExpResult, <complexType>
  // Namespace : http://regexlib.com/webservices.asmx
  // ************************************************************************ //
  listRegExpResult = class(TRemotable)
  private
    Fschema: TXMLData;
  public
    destructor Destroy; override;
  published
    property schema: TXMLData  Index (IS_REF) read Fschema write Fschema;
  end;

  guid            =  type string;      { "http://microsoft.com/wsdl/types/"[GblSmpl] }


  // ************************************************************************ //
  // XML       : BaseDataObject, global, <complexType>
  // Namespace : http://regexlib.com/webservices.asmx
  // ************************************************************************ //
  BaseDataObject = class(TRemotable)
  private
    FId: Integer;
    FDateCreated: TXSDateTime;
    FDateModified: TXSDateTime;
    FIsDirty: Boolean;
  public
    destructor Destroy; override;
  published
    property Id:           Integer      read FId write FId;
    property DateCreated:  TXSDateTime  read FDateCreated write FDateCreated;
    property DateModified: TXSDateTime  read FDateModified write FDateModified;
    property IsDirty:      Boolean      read FIsDirty write FIsDirty;
  end;



  // ************************************************************************ //
  // XML       : Expression, global, <complexType>
  // Namespace : http://regexlib.com/webservices.asmx
  // ************************************************************************ //
  Expression = class(BaseDataObject)
  private
    FAuthorId: guid;
    FAuthorName: string;
    FAuthorName_Specified: boolean;
    FProviderId: Integer;
    FTitle: string;
    FTitle_Specified: boolean;
    FPattern: string;
    FPattern_Specified: boolean;
    FMatchingText: string;
    FMatchingText_Specified: boolean;
    FNonMatchingText: string;
    FNonMatchingText_Specified: boolean;
    FEnabled: Boolean;
    FRating: Integer;
    FSource: string;
    FSource_Specified: boolean;
    FDescription: string;
    FDescription_Specified: boolean;
    procedure SetAuthorName(Index: Integer; const Astring: string);
    function  AuthorName_Specified(Index: Integer): boolean;
    procedure SetTitle(Index: Integer; const Astring: string);
    function  Title_Specified(Index: Integer): boolean;
    procedure SetPattern(Index: Integer; const Astring: string);
    function  Pattern_Specified(Index: Integer): boolean;
    procedure SetMatchingText(Index: Integer; const Astring: string);
    function  MatchingText_Specified(Index: Integer): boolean;
    procedure SetNonMatchingText(Index: Integer; const Astring: string);
    function  NonMatchingText_Specified(Index: Integer): boolean;
    procedure SetSource(Index: Integer; const Astring: string);
    function  Source_Specified(Index: Integer): boolean;
    procedure SetDescription(Index: Integer; const Astring: string);
    function  Description_Specified(Index: Integer): boolean;
  published
    property AuthorId:        guid     read FAuthorId write FAuthorId;
    property AuthorName:      string   Index (IS_OPTN) read FAuthorName write SetAuthorName stored AuthorName_Specified;
    property ProviderId:      Integer  read FProviderId write FProviderId;
    property Title:           string   Index (IS_OPTN) read FTitle write SetTitle stored Title_Specified;
    property Pattern:         string   Index (IS_OPTN) read FPattern write SetPattern stored Pattern_Specified;
    property MatchingText:    string   Index (IS_OPTN) read FMatchingText write SetMatchingText stored MatchingText_Specified;
    property NonMatchingText: string   Index (IS_OPTN) read FNonMatchingText write SetNonMatchingText stored NonMatchingText_Specified;
    property Enabled:         Boolean  read FEnabled write FEnabled;
    property Rating:          Integer  read FRating write FRating;
    property Source:          string   Index (IS_OPTN) read FSource write SetSource stored Source_Specified;
    property Description:     string   Index (IS_OPTN) read FDescription write SetDescription stored Description_Specified;
  end;



  // ************************************************************************ //
  // XML       : RegExpDetails, global, <complexType>
  // Namespace : http://regexlib.com/webservices.asmx
  // ************************************************************************ //
  RegExpDetails = class(TRemotable)
  private
    Fuser_id: Integer;
    Fregexp_id: Integer;
    Fregular_expression: string;
    Fregular_expression_Specified: boolean;
    Fmatches: string;
    Fmatches_Specified: boolean;
    Fnot_matches: string;
    Fnot_matches_Specified: boolean;
    Fsource: string;
    Fsource_Specified: boolean;
    Fdescription: string;
    Fdescription_Specified: boolean;
    Fcreate_date: TXSDateTime;
    Fdisable: Boolean;
    Frating: Integer;
    procedure Setregular_expression(Index: Integer; const Astring: string);
    function  regular_expression_Specified(Index: Integer): boolean;
    procedure Setmatches(Index: Integer; const Astring: string);
    function  matches_Specified(Index: Integer): boolean;
    procedure Setnot_matches(Index: Integer; const Astring: string);
    function  not_matches_Specified(Index: Integer): boolean;
    procedure Setsource(Index: Integer; const Astring: string);
    function  source_Specified(Index: Integer): boolean;
    procedure Setdescription(Index: Integer; const Astring: string);
    function  description_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property user_id:            Integer      read Fuser_id write Fuser_id;
    property regexp_id:          Integer      read Fregexp_id write Fregexp_id;
    property regular_expression: string       Index (IS_OPTN) read Fregular_expression write Setregular_expression stored regular_expression_Specified;
    property matches:            string       Index (IS_OPTN) read Fmatches write Setmatches stored matches_Specified;
    property not_matches:        string       Index (IS_OPTN) read Fnot_matches write Setnot_matches stored not_matches_Specified;
    property source:             string       Index (IS_OPTN) read Fsource write Setsource stored source_Specified;
    property description:        string       Index (IS_OPTN) read Fdescription write Setdescription stored description_Specified;
    property create_date:        TXSDateTime  read Fcreate_date write Fcreate_date;
    property disable:            Boolean      read Fdisable write Fdisable;
    property rating:             Integer      read Frating write Frating;
  end;

  ArrayOfExpression = array of Expression;      { "http://regexlib.com/webservices.asmx"[GblCplx] }

  // ************************************************************************ //
  // Namespace : http://regexlib.com/webservices.asmx
  // soapAction: http://regexlib.com/webservices.asmx/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // use       : literal
  // binding   : WebservicesSoap
  // service   : Webservices
  // port      : WebservicesSoap
  // URL       : http://regexlib.com/WebServices.asmx
  // ************************************************************************ //
  WebservicesSoap = interface(IInvokable)
  ['{867D10A8-904A-4E03-0A95-AB24D3C829C0}']
    function  getRegExpDetails(const regexpId: Integer): RegExpDetails; stdcall;
    function  ListAllAsXml(const maxrows: Integer): ArrayOfExpression; stdcall;
    function  listRegExp(const keyword: string; const regexp_substring: string; const min_rating: Integer; const howmanyrows: Integer): listRegExpResult; stdcall;
  end;

function GetWebservicesSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): WebservicesSoap;


implementation
  uses System.SysUtils;

function GetWebservicesSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): WebservicesSoap;
const
  defWSDL = 'http://regexlib.com/WebServices.asmx?WSDL';
  defURL  = 'http://regexlib.com/WebServices.asmx';
  defSvc  = 'Webservices';
  defPrt  = 'WebservicesSoap';
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
    Result := (RIO as WebservicesSoap);
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


destructor listRegExpResult.Destroy;
begin
  System.SysUtils.FreeAndNil(Fschema);
  inherited Destroy;
end;

destructor BaseDataObject.Destroy;
begin
  System.SysUtils.FreeAndNil(FDateCreated);
  System.SysUtils.FreeAndNil(FDateModified);
  inherited Destroy;
end;

procedure Expression.SetAuthorName(Index: Integer; const Astring: string);
begin
  FAuthorName := Astring;
  FAuthorName_Specified := True;
end;

function Expression.AuthorName_Specified(Index: Integer): boolean;
begin
  Result := FAuthorName_Specified;
end;

procedure Expression.SetTitle(Index: Integer; const Astring: string);
begin
  FTitle := Astring;
  FTitle_Specified := True;
end;

function Expression.Title_Specified(Index: Integer): boolean;
begin
  Result := FTitle_Specified;
end;

procedure Expression.SetPattern(Index: Integer; const Astring: string);
begin
  FPattern := Astring;
  FPattern_Specified := True;
end;

function Expression.Pattern_Specified(Index: Integer): boolean;
begin
  Result := FPattern_Specified;
end;

procedure Expression.SetMatchingText(Index: Integer; const Astring: string);
begin
  FMatchingText := Astring;
  FMatchingText_Specified := True;
end;

function Expression.MatchingText_Specified(Index: Integer): boolean;
begin
  Result := FMatchingText_Specified;
end;

procedure Expression.SetNonMatchingText(Index: Integer; const Astring: string);
begin
  FNonMatchingText := Astring;
  FNonMatchingText_Specified := True;
end;

function Expression.NonMatchingText_Specified(Index: Integer): boolean;
begin
  Result := FNonMatchingText_Specified;
end;

procedure Expression.SetSource(Index: Integer; const Astring: string);
begin
  FSource := Astring;
  FSource_Specified := True;
end;

function Expression.Source_Specified(Index: Integer): boolean;
begin
  Result := FSource_Specified;
end;

procedure Expression.SetDescription(Index: Integer; const Astring: string);
begin
  FDescription := Astring;
  FDescription_Specified := True;
end;

function Expression.Description_Specified(Index: Integer): boolean;
begin
  Result := FDescription_Specified;
end;

destructor RegExpDetails.Destroy;
begin
  System.SysUtils.FreeAndNil(Fcreate_date);
  inherited Destroy;
end;

procedure RegExpDetails.Setregular_expression(Index: Integer; const Astring: string);
begin
  Fregular_expression := Astring;
  Fregular_expression_Specified := True;
end;

function RegExpDetails.regular_expression_Specified(Index: Integer): boolean;
begin
  Result := Fregular_expression_Specified;
end;

procedure RegExpDetails.Setmatches(Index: Integer; const Astring: string);
begin
  Fmatches := Astring;
  Fmatches_Specified := True;
end;

function RegExpDetails.matches_Specified(Index: Integer): boolean;
begin
  Result := Fmatches_Specified;
end;

procedure RegExpDetails.Setnot_matches(Index: Integer; const Astring: string);
begin
  Fnot_matches := Astring;
  Fnot_matches_Specified := True;
end;

function RegExpDetails.not_matches_Specified(Index: Integer): boolean;
begin
  Result := Fnot_matches_Specified;
end;

procedure RegExpDetails.Setsource(Index: Integer; const Astring: string);
begin
  Fsource := Astring;
  Fsource_Specified := True;
end;

function RegExpDetails.source_Specified(Index: Integer): boolean;
begin
  Result := Fsource_Specified;
end;

procedure RegExpDetails.Setdescription(Index: Integer; const Astring: string);
begin
  Fdescription := Astring;
  Fdescription_Specified := True;
end;

function RegExpDetails.description_Specified(Index: Integer): boolean;
begin
  Result := Fdescription_Specified;
end;

initialization
  { WebservicesSoap }
  InvRegistry.RegisterInterface(TypeInfo(WebservicesSoap), 'http://regexlib.com/webservices.asmx', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WebservicesSoap), 'http://regexlib.com/webservices.asmx/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WebservicesSoap), ioDocument);
  { WebservicesSoap.getRegExpDetails }
  InvRegistry.RegisterMethodInfo(TypeInfo(WebservicesSoap), 'getRegExpDetails', '',
                                 '[ReturnName="getRegExpDetailsResult"]', IS_OPTN);
  { WebservicesSoap.ListAllAsXml }
  InvRegistry.RegisterMethodInfo(TypeInfo(WebservicesSoap), 'ListAllAsXml', '',
                                 '[ReturnName="ListAllAsXmlResult"]', IS_OPTN);
  InvRegistry.RegisterParamInfo(TypeInfo(WebservicesSoap), 'ListAllAsXml', 'ListAllAsXmlResult', '',
                                '[ArrayItemName="Expression"]');
  { WebservicesSoap.listRegExp }
  InvRegistry.RegisterMethodInfo(TypeInfo(WebservicesSoap), 'listRegExp', '',
                                 '[ReturnName="listRegExpResult"]', IS_OPTN);
  RemClassRegistry.RegisterXSClass(listRegExpResult, 'http://regexlib.com/webservices.asmx', 'listRegExpResult');
  RemClassRegistry.RegisterXSInfo(TypeInfo(guid), 'http://microsoft.com/wsdl/types/', 'guid');
  RemClassRegistry.RegisterXSClass(BaseDataObject, 'http://regexlib.com/webservices.asmx', 'BaseDataObject');
  RemClassRegistry.RegisterXSClass(Expression, 'http://regexlib.com/webservices.asmx', 'Expression');
  RemClassRegistry.RegisterXSClass(RegExpDetails, 'http://regexlib.com/webservices.asmx', 'RegExpDetails');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfExpression), 'http://regexlib.com/webservices.asmx', 'ArrayOfExpression');

end.