unit Pattern.ConcreteVisitor.Senioridade;

interface

uses
  Pattern.Visitor, Pattern.ConcreteElement.Programador, Pattern.ConcreteElement.Gerente;

type
  { Concrete Visitor }
  TSenioridade = class(TInterfacedObject, IVisitor)

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TProgramador
    procedure Visit(Programador: TProgramador); overload;

    // M�todo que ser� invocado quando o objeto do par�metro for da classe TGerente
    procedure Visit(Gerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSenioridade }

// Defini��o da senioridade para programadores
procedure TSenioridade.Visit(Programador: TProgramador);
begin
  // Define a senioridade do programador conforme o tempo de casa
  case YearsBetween(Date, Programador.Admissao) of
    0..1: Programador.Senioridade := 'J�nior';
    2..3: Programador.Senioridade := 'Pleno';
    4..5: Programador.Senioridade := 'S�nior';
    6..8: Programador.Senioridade := 'Especialista';
  end;
end;

// Defini��o da senioridade para gerentes
procedure TSenioridade.Visit(Gerente: TGerente);
begin
  // Define a senioridade do gerente conforme o tempo de casa
  case YearsBetween(Date, Gerente.Admissao) of
    0..2: Gerente.Senioridade := 'Qualificado';
    3..5: Gerente.Senioridade := 'Profissional';
    6..8: Gerente.Senioridade := 'Experiente';
  end;
end;

end.

