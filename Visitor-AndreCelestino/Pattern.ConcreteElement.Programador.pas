unit Pattern.ConcreteElement.Programador;

interface

uses
  Pattern.ConcreteElement;

type
  { Concrete Element - subclasse }
  TProgramador = class(TFuncionario)
  public
    procedure Accept(Visitor: IInterface); override;
  end;

implementation

uses
  System.SysUtils, Pattern.Visitor;

{ TProgramador }

procedure TProgramador.Accept(Visitor: IInterface);
var
  ConcreteVisitor: IVisitor;
begin
  // Aplica um typecast do parâmetro para o tipo IVisitor
  ConcreteVisitor := Visitor as IVisitor;

  // Chama o método "Visit" do Concrete Visitor, enviando a própria instância como parâmetro.
  // Essa instância é o que indicará qual sobrecarga do método "Visit" será chamado.
  ConcreteVisitor.Visit(Self);
end;

end.
