unit Pattern.Implementor;

interface

type
  { Implementor }
  IFormato = interface
    procedure PularLinha;
    procedure DesenharCabecalho(const Titulo: string);
    procedure ExportarCampo(const Valor: string);
    procedure SalvarArquivo(const NomeArquivo: string);
  end;

implementation

end.
