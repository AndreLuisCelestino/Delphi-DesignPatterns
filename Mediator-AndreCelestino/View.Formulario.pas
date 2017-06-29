unit View.Formulario;

{
  Exemplo de Mediator com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
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
    // Vari�vel para armazenar a inst�ncia do Mediator
    FMediator: IMediator;

    // Preenche os Comboboxes com os membros cadastrados
    procedure AtualizarComboboxes;

    // M�todo para envio de proposta de um membro para outro
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
  // M�todo para preencher os Comboboxes "De" e "Para"
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
  // Ao pressionar "Enter" no campo de texto, o m�todo "EnviarProposta" � chamado

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
    MessageDlg('Informe corretamente o remetente e destinat�rio.', mtWarning, [mbOK], 0);
    Exit;
  end;

  // Obt�m a refer�ncia do remetente pelo nome no dicion�rio
  Remetente := FMediator.ObterMembro(ComboBoxRemetente.Text);

  // Executa o m�todo de envio de proposta, que ser� gerenciado pelo Mediator
  MemoLog.Lines.Add(Remetente.EnviarProposta(ComboBoxDestinatario.Text, EditProposta.Text));

  MemoLog.Lines.Add(EmptyStr);
  EditProposta.Clear;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria a inst�ncia do Mediator
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
  // Abre um formul�rio para preenchimento dos dados do membro
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

  // Instancia o objeto conforme perfil, informando o Mediator como par�metro
  case Perfil of
    0: Membro := TColleagueUsuario.Create(Nome, FMediator);
    1: Membro := TColleagueAdministrador.Create(Nome, FMediator);
  end;

  // Executa o m�todo de registro para adicionar o membro ao dicion�rio
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

  // Obt�m o nome selecionado na ListBox
  Nome := ListBoxMembros.Items[ListBoxMembros.ItemIndex];

  // Obt�m a refer�ncia do objeto pelo nome no dicion�rio
  Membro := FMediator.ObterMembro(Nome);

  // Executa o m�todo de remo��o do membro
  MemoLog.Lines.Add(Membro.Sair);

  MemoLog.Lines.Add(EmptyStr);
  AtualizarComboboxes;
  ListBoxMembros.DeleteSelected;
end;

end.
