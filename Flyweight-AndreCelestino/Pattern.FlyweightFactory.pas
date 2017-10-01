unit Pattern.FlyweightFactory;

interface

uses
  Classes, Pattern.Flyweight, Pattern.ConcreteFlyweight;

type
  TFlyweightFactory = class
  private
    // vari�vel para armazenar os objetos compartilhados
    ListaCartoes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // m�todo principal do Flyweight,
    // respons�vel por encontrar e retornar o objeto j� criado
    // ou cri�-lo caso n�o exista, adicionando-o na lista de objetos compartilhados
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

  // libera a lista de objetos compartilhados da mem�ria
  FreeAndNil(ListaCartoes);
  inherited;
end;

function TFlyweightFactory.GetCartao(const Pais: string): TCartao;
var
  Indice: integer;
begin
  result := nil;

  // tenta encontrar o objeto compartilhado atrav�s do nome do pa�s
  if ListaCartoes.Find(Pais, Indice) then
  begin
    // caso seja encontrado, o objeto compartilhado � retornado
    result := (ListaCartoes.Objects[Indice]) as TCartao;
    Exit;
  end;

  // caso n�o seja encontrado, � criado...
  if Pais = 'Espanha' then
    result := TCartaoEspanha.Create
  else if Pais = 'EUA' then
    result := TCartaoEUA.Create
  else if Pais = 'Brasil' then
    result := TCartaoBrasil.Create
  else if Pais = 'It�lia' then
    result := TCartaoItalia.Create;

  // ... e depois adicionado na lista de objetos compartilhados
  // para que n�o precise ser criado novamente nas pr�ximas itera��es
  ListaCartoes.AddObject(Pais, result);
end;

end.
