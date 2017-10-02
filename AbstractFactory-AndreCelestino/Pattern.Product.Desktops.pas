unit Pattern.Product.Desktops;

interface

uses
  Pattern.AbstractProduct;

type
  { Product }
  TInspiron = class(TInterfacedObject, IDesktop)
  private
    function BuscarNome: string;
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

  { Product }
  TIMac = class(TInterfacedObject, IDesktop)
  private
    function BuscarNome: string;
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

  { Product }
  TThinkCentre = class(TInterfacedObject, IDesktop)
  private
    function BuscarNome: string;
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;

implementation

{ TInspiron }

function TInspiron.BuscarNome: string;
begin
  result := 'Inspiron';
end;

function TInspiron.BuscarNomeProcessador: string;
begin
  result := 'Intel Core i5';
end;

function TInspiron.BuscarTamanhoHD: string;
begin
  result := '1 TB';
end;

{ TIMac }

function TIMac.BuscarNome: string;
begin
  result := 'iMac';
end;

function TIMac.BuscarNomeProcessador: string;
begin
  result := 'Intel Core i7';
end;

function TIMac.BuscarTamanhoHD: string;
begin
  result := '500 GB';
end;

{ TThinkCentre }

function TThinkCentre.BuscarNome: string;
begin
  result := 'ThinkCentre';
end;

function TThinkCentre.BuscarNomeProcessador: string;
begin
  result := 'Intel Core i3';
end;

function TThinkCentre.BuscarTamanhoHD: string;
begin
  result := '250 GB SSD';
end;

end.
