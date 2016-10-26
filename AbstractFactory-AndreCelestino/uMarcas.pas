unit uMarcas;

interface

uses
  uInterfaces;

type
  TDell = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  TApple = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

  TLenovo = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

uses
  uNotebooks, uDesktops;

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
