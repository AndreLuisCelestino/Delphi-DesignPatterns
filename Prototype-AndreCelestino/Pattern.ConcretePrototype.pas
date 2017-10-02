unit Pattern.ConcretePrototype;

interface

uses
  SysUtils, Controls, Graphics, Pattern.Prototype;

type
  { Concrete Prototype }
  TConcretePrototype = class(TInterfacedObject, IPrototype)
  private
    FNome: string;
    FData: TDate;
    FHora: TTime;
    FCategoria: TColor;
    FParticipantes: string;
  public
    constructor Create;

    // método principal do Prototype
    function Clonar: IPrototype;

    property Nome: string read FNome write FNome;
    property Data: TDate read FData write FData;
    property Hora: TTime read FHora write FHora;
    property Categoria: TColor read FCategoria write FCategoria;
    property Participantes: string read FParticipantes write FParticipantes;
  end;

implementation

{ TReuniao }

function TConcretePrototype.Clonar: IPrototype;
var
  NovaReuniao: TConcretePrototype;
begin
  // cria um novo objeto
  NovaReuniao := TConcretePrototype.Create;

  // copia todas as propriedades do objeto atual,
  // atribuindo-as ao clone
  NovaReuniao.Nome := Self.Nome;
  NovaReuniao.Data := Self.Data;
  NovaReuniao.Hora := Self.Hora;
  NovaReuniao.Categoria := Self.Categoria;
  NovaReuniao.Participantes := Self.Participantes;

  // retorna o clone criado
  result := NovaReuniao;
end;

constructor TConcretePrototype.Create;
begin
  FData := Date;
  FHora := Time;
  FCategoria := clBlack;
end;

end.
