unit Pattern.Mediator;

interface

uses
  Pattern.Colleague;

type
  { Mediator }
  IMediator = interface
    function AdicionarMembro(Membro: IColleague): string;
    function RemoverMembro(const Nome: string): string;
    function EnviarProposta(const Remetente, Destinatario, Proposta: string): string;
    function ObterListaMembros: TArray<string>;
    function ObterMembro(const Nome: string): IColleague;
    procedure LiberarObjetos;
  end;

implementation

end.
