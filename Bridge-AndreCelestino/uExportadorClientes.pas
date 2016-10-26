unit uExportadorClientes;

interface

uses
  uInterfaceExportador, uInterfaceFormato;

type
  TExportadorClientes = class(TInterfacedObject, IExportador)
  private
    FoFormato: IFormato;
    procedure EscreverCabecalho;
  public
    constructor Create(poFormato: IFormato);
    procedure ExportarDados(const pvDados: olevariant);
  end;

implementation

uses
  SysUtils, DBClient;

{ TExportadorClientes }

constructor TExportadorClientes.Create(poFormato: IFormato);
begin
  FoFormato := poFormato;
end;

procedure TExportadorClientes.EscreverCabecalho;
begin
  FoFormato.DesenharCabecalho('Código');
  FoFormato.DesenharCabecalho('Nome');
  FoFormato.DesenharCabecalho('Cidade');
end;

procedure TExportadorClientes.ExportarDados(const pvDados: olevariant);
var
  cdsDados: TClientDataSet;
  nContador: integer;
begin
  EscreverCabecalho;
  cdsDados := TClientDataSet.Create(nil);
  try
    cdsDados.Data := pvDados;
    cdsDados.First;
    while not cdsDados.Eof do
    begin

      FoFormato.PularLinha;
      for nContador := 0 to Pred(cdsDados.Fields.Count) do
        FoFormato.ExportarCampo(cdsDados.Fields[nContador].AsString);

      cdsDados.Next;
    end;
    FoFormato.SalvarArquivo('Clientes');
  finally
    FreeAndNil(cdsDados);
  end;
end;

end.
