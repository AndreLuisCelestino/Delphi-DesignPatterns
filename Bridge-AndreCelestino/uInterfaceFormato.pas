unit uInterfaceFormato;

interface

type
  { Implementor }
  IFormato = interface
    procedure PularLinha;
    procedure DesenharCabecalho(const psTitulo: string);
    procedure ExportarCampo(const psValor: string);
    procedure SalvarArquivo(const psNomeArquivo: string);
  end;

implementation

end.
