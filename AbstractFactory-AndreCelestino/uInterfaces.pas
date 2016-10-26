unit uInterfaces;

interface

type
  INotebook = interface
    function BuscarNome: string;
    function BuscarTamanhoTela: string;
    function BuscarMemoriaRAM: string;
  end;

  IDesktop = interface
    function BuscarNome: string;
    function BuscarNomeProcessador: string;
    function BuscarTamanhoHD: string;
  end;
  
  IFactoryMarca = interface
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

end.
