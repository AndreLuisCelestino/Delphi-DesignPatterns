unit uExportadorProdutos;

interface

uses
  uInterfaceExportador, uInterfaceFormato;

type
  TExportadorProdutos = class(TInterfacedObject, IExportador)
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

{ TExportadorProdutos }

constructor TExportadorProdutos.Create(poFormato: IFormato);
begin
  FoFormato := poFormato;
end;

procedure TExportadorProdutos.EscreverCabecalho;
begin
  FoFormato.DesenharCabecalho('Código');
  FoFormato.DesenharCabecalho('Descrição');
  FoFormato.DesenharCabecalho('Estoque');
end;

procedure TExportadorProdutos.ExportarDados(const pvDados: olevariant);
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
    FoFormato.SalvarArquivo('Produtos');
  finally
    FreeAndNil(cdsDados);
  end;
end;

end.
