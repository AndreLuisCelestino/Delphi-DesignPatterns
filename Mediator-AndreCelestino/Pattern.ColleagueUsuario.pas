unit Pattern.ColleagueUsuario;

interface

uses
  Pattern.Colleague, Pattern.Mediator;

type
  { Concrete Colleague }
  TColleagueUsuario = class(TInterfacedObject, IColleague)
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

    // Chama o Mediator para adicionar o usuário no dicionário
    function Entrar: string;

    // Chama o Mediator para remover o usuário do dicionário
    function Sair: string;
  end;

implementation

uses
  SysUtils;

{ TConcreteColleague }

constructor TColleagueUsuario.Create(const Nome: string; Mediator: IMediator);
begin
  FNome := Nome;
  FMediator := Mediator;
end;

function TColleagueUsuario.ObterNome: string;
begin
  result := FNome;
end;

function TColleagueUsuario.Entrar: string;
begin
  // Adiciona o usuário no dicionário
  result := FMediator.AdicionarMembro(Self);
end;

function TColleagueUsuario.Sair: string;
begin
  // Remove o usuário do dicionário
  result := FMediator.RemoverMembro(Self.ObterNome);
end;

function TColleagueUsuario.EnviarProposta(const Destinatario, Proposta: string): string;
begin
  // Envia a proposta através do Mediator
  result := FMediator.EnviarProposta(Self.ObterNome, Destinatario, Proposta);
end;

function TColleagueUsuario.ReceberProposta(const Remetente, Proposta: string): string;
begin
  // Retorna uma mensagem indicando o recebimento da proposta
  result := Format('De [%s] para [%s]: %s', [Remetente, Self.ObterNome, Proposta]);
end;

end.
