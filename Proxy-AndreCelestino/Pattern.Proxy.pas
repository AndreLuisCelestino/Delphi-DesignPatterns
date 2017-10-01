unit Pattern.Proxy;

interface

uses
  DBClient, Pattern.Subject, Data.DBXJSONReflect;

type
  { Proxy }
  TCalculadorProxy = class(TInterfacedObject, ICalculador)
  private
    // Armazena uma refer�ncia para o Real Subject (objeto real)
    CalculadorReal: ICalculador;

    // DataSet para armazenar os dados de cache
    CacheDados: TClientDataSet;
  public
    constructor Create;

    // M�todo da Interface
    function CalcularDistancia(const Origem, Destino: string): string;
  end;

implementation

uses
  DB, Variants, SysUtils, Forms, Pattern.RealSubject;

{ TCalculadorProxy }

function TCalculadorProxy.CalcularDistancia(const Origem,
  Destino: string): string;
begin
  // Verifica se o valor da dist�ncia est� no DataSet de cache
  if CacheDados.Locate('Origem;Destino', VarArrayOf([Origem, Destino]), []) then
  begin
    // Se o valor estiver no DataSet, n�o � necess�rio chamar o objeto real
    result := CacheDados.FieldByName('Distancia').AsString;
    Exit;
  end;

  // Cria a inst�ncia objeto real (Real Subject) caso ela ainda n�o exista
  // Obs: a cria��o � sob demanda
  if not Assigned(CalculadorReal) then
    CalculadorReal := TCalculadorReal.Create;

  // Chama o objeto real para obter a dist�ncia usando a API do Google Maps
  result := CalculadorReal.CalcularDistancia(Origem, Destino);

  // Adiciona os dados no DataSet de cache
  // para evitar uma nova requisi��o � API, aumentando o desempenho da aplica��o
  CacheDados.AppendRecord([Origem, Destino, result]);

  // Salva o arquivo de cache em disco
  CacheDados.SaveToFile(ExtractFilePath(Application.ExeName) + 'Cache.xml');
end;

constructor TCalculadorProxy.Create;
var
  ArquivoCache: string;
begin
  // Cria o DataSet de cache (tabela tempor�ria)
  CacheDados := TClientDataSet.Create(nil);

  // Se o arquivo de cache existir, � carregado
  ArquivoCache := ExtractFilePath(Application.ExeName) + 'Cache.xml';
  if FileExists(ArquivoCache) then
    CacheDados.LoadFromFile(ArquivoCache)
  else
  begin
    // Caso contr�rio, a estrutura do DataSet � criada para ser usado pela primeira vez
    // ou a cada vez que o cache for exclu�do do diret�rio da aplica��o
    CacheDados.FieldDefs.Add('Origem', ftString, 50);
    CacheDados.FieldDefs.Add('Destino', ftString, 50);
    CacheDados.FieldDefs.Add('Distancia', ftString, 10);
    CacheDados.CreateDataSet;
  end;

  // Desliga o log de altera��es
  CacheDados.LogChanges := False;
end;

end.
