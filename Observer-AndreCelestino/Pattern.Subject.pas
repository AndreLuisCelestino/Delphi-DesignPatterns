unit Pattern.Subject;

interface

uses
  Pattern.Observer;

type
  { Subject }
  ISubject = interface

    // Método para adicionar Observers à lista
    procedure AdicionarObserver(Observer: IObserver);

    // Métodos para remover Observers da lista
    procedure RemoverObserver(Observer: IObserver);

    // Método responsável por notificar os Observers registrados
    procedure Notificar;
  end;

implementation

end.
