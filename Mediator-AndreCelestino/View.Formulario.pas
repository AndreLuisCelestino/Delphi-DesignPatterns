unit View.Formulario;

{
  Exemplo de Mediator com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Pattern.Mediator;

type
  TfFormulario = class(TForm)
    ComboBoxDestinatario: TComboBox;
    ComboBoxRemetente: TComboBox;
    EditProposta: TEdit;
    GroupBoxPropostas: TGroupBox;
    LabelDe: TLabel;
    LabelMembros: TLabel;
    LabelPara: TLabel;
    ListBoxMembros: TListBox;
    MemoLog: TMemo;
    SpeedButtonAdicionar: TSpeedButton;
    SpeedButtonEnviar: TSpeedButton;
    SpeedButtonRemover: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonAdicionarClick(Sender: TObject);
    procedure SpeedButtonRemoverClick(Sender: TObject);
    procedure SpeedButtonEnviarClick(Sender: TObject);
    procedure EditPropostaKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    // Variável para armazenar a instância do Mediator
    FMediator: IMediator;

    // Preenche os Comboboxes com os membros cadastrados
    procedure AtualizarComboboxes;

    // Método para envio de proposta de um membro para outro
    procedure EnviarProposta;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.ConcreteMediator, Pattern.Colleague,
  Pattern.ColleagueUsuario, Pattern.ColleagueAdministrador, View.CadastroMembro;

{$R *.dfm}

procedure TfFormulario.AtualizarComboboxes;
var
  ArrayMembros: TArray<string>;
  Membro: string;
begin
  // Método para preencher os Comboboxes "De" e "Para"
  // com os membros cadastrados

  ComboboxRemetente.Clear;
  ComboBoxDestinatario.Clear;

  ArrayMembros := FMediator.ObterListaMembros;
  for Membro in ArrayMembros do
  begin
    ComboboxRemetente.Items.Add(Membro);
    ComboboxDestinatario.Items.Add(Membro);
  end;
end;

procedure TfFormulario.EditPropostaKeyPress(Sender: TObject; var Key: Char);
begin
  // Ao pressionar "Enter" no campo de texto, o método "EnviarProposta" é chamado

  if Key = #13 then
  begin
    Key := #0;
    EnviarProposta;
  end;
end;

procedure TfFormulario.EnviarProposta;
var
  Remetente: IColleague;
begin
  if (ComboBoxRemetente.ItemIndex < 0) or (ComboBoxDestinatario.ItemIndex < 0) then
  begin
    MessageDlg('Informe corretamente o remetente e destinatário.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Obtém a referência do remetente pelo nome no dicionário
  Remetente := FMediator.ObterMembro(ComboBoxRemetente.Text);

  // Executa o método de envio de proposta, que será gerenciado pelo Mediator
  MemoLog.Lines.Add(Remetente.EnviarProposta(ComboBoxDestinatario.Text, EditProposta.Text));

  MemoLog.Lines.Add(EmptyStr);
  EditProposta.Clear;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria a instância do Mediator
  FMediator := TConcreteMediator.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  FMediator.LiberarObjetos;
  FMediator := nil;
end;

procedure TfFormulario.SpeedButtonEnviarClick(Sender: TObject);
begin
  EnviarProposta;
end;

procedure TfFormulario.SpeedButtonAdicionarClick(Sender: TObject);
var
  Formulario: TfCadastroMembro;
  Membro: IColleague;
  Nome: string;
  Perfil: integer;
begin
  // Abre um formulário para preenchimento dos dados do membro
  Formulario := TfCadastroMembro.Create(nil);
  try
    Formulario.ShowModal;

    if Formulario.ModalResult = mrCancel then
      Exit;

    Nome := Formulario.EditNome.Text;
    Perfil := Formulario.ComboBoxPerfil.ItemIndex;
  finally
    Formulario.Free;
  end;

  // Instancia o objeto conforme perfil, informando o Mediator como parâmetro
  case Perfil of
    0: Membro := TColleagueUsuario.Create(Nome, FMediator);
    1: Membro := TColleagueAdministrador.Create(Nome, FMediator);
  end;

  // Executa o método de registro para adicionar o membro ao dicionário
  MemoLog.Lines.Add(Membro.Entrar);

  MemoLog.Lines.Add(EmptyStr);
  ListBoxMembros.Items.Add(Nome);
  AtualizarComboboxes;
end;

procedure TfFormulario.SpeedButtonRemoverClick(Sender: TObject);
var
  Nome: string;
  Membro: IColleague;
begin
  if ListBoxMembros.ItemIndex < 0 then
    Exit;

  // Obtém o nome selecionado na ListBox
  Nome := ListBoxMembros.Items[ListBoxMembros.ItemIndex];

  // Obtém a referência do objeto pelo nome no dicionário
  Membro := FMediator.ObterMembro(Nome);

  // Executa o método de remoção do membro
  MemoLog.Lines.Add(Membro.Sair);

  MemoLog.Lines.Add(EmptyStr);
  AtualizarComboboxes;
  ListBoxMembros.DeleteSelected;
end;

end.
