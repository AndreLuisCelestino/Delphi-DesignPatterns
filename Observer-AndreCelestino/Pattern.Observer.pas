unit Pattern.Observer;

interface

uses
  Model.Notificacao;

type
  { Observer }
  IObserver = interface

    // M�todo que ser� chamado pelo Subject
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

end.
