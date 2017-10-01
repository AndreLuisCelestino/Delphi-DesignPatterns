unit Pattern.RefinedAbstraction.Produtos;

interface

uses
  Pattern.Abstraction, Pattern.Implementor;

type
  { Refined Abstraction }
  TExportadorProdutos = class(TInterfacedObject, IExportador)
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

{ TExportadorProdutos }

constructor TExportadorProdutos.Create(Formato: IFormato);
begin
  Self.Formato := Formato;
end;

procedure TExportadorProdutos.EscreverCabecalho;
begin
  Formato.DesenharCabecalho('Código');
  Formato.DesenharCabecalho('Descrição');
  Formato.DesenharCabecalho('Estoque');
end;

procedure TExportadorProdutos.ExportarDados(const Dados: olevariant);
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
    Formato.SalvarArquivo('Produtos');
  finally
    FreeAndNil(cdsDados);
  end;
end;

end.
