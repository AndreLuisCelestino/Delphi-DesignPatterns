unit Pattern.AbstractExpression;

interface

uses
  Classes, Pattern.Context;

type
  { AbstractExpression }
  TAbstractExpression = class
  protected
    // Vari�vel que armanezar� as partes da entrada
    Partes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // M�todo que ser� sobrescrito por todas as classes herdadas
    procedure Interpretar(Contexto: TContext); virtual; abstract;
  end;

implementation

uses
  SysUtils;

{ TAbstractExpression }

constructor TAbstractExpression.Create;
begin
  Partes := TStringList.Create;
end;

destructor TAbstractExpression.Destroy;
begin
  FreeAndNil(Partes);
end;

end.
