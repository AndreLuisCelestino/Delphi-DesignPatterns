unit Pattern.Flyweight;

interface

type
  { Flyweight }
  ICartao = interface
    // setter da propriedade
    procedure SetNomeLeitor(const Nome: string);

    // m�todo de exporta��o do cart�o
    procedure Exportar;

    property NomeLeitor: string write SetNomeLeitor;
  end;

implementation

end.
