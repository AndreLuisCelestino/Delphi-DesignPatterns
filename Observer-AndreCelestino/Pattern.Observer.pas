unit Pattern.Observer;

interface

uses
  Model.Notificacao;

type
  { Observer }
  IObserver = interface

    // Método que será chamado pelo Subject
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

end.
