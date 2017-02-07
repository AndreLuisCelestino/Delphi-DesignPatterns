unit uConcreteCommand;

interface

uses
  uCommand, uReceiver;

type
  { Concrete Command }
  TProcessos = class(TInterfacedObject, ICommand)
  private
    // Vari�vel para armazenar a refer�ncia do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - M�todo de execu��o da opera��o
    procedure Execute;
  end;

  { Concrete Command }
  TProgramas = class(TInterfacedObject, ICommand)
  private
    // Vari�vel para armazenar a refer�ncia do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - M�todo de execu��o da opera��o
    procedure Execute;
  end;

  { Concrete Command }
  TVariaveisAmbiente = class(TInterfacedObject, ICommand)
  private
    // Vari�vel para armazenar a refer�ncia do Receiver
    FReceiver: TReceiver;
  public
    constructor Create(Receiver: TReceiver);

    // Assinatura da Interface - M�todo de execu��o da opera��o
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
