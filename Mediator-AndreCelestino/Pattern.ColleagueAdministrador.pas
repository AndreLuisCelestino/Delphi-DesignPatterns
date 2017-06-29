unit Pattern.ColleagueAdministrador;

interface

uses
  Pattern.Colleague, Pattern.Mediator;

type
  { Concrete Colleague }
  TColleagueAdministrador = class(TInterfacedObject, IColleague)
  private
    FNome: string;
    
    // Variável para armazenar a referência do Mediator
    FMediator: IMediator;
  public
    constructor Create(const Nome: string; Mediator: IMediator);

    // Chama o Mediator para enviar a proposta ao destinatário
    function EnviarProposta(const Destinatario, Proposta: string): string;

    // Retorna uma mensagem de recebimento da proposta
    function ReceberProposta(const Remetente, Proposta: string): string;

    // Obtém o nome do membro
    function ObterNome: string;

    // Chama o Mediator para adicionar o administrador no dicionário
    function Entrar: string;

    // Chama o Mediator para remover o administrador do dicionário
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
  // Adiciona o administrador no dicionário
  result := FMediator.AdicionarMembro(Self);
end;

function TColleagueAdministrador.Sair: string;
begin
  // Remove o administrador do dicionário
  result := 'Administradores não podem ser removidos.';
end;

function TColleagueAdministrador.EnviarProposta(const Destinatario,
  Proposta: string): string;
begin
  // Envia a proposta através do Mediator
  result := '[ADM] ' + FMediator.EnviarProposta(Self.ObterNome, Destinatario, Proposta);
end;

function TColleagueAdministrador.ReceberProposta(const Remetente,
  Proposta: string): string;
begin
  // Retorna uma mensagem indicando o recebimento da proposta
  result := Format('De [%s] para [%s]: Erro: Não é possível enviar mensagens aos administradores. ',
    [Remetente, Self.ObterNome]);
end;

end.
