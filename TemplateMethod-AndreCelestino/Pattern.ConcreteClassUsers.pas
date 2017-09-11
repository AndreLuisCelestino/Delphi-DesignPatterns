unit Pattern.ConcreteClassUsers;

interface

uses
  Pattern.AbstractClass;

type
  TConcreteClassUsers = class(TAbstractClass)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const Parametro: string);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient;

{ TConcreteClassUsers }

constructor TConcreteClassUsers.Create(const Parametro: string);
begin
  // Configura os parâmetros referente à consulta de usuários
  FParametros := Format('users?q=%s&page=1&per_page=100', [Parametro]);
end;

function TConcreteClassUsers.ProcessarRetorno: olevariant;
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
    DataSetRetorno.FieldDefs.Add('Login', ftString, 20);
    DataSetRetorno.FieldDefs.Add('URL', ftString, 40);
    DataSetRetorno.FieldDefs.Add('Score', ftFloat);
    DataSetRetorno.CreateDataSet;

    // Percorre o JSON, lendo os valores das chaves
    for JSONValue in FJSON.GetValue('items') as TJSONArray do
    begin
      JSONObject := JSONValue as TJSONObject;

      DataSetRetorno.AppendRecord([
        JSONObject.GetValue('id').Value,
        JSONObject.GetValue('login').Value,
        JSONObject.GetValue('html_url').Value,
        JSONObject.GetValue('score').Value
      ]);
    end;

    // Devolve os dados tabulados
    result := DataSetRetorno.Data;
  finally
    DataSetRetorno.Free;
  end;
end;

end.
