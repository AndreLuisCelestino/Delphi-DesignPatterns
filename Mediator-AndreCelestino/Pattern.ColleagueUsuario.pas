unit Pattern.ColleagueUsuario;

interface

uses
  Pattern.Colleague, Pattern.Mediator;

type
  { Concrete Colleague }
  TColleagueUsuario = class(TInterfacedObject, IColleague)
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

    // Chama o Mediator para adicionar o usu�rio no dicion�rio
    function Entrar: string;

    // Chama o Mediator para remover o usu�rio do dicion�rio
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
  // Adiciona o usu�rio no dicion�rio
  result := FMediator.AdicionarMembro(Self);
end;

function TColleagueUsuario.Sair: string;
begin
  // Remove o usu�rio do dicion�rio
  result := FMediator.RemoverMembro(Self.ObterNome);
end;

function TColleagueUsuario.EnviarProposta(const Destinatario, Proposta: string): string;
begin
  // Envia a proposta atrav�s do Mediator
  result := FMediator.EnviarProposta(Self.ObterNome, Destinatario, Proposta);
end;

function TColleagueUsuario.ReceberProposta(const Remetente, Proposta: string): string;
begin
  // Retorna uma mensagem indicando o recebimento da proposta
  result := Format('De [%s] para [%s]: %s', [Remetente, Self.ObterNome, Proposta]);
end;

end.
