unit Pattern.Product.Notebooks;

interface

uses
  Pattern.AbstractProduct;

type
  { Product }
  TVostro = class(TInterfacedObject, INotebook)
  private
    function BuscarNome: string;
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  { Product }
  TMacBook = class(TInterfacedObject, INotebook)
  private
    function BuscarNome: string;
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  { Product }
  TL440 = class(TInterfacedObject, INotebook)
  private
    function BuscarNome: string;
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

implementation

{ TVostro }

function TVostro.BuscarMemoriaRAM: string;
begin
  result := '3GB DDR3';
end;

function TVostro.BuscarNome: string;
begin
  result := 'Vostro';
end;

function TVostro.BuscarTamanhoTela: string;
begin
  result := '15 polegadas';
end;

{ TMacBook }

function TMacBook.BuscarMemoriaRAM: string;
begin
  result := '4GB DDR3';
end;

function TMacBook.BuscarNome: string;
begin
  result := 'MacBook';
end;

function TMacBook.BuscarTamanhoTela: string;
begin
  result := '11.6 polegadas';
end;

{ TL440 }

function TL440.BuscarMemoriaRAM: string;
begin
  result := '8GB DDR3';
end;

function TL440.BuscarNome: string;
begin
  result := 'L440';
end;

function TL440.BuscarTamanhoTela: string;
begin
  result := '14 polegadas';
end;

end.
