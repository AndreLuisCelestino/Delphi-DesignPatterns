unit Pattern.ConcreteIterator;

interface

uses
  Contnrs, Pattern.Iterator, Pattern.Aggregate;

type
  TConcreteIterator = class(TInterfacedObject, IIterator)
  private
    FAggregate: IAggregate;
    FIndice: integer;
  public
    constructor Create(Aggregate: IAggregate);

    procedure PrimeiroObjeto;
    procedure ProximoObjeto;
    function ObjetoAtual: TObject;
    function FimLista: boolean;
    function Buscar(const Indice: integer): TObject;
  end;

implementation

uses
  System.Classes;

{ TConcreteIterator }

constructor TConcreteIterator.Create(Aggregate: IAggregate);
begin
  FAggregate := Aggregate;
end;

function TConcreteIterator.Buscar(const Indice: integer): TObject;
begin
  result := FAggregate.GetLista.Items[Indice];
end;

function TConcreteIterator.FimLista: boolean;
begin
  result := FIndice = Pred(FAggregate.GetLista.Count);
end;

function TConcreteIterator.ObjetoAtual: TObject;
begin
  result := FAggregate.GetLista.Items[FIndice];
end;

procedure TConcreteIterator.PrimeiroObjeto;
begin
  FIndice := 0;
end;

procedure TConcreteIterator.ProximoObjeto;
begin
  Inc(FIndice);
end;

end.
