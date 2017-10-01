unit Pattern.ConcreteCommand;

interface

uses
  Pattern.Command, Pattern.Receiver;

type
  { Concrete Command }
  TProcessos = class(TInterfacedObject, ICommand)
  private
    // Variável para armazenar a referência do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - Método de execução da operação
    procedure Execute;
  end;

  { Concrete Command }
  TProgramas = class(TInterfacedObject, ICommand)
  private
    // Variável para armazenar a referência do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - Método de execução da operação
    procedure Execute;
  end;

  { Concrete Command }
  TVariaveisAmbiente = class(TInterfacedObject, ICommand)
  private
    // Variável para armazenar a referência do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - Método de execução da operação
    procedure Execute;
  end;

implementation

{ TProcessos }

constructor TProcessos.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TProcessos.Execute;
begin
  FReceiver.ExtrairProcessos;
end;

{ TProgramas }

constructor TProgramas.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TProgramas.Execute;
begin
  FReceiver.ExtrairProgramas;
end;

{ TRecursos }

constructor TVariaveisAmbiente.Create(Receiver: TReceiver);
begin
  FReceiver := Receiver;
end;

procedure TVariaveisAmbiente.Execute;
begin
  FReceiver.ExtrairVariaveisAmbiente;
end;

end.
