unit View.Formulario;

{
  Exemplo de Composite com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Pattern.Composite;

type
  { Client }
  TfFormulario = class(TForm)
    BitBtnCalcular: TBitBtn;
    LabelTotal: TLabel;
    EditTotal: TEdit;
    GroupBoxAdicionarViagem: TGroupBox;
    LabelOrigem: TLabel;
    ComboBoxOrigem: TComboBox;
    LabelDestino: TLabel;
    ComboBoxDestino: TComboBox;
    BitBtnAdicionarViagem: TBitBtn;
    MemoViagens: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnAdicionarViagemClick(Sender: TObject);
    procedure BitBtnCalcularClick(Sender: TObject);
    procedure ComboBoxOrigemChange(Sender: TObject);
  private
    PacoteViagem: TPacoteViagem;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.Component, Pattern.Leaf, Singleton.Valores;

{$R *.dfm}

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Instancia o Composite
  PacoteViagem := TPacoteViagem.Create;
end;

procedure TfFormulario.BitBtnAdicionarViagemClick(Sender: TObject);
var
  Viagem: TViagem;
begin
  MemoViagens.Lines.Add(Format('%s -> %s',
    [ComboBoxOrigem.Text, ComboBoxDestino.Text]));

  // Cria um Leaf (viagem) e adiciona no pacote de viagem (Composite)
  Viagem := TViagem.Create;
  Viagem.DefinirOrigem(ComboBoxOrigem.Text);
  Viagem.DefinirDestino(ComboBoxDestino.Text);
  PacoteViagem.AdicionarViagem(Viagem);

  ComboBoxOrigem.ItemIndex := ComboBoxOrigem.Items.IndexOf(ComboBoxDestino.Text);
  ComboBoxDestino.ItemIndex := -1;
  ComboBoxDestino.SetFocus;
end;

procedure TfFormulario.BitBtnCalcularClick(Sender: TObject);
begin
  MessageDlg('Neste momento, o "Composite" (Pacote de Viagem) ' + #13 +
    'irá ler cada Leaf (Viagem), executando o "Operation" (CalcularValor)' + #13 +
    'para calcular o valor de cada viagem e, no final, obter a soma total.',
    mtInformation, [mbOK], 0);

  EditTotal.Text :=   FormatFloat('###,##0.00', PacoteViagem.CalcularValor);
end;

procedure TfFormulario.ComboBoxOrigemChange(Sender: TObject);
begin
  // Remove a mesma cidade do campo de destino
  ComboBoxDestino.Items := ComboBoxOrigem.Items;
  ComboBoxDestino.Items.Delete(ComboBoxDestino.Items.IndexOf(ComboBoxOrigem.Text));
end;

end.
