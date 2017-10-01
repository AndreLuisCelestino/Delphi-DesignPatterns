unit Pattern.Invoker;

interface

uses
  Pattern.Command, Classes;

type
  { Invoker }
  TInvoker = class
  private
    // Lista para armzenar os comandos
    Comandos: TInterfaceList;
  public
    constructor Create;
    procedure Add(Comando: ICommand);
    procedure ExtrairInformacoes;
  end;

implementation

{ TInvoker }

procedure TInvoker.Add(Comando: ICommand);
begin
  // Adiciona o comando na lista
  Comandos.Add(Comando);
end;

constructor TInvoker.Create;
begin
  // Cria a lista que armazenará os comandos
  Comandos := TInterfaceList.Create;
end;

procedure TInvoker.ExtrairInformacoes;
var
  Contador: integer;
begin
  // Percorre a lista de comandos armazenados,
  // executando a operação de cada um
  for Contador := 0 to Pred(Comandos.Count) do
  begin
    ICommand(Comandos[Contador]).Execute;
  end;
end;

end.
