unit Pattern.ConcreteVisitor.Salario;

interface

uses
  Pattern.Visitor, Pattern.ConcreteElement.Programador, Pattern.ConcreteElement.Gerente;

type
  TSalario = class(TInterfacedObject, IVisitor)

    // Método que será invocado quando o objeto do parâmetro for da classe TProgramador
    procedure Visit(Programador: TProgramador); overload;

    // Método que será invocado quando o objeto do parâmetro for da classe TGerente
    procedure Visit(Gerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSalario }

// Cálculo do aumento do salário para programadores
procedure TSalario.Visit(Programador: TProgramador);
var
  PorcentagemPorDiaTrabalhado: real;
begin
  // Aplica um aumento de 6% no salário
  Programador.Salario := Programador.Salario * 1.06;

  // Aplica um aumento adicional de 0,002% por cada dia trabalhado
  PorcentagemPorDiaTrabalhado := DaysBetween(Date, Programador.Admissao) * 0.002;
  Programador.Salario := Programador.Salario * (1 + PorcentagemPorDiaTrabalhado / 100);
end;

// Cálculo do aumento do salário para gerentes
procedure TSalario.Visit(Gerente: TGerente);
var
  QtdeAnosNaEmpresa: byte;
begin
  // Aplica um aumento de 8% no salário
  Gerente.Salario := Gerente.Salario * 1.08;

  // Calcula a quantidade de anos que o gerente está na empresa
  QtdeAnosNaEmpresa := YearsBetween(Date, Gerente.Admissao);

  // Conforme a quantidade de anos, uma porcentagem adicional é aplicada
  case QtdeAnosNaEmpresa of
    2..3:  Gerente.Salario := Gerente.Salario * 1.03; // até 3 anos: 3%
    4..5:  Gerente.Salario := Gerente.Salario * 1.04; // até 5 anos: 4%
    6..10: Gerente.Salario := Gerente.Salario * 1.05; // até 10 anos: 5%
  end;
end;

end.
