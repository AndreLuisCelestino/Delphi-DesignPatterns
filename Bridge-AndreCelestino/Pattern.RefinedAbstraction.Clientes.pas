unit Pattern.RefinedAbstraction.Clientes;

interface

uses
  Pattern.Abstraction, Pattern.Implementor;

type
  { Refined Abstraction }
  TExportadorClientes = class(TInterfacedObject, IExportador)
  private
    Formato: IFormato;
    procedure EscreverCabecalho;
  public
    constructor Create(Formato: IFormato);
    procedure ExportarDados(const Dados: olevariant);
  end;

implementation

uses
  SysUtils, DBClient;

{ TExportadorClientes }

constructor TExportadorClientes.Create(Formato: IFormato);
begin
  Self.Formato := Formato;
end;

procedure TExportadorClientes.EscreverCabecalho;
begin
  Formato.DesenharCabecalho('Código');
  Formato.DesenharCabecalho('Nome');
  Formato.DesenharCabecalho('Cidade');
end;

procedure TExportadorClientes.ExportarDados(const Dados: olevariant);
var
  cdsDados: TClientDataSet;
  nContador: integer;
begin
  EscreverCabecalho;
  cdsDados := TClientDataSet.Create(nil);
  try
    cdsDados.Data := Dados;
    cdsDados.First;
    while not cdsDados.Eof do
    begin

      Formato.PularLinha;
      for nContador := 0 to Pred(cdsDados.Fields.Count) do
        Formato.ExportarCampo(cdsDados.Fields[nContador].AsString);

      cdsDados.Next;
    end;
    Formato.SalvarArquivo('Clientes');
  finally
    FreeAndNil(cdsDados);
  end;
end;

end.
