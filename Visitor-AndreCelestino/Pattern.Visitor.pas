unit Pattern.Visitor;

interface

uses
  Pattern.ConcreteElement.Programador, Pattern.ConcreteElement.Gerente;

type
  { Visitor }
  IVisitor = interface
    ['{9030B2DC-C821-4C91-861C-9322D2C04EA3}']

    // O Visitor possui um método sobrecarregado para cada Concrete Element existente

    procedure Visit(Programador: TProgramador); overload;
    procedure Visit(Gerente: TGerente); overload;
  end;

implementation

end.
