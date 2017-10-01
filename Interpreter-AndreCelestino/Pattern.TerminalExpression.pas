unit Pattern.TerminalExpression;

interface

uses
  Pattern.AbstractExpression, Pattern.Context;

type
  { TerminalExpression }
  TComandoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(Contexto: TContext); override;
  end;

  { TerminalExpression }
  TColunasExpression = class(TAbstractExpression)
  public
    procedure Interpretar(Contexto: TContext); override;
  end;

  { TerminalExpression }
  TTabelaExpression = class(TAbstractExpression)
  public
    procedure Interpretar(Contexto: TContext); override;
  end;

  { TerminalExpression }
  TCondicaoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(Contexto: TContext); override;
  end;

implementation

uses
  SysUtils, Classes, StrUtils;

{ TComandoExpression }

procedure TComandoExpression.Interpretar(Contexto: TContext);
begin
  // Se existir a palavra "selecionar", traduz para "Select"
  if Pos('selecionar', LowerCase(Contexto.Entrada)) > 0 then
    Contexto.Saida := 'Select'

  // Se existir a palavra "atualizar", traduz para "Update"
  else if Pos('atualizar', LowerCase(Contexto.Entrada)) > 0 then
    Contexto.Saida := 'Update'

  // Se existir a palavra "excluir", traduz para "Delete"
  else if Pos('excluir', LowerCase(Contexto.Entrada)) > 0 then
    Contexto.Saida := 'Delete';
end;

{ TColunasExpression }

procedure TColunasExpression.Interpretar(Contexto: TContext);
var
  PosicaoQuebra: integer;
  PosicaoEspaco: integer;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(Contexto.Entrada), Partes);

  if Pos('Select', Contexto.Saida) > 0 then
  begin
    PosicaoQuebra := Pos('dos', LowerCase(Contexto.Entrada))
                   + Pos('das', LowerCase(Contexto.Entrada));

    // Se não existirem as palavras "dos" ou "das",
    // então seleciona-se todas as colunas (*)
    if PosicaoQuebra = 0 then
    begin
      Contexto.Saida := Format('%s *', [Contexto.Saida, Partes[1]]);
      Exit;
    end;

    // Caso contrário, obtém as colunas informadas
    PosicaoEspaco := Pos(' ', Contexto.Entrada);
    Contexto.Saida := Format('%s %s', [Contexto.Saida,
      Copy(Contexto.Entrada, PosicaoEspaco, PosicaoQuebra - PosicaoEspaco)]);
  end;
end;

{ TTabelaExpression }

procedure TTabelaExpression.Interpretar(Contexto: TContext);
var
  PosicaoQuebra: integer;
  PosicaoEspaco: integer;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(Contexto.Entrada), Partes);

  if Pos('Select', Contexto.Saida) > 0 then
  begin
    PosicaoQuebra := Pos('dos', LowerCase(Contexto.Entrada))
                   + Pos('das', LowerCase(Contexto.Entrada));

    // Se não existirem as palavras "dos" ou "das",
    // a segunda parte do texto é o nome da tabela
    if PosicaoQuebra = 0 then
    begin
      Contexto.Saida := Format('%s from %s', [Contexto.Saida, Partes[1]]);
      Exit;
    end;

    // Caso contrário, é necessário calcular o nome da tabela
    // após as palavras "dos" ou "das"
    Inc(PosicaoQuebra, 4);
    PosicaoEspaco := PosEx(' ', Contexto.Entrada, PosicaoQuebra);

    if PosicaoEspaco = 0 then
      PosicaoEspaco := Length(Contexto.Entrada);

    Contexto.Saida := Concat(Contexto.Saida,
      Format(' from %s',
      [Copy(Contexto.Entrada, PosicaoQuebra, Abs(PosicaoQuebra - PosicaoEspaco))]));

    Exit;
  end;

  // Se o comando for Update, a quarta parte do texto é o nome da tabela
  if Pos('Update', Contexto.Saida) > 0 then
  begin
    Contexto.Saida := Format('%s %s', [Contexto.Saida, Partes[3] + 's']);
    Exit;
  end;

  // Se o comando for Delete, a segunda parte do texto é o nome da tabela
  if Pos('Delete', Contexto.Saida) > 0 then
  begin
    Contexto.Saida := Format('%s from %s', [Contexto.Saida, Partes[1] + 's']);
  end;
end;

{ TCondicaoExpression }

procedure TCondicaoExpression.Interpretar(Contexto: TContext);
var
  Posicao: integer;
  Valor: string;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(Contexto.Entrada), Partes);

  // Se existir a palavra "de", significa que a busca é por cidade
  Posicao := Pos(' de ', LowerCase(Contexto.Entrada));
  if Posicao > 0 then
  begin
    Valor := Copy(Contexto.Entrada, Posicao + 4, Length(Contexto.Entrada));
    Contexto.Saida := Concat(Contexto.Saida,  Format(' where cidade = "%s"', [Valor]));
    Exit;
  end;

  // Se existir a frase "com nome", significa que a busca é por nome
  Posicao := Pos('com nome', LowerCase(Contexto.Entrada));
  if Posicao > 0 then
  begin
    Valor := Copy(Contexto.Entrada, Posicao + 9, Length(Contexto.Entrada));
    Contexto.Saida := Concat(Contexto.Saida,  Format(' where nome = "%s"', [Valor]));
    Exit;
  end;

  // Se existir a palavra "para", significa que é uma atualização (Update)
  Posicao := Pos('para', LowerCase(Contexto.Entrada));
  if Posicao > 0 then
  begin
    Valor := Copy(Contexto.Entrada, Posicao + 5, Length(Contexto.Entrada));
    Contexto.Saida := Concat(Contexto.Saida,
      Format(' set %s = "%s" where ID = %s', [Partes[1], Valor, Partes[4]]));
    Exit;
  end;

  // Se for um comando Delete,
  // apenas identifica se o critério de exclusão é o ID ou Nome
  if Pos('Delete', Contexto.Saida) > 0 then
  begin
    if StrToIntDef(Partes[2], 0) > 0 then
      Contexto.Saida := Format('%s where ID = %s', [Contexto.Saida, Partes[2]])
    else
      Contexto.Saida := Format('%s where nome = "%s"', [Contexto.Saida, Partes[2]]);
  end;
end;

end.
