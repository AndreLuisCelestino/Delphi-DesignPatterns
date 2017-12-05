unit Pattern.Director;

interface

uses
  Pattern.Builder;

type
  { Director }
  TDirector = class
  public
    // Método responsável por construir o objeto complexo por partes
    procedure Construct(Builder: IBuilder);
  end;

implementation

{ TDirector }

procedure TDirector.Construct(Builder: IBuilder);
begin
  // Sequência de passos para construir o objeto complexo
  Builder.BuildCabecalho;
  Builder.BuildDetalhes;
  Builder.BuildRodape;
end;

end.
