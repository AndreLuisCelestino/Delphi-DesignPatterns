unit Pattern.ConcreteClassRepositories;

interface

uses
  Pattern.AbstractClass;

type
  { Concrete Class }
  TConcreteClassRepositories = class(TAbstractClass)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const Parametro: string);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient;

{ TConcreteClassRepositories }

constructor TConcreteClassRepositories.Create(const Parametro: string);
begin
  // Configura os parâmetros referente à consulta de repositórios
  FParametros := Format('repositories?q=%s&page=1&per_page=100', [Parametro]);
end;

function TConcreteClassRepositories.ProcessarRetorno: olevariant;
var
  DataSetRetorno: TClientDataSet;
  JSONValue: TJSONValue;
  JSONObject: TJSONObject;
begin
  // Cria um DataSet para tabular os dados consultados
  DataSetRetorno := TClientDataSet.Create(nil);
  try
    // Define as colunas
    DataSetRetorno.FieldDefs.Add('ID', ftInteger);
    DataSetRetorno.FieldDefs.Add('Nome', ftString, 40);
    DataSetRetorno.FieldDefs.Add('Linguagem', ftString, 18);
    DataSetRetorno.FieldDefs.Add('Observadores', ftInteger);
    DataSetRetorno.CreateDataSet;

    // Percorre o JSON, lendo os valores das chaves
    for JSONValue in FJSON.GetValue('items') as TJSONArray do
    begin
      JSONObject := JSONValue as TJSONObject;

      DataSetRetorno.AppendRecord([
        JSONObject.GetValue('id').Value,
        JSONObject.GetValue('full_name').Value,
        JSONObject.GetValue('language').Value,
        JSONObject.GetValue('watchers').Value
      ]);
    end;

    // Devolve os dados tabulados
    result := DataSetRetorno.Data;
  finally
    DataSetRetorno.Free;
  end;
end;

end.
