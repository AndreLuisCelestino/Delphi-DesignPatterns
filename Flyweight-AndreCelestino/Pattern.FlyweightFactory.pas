unit Pattern.FlyweightFactory;

interface

uses
  Classes, Pattern.Flyweight, Pattern.ConcreteFlyweight;

type
  TFlyweightFactory = class
  private
    // variável para armazenar os objetos compartilhados
    ListaCartoes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // método principal do Flyweight,
    // responsável por encontrar e retornar o objeto já criado
    // ou criá-lo caso não exista, adicionando-o na lista de objetos compartilhados
    function GetCartao(const Pais: string): TCartao;
  end;

implementation

uses
  SysUtils;

{ TFlyweightFactory }

constructor TFlyweightFactory.Create;
begin
  // cria a lista de objetos compartilhados
  ListaCartoes := TStringList.Create;
  ListaCartoes.Sorted := True;
end;

destructor TFlyweightFactory.Destroy;
var
  Contador: integer;
begin
  for Contador := 0 to Pred(ListaCartoes.Count) do
    ListaCartoes.Objects[Contador].Free;

  // libera a lista de objetos compartilhados da memória
  FreeAndNil(ListaCartoes);
  inherited;
end;

function TFlyweightFactory.GetCartao(const Pais: string): TCartao;
var
  Indice: integer;
begin
  result := nil;

  // tenta encontrar o objeto compartilhado através do nome do país
  if ListaCartoes.Find(Pais, Indice) then
  begin
    // caso seja encontrado, o objeto compartilhado é retornado
    result := (ListaCartoes.Objects[Indice]) as TCartao;
    Exit;
  end;

  // caso não seja encontrado, é criado...
  if Pais = 'Espanha' then
    result := TCartaoEspanha.Create
  else if Pais = 'EUA' then
    result := TCartaoEUA.Create
  else if Pais = 'Brasil' then
    result := TCartaoBrasil.Create
  else if Pais = 'Itália' then
    result := TCartaoItalia.Create;

  // ... e depois adicionado na lista de objetos compartilhados
  // para que não precise ser criado novamente nas próximas iterações
  ListaCartoes.AddObject(Pais, result);
end;

end.
