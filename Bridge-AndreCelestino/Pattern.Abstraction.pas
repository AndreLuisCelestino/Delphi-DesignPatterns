unit Pattern.Abstraction;

interface

type
  { Abstraction }
  IExportador = interface
    procedure ExportarDados(const Dados: olevariant);
  end;

implementation

end.
