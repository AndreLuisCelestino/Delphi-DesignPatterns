unit Pattern.AbstractProduct;

interface

type
  { Abstract Product }
  INotebook = interface
    function BuscarNome: string;
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  { Abstract Product }
  IDesktop = interface
    function BuscarNome: string;
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;
  
implementation

end.
