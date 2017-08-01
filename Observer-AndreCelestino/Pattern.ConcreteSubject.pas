unit Pattern.ConcreteSubject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Datasnap.DBClient,
  Vcl.ExtCtrls, System.Generics.Collections, Pattern.Subject, Pattern.Observer;

type
  { Concrete Subject }
  TFrameCadastroOperacoes = class(TFrame, ISubject)
    Bevel: TBevel;
    BitBtnGravar: TBitBtn;
    ClientDataSet: TClientDataSet;
    ClientDataSetCategoria: TStringField;
    ClientDataSetOperacao: TStringField;
    ClientDataSetValor: TFloatField;
    ComboBoxCategoria: TComboBox;
    ComboBoxOperacao: TComboBox;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    EditValor: TEdit;
    LabelCategoria: TLabel;
    LabelOperacao: TLabel;
    LabelValor: TLabel;
    procedure BitBtnGravarClick(Sender: TObject);
    procedure ComboBoxOperacaoChange(Sender: TObject);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
  private
    // Variável par armazenar a lista de Observers
    FObservers: TList<IObserver>;

    // Método para carregar as categorias conforme a operação
    procedure CarregarCategorias;

    // Método responsável por notificar os Observers registrados
    procedure Notificar;
  public
     constructor Create(AOwner: TComponent) ; override;
     destructor Destroy; override;

    // Método para adicionar Observers à lista
    procedure AdicionarObserver(Observer: IObserver);

    // Métodos para remover Observers da lista
    procedure RemoverObserver(Observer: IObserver);
  end;

implementation

uses
  Model.Notificacao;

{$R *.dfm}

{ TFrameCadastroOperacoes }

procedure TFrameCadastroOperacoes.BitBtnGravarClick(Sender: TObject);
begin
  if (ComboBoxOperacao.ItemIndex < 0) or (ComboBoxCategoria.ItemIndex < 0) then
    Exit;

  // Adiciona a nova operação no DataSet
  ClientDataSet.AppendRecord(
    [ComboBoxOperacao.Text, ComboBoxCategoria.Text, StrToFloatDef(EditValor.Text, 0)]);

  // Chama o método de notificação
  Notificar;

  // Limpa os campos
  ComboBoxOperacao.ItemIndex := -1;
  ComboBoxCategoria.ItemIndex := -1;
  EditValor.Clear;

  ComboBoxOperacao.SetFocus;
end;

procedure TFrameCadastroOperacoes.CarregarCategorias;
begin
  // Método para carregar as categorias conforma a operação selecionada

  ComboBoxCategoria.Clear;

  case ComboBoxOperacao.ItemIndex of

    0:
    begin
      ComboBoxCategoria.Items.Add('Salário');
      ComboBoxCategoria.Items.Add('13º');
      ComboBoxCategoria.Items.Add('Restitução do IR');
      ComboBoxCategoria.Items.Add('Freelancing');
    end;

   1:
   begin
      ComboBoxCategoria.Items.Add('Aluguel');
      ComboBoxCategoria.Items.Add('Supermercado');
      ComboBoxCategoria.Items.Add('Farmácia');
      ComboBoxCategoria.Items.Add('Escola');
      ComboBoxCategoria.Items.Add('Combustível');
      ComboBoxCategoria.Items.Add('Alimentação');
      ComboBoxCategoria.Items.Add('Roupas');
      ComboBoxCategoria.Items.Add('Viagens');
   end;

  end;
end;

procedure TFrameCadastroOperacoes.ComboBoxOperacaoChange(Sender: TObject);
begin
  CarregarCategorias;
end;

constructor TFrameCadastroOperacoes.Create(AOwner: TComponent);
begin
  inherited;

  // Cria a lista de Observers
  FObservers := TList<IObserver>.Create;
end;

destructor TFrameCadastroOperacoes.Destroy;
begin
  // Libera a lista de observers da memória
  FObservers.Free;
  inherited;
end;

procedure TFrameCadastroOperacoes.EditValorKeyPress(Sender: TObject;
  var Key: Char);
begin
  // Evita a digitação de letras e pontos no campo de valor
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

procedure TFrameCadastroOperacoes.Notificar;
var
  Notificacao: TNotificacao;
  Observer: IObserver;
begin
  // Preenche o record com os dados necessários
  Notificacao.Operacao := ClientDataSet.FieldByName('Operacao').AsString;
  Notificacao.Categoria := ClientDataSet.FieldByName('Categoria').AsString;
  Notificacao.Valor := ClientDataSet.FieldByName('Valor').AsFloat;

  // Percorre a lista de Observers para enviar a notificação
  for Observer in FObservers do
  begin
    // Chama o método "Atualizar" do Observer
    Observer.Atualizar(Notificacao);
  end;
end;

procedure TFrameCadastroOperacoes.AdicionarObserver(Observer: IObserver);
begin
  // Adiciona o Observer à lista
  FObservers.Add(Observer);
end;

procedure TFrameCadastroOperacoes.RemoverObserver(Observer: IObserver);
begin
  // Remove o Observer da lista
  FObservers.Delete(FObservers.IndexOf(Observer));
end;

end.
