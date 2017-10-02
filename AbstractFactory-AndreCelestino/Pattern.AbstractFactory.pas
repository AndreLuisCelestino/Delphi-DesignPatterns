unit Pattern.AbstractFactory;

interface

uses
  Pattern.AbstractProduct;

type
 { Abstract Factory }
  IFactoryMarca = interface
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

end.
