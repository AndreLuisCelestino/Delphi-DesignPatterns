unit uInterfaceExportador;

interface

type
  IExportador = interface
    procedure ExportarDados(const pvDados: olevariant);
  end;

implementation

end.
