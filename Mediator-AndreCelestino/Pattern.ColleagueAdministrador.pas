unit Pattern.ColleagueAdministrador;

interface

uses
  Pattern.Colleague, Pattern.Mediator;

type
  { Concrete Colleague }
  TColleagueAdministrador = class(TInterfacedObject, IColleague)
  private
    FNome: string;
    
    // Vari�vel para armazenar a refer�ncia do Mediator
    FMediator: IMediator;
  public
    constructor Create(const Nome: string; Mediator: IMediator);

    // Chama o Mediator para enviar a proposta ao destinat�rio
    function EnviarProposta(const Destinatario, Proposta: string): string;

    // Retorna uma mensagem de recebimento da proposta
    function ReceberProposta(const Remetente, Proposta: string): string;

    // Obt�m o nome do membro
    function ObterNome: string;

    // Chama o Mediator para adicionar o administrador no dicion�rio
    function Entrar: string;

    // Chama o Mediator para remover o administrador do dicion�rio
    function Sair: string;
  end;

implementation

uses
  SysUtils;

{ TColleagueAdministrador }

constructor TColleagueAdministrador.Create(const Nome: string;
  Mediator: IMediator);
begin
  FNome := Nome;
  FMediator := Mediator;
end;

function TColleagueAdministrador.ObterNome: string;
begin
  result := FNome;
end;

function TColleagueAdministrador.Entrar: string;
begin
  // Adiciona o administrador no dicion�rio
  result := FMediator.AdicionarMembro(Self);
end;

function TColleagueAdministrador.Sair: string;
begin
  // Remove o administrador do dicion�rio
  result := 'Administradores n�o podem ser removidos.';
end;

function TColleagueAdministrador.EnviarProposta(const Destinatario,
  Proposta: string): string;
begin
  // Envia a proposta atrav�s do Mediator
  result := '[ADM] ' + FMediator.EnviarProposta(Self.ObterNome, Destinatario, Proposta);
end;

function TColleagueAdministrador.ReceberProposta(const Remetente,
  Proposta: string): string;
begin
  // Retorna uma mensagem indicando o recebimento da proposta
  result := Format('De [%s] para [%s]: Erro: N�o � poss�vel enviar mensagens aos administradores. ',
    [Remetente, Self.ObterNome]);
end;

end.
