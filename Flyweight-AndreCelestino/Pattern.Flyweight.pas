unit Pattern.Flyweight;

interface

type
  { Flyweight }
  ICartao = interface
    // setter da propriedade
    procedure SetNomeLeitor(const Nome: string);

    // método de exportação do cartão
    procedure Exportar;

    property NomeLeitor: string write SetNomeLeitor;
  end;

implementation

end.
