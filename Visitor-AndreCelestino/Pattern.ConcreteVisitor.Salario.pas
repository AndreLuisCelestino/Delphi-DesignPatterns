unit Pattern.ConcreteVisitor.Salario;

interface

uses
  Pattern.Visitor, Pattern.ConcreteElement.Programador, Pattern.ConcreteElement.Gerente;

type
  TSalario = class(TInterfacedObject, IVisitor)

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TProgramador
    procedure Visit(Programador: TProgramador); overload;

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TGerente
    procedure Visit(Gerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSalario }

// C�lculo do aumento do sal�rio para programadores
procedure TSalario.Visit(Programador: TProgramador);
var
  PorcentagemPorDiaTrabalhado: real;
begin
  // Aplica um aumento de 6% no sal�rio
  Programador.Salario := Programador.Salario * 1.06;

  // Aplica um aumento adicional de 0,002% por cada dia trabalhado
  PorcentagemPorDiaTrabalhado := DaysBetween(Date, Programador.Admissao) * 0.002;
  Programador.Salario := Programador.Salario * (1 + PorcentagemPorDiaTrabalhado / 100);
end;

// C�lculo do aumento do sal�rio para gerentes
procedure TSalario.Visit(Gerente: TGerente);
var
  QtdeAnosNaEmpresa: byte;
begin
  // Aplica um aumento de 8% no sal�rio
  Gerente.Salario := Gerente.Salario * 1.08;

  // Calcula a quantidade de anos que o gerente est� na empresa
  QtdeAnosNaEmpresa := YearsBetween(Date, Gerente.Admissao);

  // Conforme a quantidade de anos, uma porcentagem adicional � aplicada
  case QtdeAnosNaEmpresa of
    2..3:  Gerente.Salario := Gerente.Salario * 1.03; // at� 3 anos: 3%
    4..5:  Gerente.Salario := Gerente.Salario * 1.04; // at� 5 anos: 4%
    6..10: Gerente.Salario := Gerente.Salario * 1.05; // at� 10 anos: 5%
  end;
end;

end.
