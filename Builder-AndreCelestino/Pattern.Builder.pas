unit Pattern.Builder;

interface

uses
  Pattern.Product;

type
  { Builder }
  IBuilder = interface

    // Métodos para criar as "partes" do objeto complexo
    procedure BuildCabecalho;
    procedure BuildDetalhes;
    procedure BuildRodape;

    // Função que retorna o "produto" pronto
    function GetRelatorio: TProduct;
  end;

implementation

end.
