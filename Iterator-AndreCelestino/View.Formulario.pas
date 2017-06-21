unit View.Formulario;

{
  Exemplo de Iterator com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Pattern.Aggregate;

type
  TfFormulario = class(TForm)
    ListBoxClientes: TListBox;
    LabelClientes: TLabel;
    PanelCampos: TPanel;
    LabelNome: TLabel;
    LabelSobrenome: TLabel;
    LabelCodigo: TLabel;
    LabelPais: TLabel;
    LabelEmail: TLabel;
    EditCodigo: TEdit;
    EditNome: TEdit;
    EditEndereco: TEdit;
    EditPais: TEdit;
    EditEmail: TEdit;
    LabelDados: TLabel;
    Bevel: TBevel;
    BitBtnAbrirCSV: TBitBtn;
    BitBtnAbrirXML: TBitBtn;
    OpenDialog: TOpenDialog;
    procedure BitBtnAbrirCSVClick(Sender: TObject);
    procedure BitBtnAbrirXMLClick(Sender: TObject);
    procedure ListBoxClientesClick(Sender: TObject);
  private
    FAggregate: IAggregate;
    procedure CarregarCSV;
    procedure CarregarXML;
    procedure CarregarDadosCliente;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Model.Cliente, Pattern.ConcreteAggregateCSV,
  Pattern.ConcreteAggregateXML, Pattern.Iterator;

{$R *.dfm}

procedure TfFormulario.BitBtnAbrirCSVClick(Sender: TObject);
begin
  CarregarCSV;
end;

procedure TfFormulario.BitBtnAbrirXMLClick(Sender: TObject);
begin
  CarregarXML;
end;

procedure TfFormulario.CarregarCSV;
var
  Iterator: IIterator;
begin
  // Libera o Aggregate da mem�ria para cri�-lo novamente,
  // caso j� tenha sido utilizado
  if Assigned(FAggregate) then
    FAggregate := nil;

  // Abre a janela de di�logo para sele��o do arquivo de dados
  OpenDialog.InitialDir := GetCurrentDir + '\Dados';
  if not OpenDialog.Execute then
    Exit;

  // Cria o Concrete Aggregate referente � leitura do arquivo CSV
  FAggregate := TConcreteAggregateCSV.Create(OpenDialog.FileName);

  // Obt�m uma inst�ncia do Iterator
  Iterator := FAggregate.GetIterator;

  ListBoxClientes.Clear;

  // Utiliza os m�todos do Iterator para navegar na lista
  // e adicionar o nome do cliente no TListBox
  Iterator.PrimeiroObjeto;
  while not Iterator.FimLista do
  begin
    Iterator.ProximoObjeto;
    ListBoxClientes.Items.Add((Iterator.ObjetoAtual as TCliente).Nome);
  end;
end;

procedure TfFormulario.CarregarXML;
var
  Iterator: IIterator;
begin
  // Libera o Aggregate da mem�ria para cri�-lo novamente,
  // caso j� tenha sido utilizado
  if Assigned(FAggregate) then
    FAggregate := nil;

  // Abre a janela de di�logo para sele��o do arquivo de dados
  OpenDialog.InitialDir := GetCurrentDir + '\Dados';
  if not OpenDialog.Execute then
    Exit;

  // Cria o Concrete Aggregate referente � leitura do arquivo XML
  FAggregate := TConcreteAggregateXML.Create(OpenDialog.FileName);

  // Obt�m uma inst�ncia do Iterator
  Iterator := FAggregate.GetIterator;

  ListBoxClientes.Clear;

  // Utiliza os m�todos do Iterator para navegar na lista
  // e adicionar o nome do cliente no TListBox
  Iterator.PrimeiroObjeto;
  while not Iterator.FimLista do
  begin
    Iterator.ProximoObjeto;
    ListBoxClientes.Items.Add((Iterator.ObjetoAtual as TCliente).Nome);
  end;
end;

procedure TfFormulario.CarregarDadosCliente;
var
  Iterator: IIterator;
  Cliente: TCliente;
begin
  // Obt�m uma inst�ncia do Iterator
  Iterator := FAggregate.GetIterator;

  // Busca o objeto no �ndice atrav�s do Iterator
  Cliente := Iterator.Buscar(ListBoxClientes.ItemIndex + 1) as TCliente;

  // Preenche os dados na tela
  EditCodigo.Text := IntToStr(Cliente.Codigo);
  EditNome.Text := Cliente.Nome;
  EditEndereco.Text := Cliente.Endereco;
  EditPais.Text := Cliente.Pais;
  EditEmail.Text := Cliente.Email;
end;

procedure TfFormulario.ListBoxClientesClick(Sender: TObject);
begin
  if ListBoxClientes.Items.Count = 0 then
    Exit;

  CarregarDadosCliente;
end;

end.
