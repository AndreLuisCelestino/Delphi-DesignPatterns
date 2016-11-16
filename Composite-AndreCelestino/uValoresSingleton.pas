unit uValoresSingleton;

interface

uses
  DBClient;

type
  { Singleton para consulta dos valores das viagens.
    Os valores foram consultados para o dia 01/11/2016.
    Para mais informações sobre este Design Pattern, acesse:
    http://www.andrecelestino.com/delphi-design-patterns-singleton/ }

  TValoresSingleton = class
  private
    FoDataSet: TClientDataSet;

    constructor Create;
  public
    destructor Destroy; override;
    class function ObterInstancia: TValoresSingleton;
    class function NewInstance: TObject; override;
    function ConsultarValorViagem(const psOrigem, psDestino: string): double;
  end;

implementation

uses
  SysUtils, Variants, Forms;

var
  Instancia: TValoresSingleton;

{ TValoresSingleton }

function TValoresSingleton.ConsultarValorViagem(const psOrigem,
  psDestino: string): double;
begin
  // Localiza o valor da viagem conforme origem e destino informados
  FoDataSet.Locate('Origem;Destino', VarArrayOf([psOrigem, psDestino]), []);

  result := FoDataSet.FieldByName('Valor').AsFloat;
end;

constructor TValoresSingleton.Create;
begin
  FoDataSet := TClientDataSet.Create(nil);

  // Carrega os dados que estão armazendos no XML
  FoDataSet.LoadFromFile(ExtractFilePath(Application.ExeName) + 'TarifaViagens.xml');
end;

destructor TValoresSingleton.Destroy;
begin
  FreeAndNil(FoDataSet);
  inherited;
end;

class function TValoresSingleton.NewInstance: TObject;
begin
  if not Assigned(Instancia) then
    Instancia := TValoresSingleton(inherited NewInstance);
 
  result := Instancia;
end;

class function TValoresSingleton.ObterInstancia: TValoresSingleton;
begin
  result := TValoresSingleton.Create;
end;

end.
