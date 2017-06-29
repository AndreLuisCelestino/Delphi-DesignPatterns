unit Pattern.ConcreteMediator;

interface

uses
  Pattern.Mediator, Pattern.Colleague, System.Generics.Collections;

type
  { Concrete Mediator }
  TConcreteMediator = class(TInterfacedObject, IMediator)
  private
    // Vari�vel para armazenar a lista de membros
    FListaMembros: TDictionary<string, IColleague>;
  public
    constructor Create;

    // Adiciona o objeto no dicion�rio
    function AdicionarMembro(Membro: IColleague): string;

    // Remove o objeto do dicion�rio
    function RemoverMembro(const Nome: string): string;

    // Envia a proposta do remetente para o destino
    function EnviarProposta(const Remetente, Destinatario, Proposta: string): string;

    // Obt�m uma lista dos membros cadastrados atrav�s da propriedade "Keys"
    function ObterListaMembros: TArray<string>;

    // Busca a refer�ncia do membro atrav�s do nome, que � chave do par no dicion�rio
    function ObterMembro(const Nome: string): IColleague;

    // Libera os objetos internos antes de fechar a aplica��o para evitar Memory Leaks
    procedure LiberarObjetos;
  end;

implementation

uses
  SysUtils;

{ TConcreteMediator }

constructor TConcreteMediator.Create;
begin
  // Cria o dicion�rio
  FListaMembros := TDictionary<string, IColleague>.Create;
end;

function TConcreteMediator.EnviarProposta(const Remetente, Destinatario, Proposta: string): string;
var
  MembroRemetente: IColleague;
  MembroDestinatario: IColleague;
begin
  // Encontra o remetente no dicion�rio
  MembroRemetente := FListaMembros.Items[Remetente];

  // Encontra o destinat�rio no dicion�rio
  MembroDestinatario := FListaMembros.Items[Destinatario];

  // Executa o m�todo de recebimento da proposta no destinat�rio
  result := MembroDestinatario.ReceberProposta(MembroRemetente.ObterNome, Proposta);
end;

procedure TConcreteMediator.LiberarObjetos;
begin
  FListaMembros.Free;
end;

function TConcreteMediator.ObterListaMembros: TArray<string>;
begin
  // Retorna um array dos objetos adicionados no dicion�rio
  result := FListaMembros.Keys.ToArray;
end;

function TConcreteMediator.ObterMembro(const Nome: string): IColleague;
begin
  // Obt�m uma refer�ncia ao objeto pelo nome
  result := FListaMembros.Items[Nome];
end;

function TConcreteMediator.AdicionarMembro(Membro: IColleague): string;
begin
  // Adiciona o membro no dicion�rio
  FListaMembros.Add(Membro.ObterNome, Membro);

  result := Format('Membro "%s" entrou.', [Membro.ObterNome]);
end;

function TConcreteMediator.RemoverMembro(const Nome: string): string;
begin
  // Remove o membro do dicion�rio
  FListaMembros.Remove(Nome);

  result := Format('Membro "%s" saiu.', [Nome]);
end;

end.
