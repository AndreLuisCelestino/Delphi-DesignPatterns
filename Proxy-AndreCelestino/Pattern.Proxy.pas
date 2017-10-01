unit Pattern.Proxy;

interface

uses
  DBClient, Pattern.Subject, Data.DBXJSONReflect;

type
  { Proxy }
  TCalculadorProxy = class(TInterfacedObject, ICalculador)
  private
    // Armazena uma referência para o Real Subject (objeto real)
    CalculadorReal: ICalculador;

    // DataSet para armazenar os dados de cache
    CacheDados: TClientDataSet;
  public
    constructor Create;

    // Método da Interface
    function CalcularDistancia(const Origem, Destino: string): string;
  end;

implementation

uses
  DB, Variants, SysUtils, Forms, Pattern.RealSubject;

{ TCalculadorProxy }

function TCalculadorProxy.CalcularDistancia(const Origem,
  Destino: string): string;
begin
  // Verifica se o valor da distância está no DataSet de cache
  if CacheDados.Locate('Origem;Destino', VarArrayOf([Origem, Destino]), []) then
  begin
    // Se o valor estiver no DataSet, não é necessário chamar o objeto real
    result := CacheDados.FieldByName('Distancia').AsString;
    Exit;
  end;

  // Cria a instância objeto real (Real Subject) caso ela ainda não exista
  // Obs: a criação é sob demanda
  if not Assigned(CalculadorReal) then
    CalculadorReal := TCalculadorReal.Create;

  // Chama o objeto real para obter a distância usando a API do Google Maps
  result := CalculadorReal.CalcularDistancia(Origem, Destino);

  // Adiciona os dados no DataSet de cache
  // para evitar uma nova requisição à API, aumentando o desempenho da aplicação
  CacheDados.AppendRecord([Origem, Destino, result]);

  // Salva o arquivo de cache em disco
  CacheDados.SaveToFile(ExtractFilePath(Application.ExeName) + 'Cache.xml');
end;

constructor TCalculadorProxy.Create;
var
  ArquivoCache: string;
begin
  // Cria o DataSet de cache (tabela temporária)
  CacheDados := TClientDataSet.Create(nil);

  // Se o arquivo de cache existir, é carregado
  ArquivoCache := ExtractFilePath(Application.ExeName) + 'Cache.xml';
  if FileExists(ArquivoCache) then
    CacheDados.LoadFromFile(ArquivoCache)
  else
  begin
    // Caso contrário, a estrutura do DataSet é criada para ser usado pela primeira vez
    // ou a cada vez que o cache for excluído do diretório da aplicação
    CacheDados.FieldDefs.Add('Origem', ftString, 50);
    CacheDados.FieldDefs.Add('Destino', ftString, 50);
    CacheDados.FieldDefs.Add('Distancia', ftString, 10);
    CacheDados.CreateDataSet;
  end;

  // Desliga o log de alterações
  CacheDados.LogChanges := False;
end;

end.
