unit Pattern.Colleague;

interface

type
  { Colleague }
  IColleague = interface
    function EnviarProposta(const Destinatario, Proposta: string): string;
    function ReceberProposta(const Remetente, Proposta: string): string;
    function ObterNome: string;
    function Entrar: string;
    function Sair: string;
  end;

implementation

end.
