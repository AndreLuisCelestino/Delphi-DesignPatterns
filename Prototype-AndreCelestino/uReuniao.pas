unit uReuniao;

interface

uses
  SysUtils, Controls, Graphics;

type
  TReuniao = class
  private
    FsNome: string;
    FdData: TDate;
    FtHora: TTime;
    FoCategoria: TColor;
    FsParticipantes: string;
  public
    constructor Create;

    // método principal do Prototype
    function Clonar: TReuniao;

    property Nome: string read FsNome write FsNome;
    property Data: TDate read FdData write FdData;
    property Hora: TTime read FtHora write FtHora;
    property Categoria: TColor read FoCategoria write FoCategoria;
    property Participantes: string read FsParticipantes write FsParticipantes;
  end;

implementation

{ TReuniao }

function TReuniao.Clonar: TReuniao;
var
  oNovaReuniao: TReuniao;
begin
  // cria um novo objeto
  oNovaReuniao := TReuniao.Create;

  // copia todas as propriedades do objeto atual,
  // atribuindo-as ao clone
  oNovaReuniao.Nome := Self.Nome;
  oNovaReuniao.Data := Self.Data;
  oNovaReuniao.Hora := Self.Hora;
  oNovaReuniao.Categoria := Self.Categoria;
  oNovaReuniao.Participantes := Self.Participantes;

  // retorna o clone criado
  result := oNovaReuniao;
end;

constructor TReuniao.Create;
begin
  FdData := Date;
  FtHora := Time;
  FoCategoria := clBlack;
end;

end.
