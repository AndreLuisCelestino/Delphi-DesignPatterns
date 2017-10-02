unit Pattern.ConcreteFactory;

interface

uses
  Pattern.AbstractFactory, Pattern.AbstractProduct;

type
  { Concrete Factory }
  TDell = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  { Concrete Factory }
  TApple = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  { Concrete Factory }
  TLenovo = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

uses
  Pattern.Product.Desktops, Pattern.Product.Notebooks;

{ TDell }

function TDell.ConsultarDesktop: IDesktop;
begin
  result := TInspiron.Create;
end;

function TDell.ConsultarNotebook: INotebook;
begin
  result := TVostro.Create;
end;

{ TApple }

function TApple.ConsultarDesktop: IDesktop;
begin
  result := TIMac.Create;
end;

function TApple.ConsultarNotebook: INotebook;
begin
  result := TMacBook.Create
end;

{ TLenovo }

function TLenovo.ConsultarDesktop: IDesktop;
begin
  result := TThinkCentre.Create;
end;

function TLenovo.ConsultarNotebook: INotebook;
begin
  result := TL440.Create;
end;

end.
