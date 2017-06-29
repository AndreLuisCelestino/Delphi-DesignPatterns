unit Pattern.ConcreteMediator;

interface

uses
  Pattern.Mediator, Pattern.Colleague, System.Generics.Collections;

type
  { Concrete Mediator }
  TConcreteMediator = class(TInterfacedObject, IMediator)
  private
    // Variável para armazenar a lista de membros
    FListaMembros: TDictionary<string, IColleague>;
  public
    constructor Create;

    // Adiciona o objeto no dicionário
    function AdicionarMembro(Membro: IColleague): string;

    // Remove o objeto do dicionário
    function RemoverMembro(const Nome: string): string;

    // Envia a proposta do remetente para o destino
    function EnviarProposta(const Remetente, Destinatario, Proposta: string): string;

    // Obtém uma lista dos membros cadastrados através da propriedade "Keys"
    function ObterListaMembros: TArray<string>;

    // Busca a referência do membro através do nome, que é chave do par no dicionário
    function ObterMembro(const Nome: string): IColleague;

    // Libera os objetos internos antes de fechar a aplicação para evitar Memory Leaks
    procedure LiberarObjetos;
  end;

implementation

uses
  SysUtils;

{ TConcreteMediator }

constructor TConcreteMediator.Create;
begin
  // Cria o dicionário
  FListaMembros := TDictionary<string, IColleague>.Create;
end;

function TConcreteMediator.EnviarProposta(const Remetente, Destinatario, Proposta: string): string;
var
  MembroRemetente: IColleague;
  MembroDestinatario: IColleague;
begin
  // Encontra o remetente no dicionário
  MembroRemetente := FListaMembros.Items[Remetente];

  // Encontra o destinatário no dicionário
  MembroDestinatario := FListaMembros.Items[Destinatario];

  // Executa o método de recebimento da proposta no destinatário
  result := MembroDestinatario.ReceberProposta(MembroRemetente.ObterNome, Proposta);
end;

procedure TConcreteMediator.LiberarObjetos;
begin
  FListaMembros.Free;
end;

function TConcreteMediator.ObterListaMembros: TArray<string>;
begin
  // Retorna um array dos objetos adicionados no dicionário
  result := FListaMembros.Keys.ToArray;
end;

function TConcreteMediator.ObterMembro(const Nome: string): IColleague;
begin
  // Obtém uma referência ao objeto pelo nome
  result := FListaMembros.Items[Nome];
end;

function TConcreteMediator.AdicionarMembro(Membro: IColleague): string;
begin
  // Adiciona o membro no dicionário
  FListaMembros.Add(Membro.ObterNome, Membro);

  result := Format('Membro "%s" entrou.', [Membro.ObterNome]);
end;

function TConcreteMediator.RemoverMembro(const Nome: string): string;
begin
  // Remove o membro do dicionário
  FListaMembros.Remove(Nome);

  result := Format('Membro "%s" saiu.', [Nome]);
end;

end.
