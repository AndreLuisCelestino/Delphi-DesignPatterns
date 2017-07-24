unit View.Formulario;

{
  Exemplo de Memento com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Pattern.Caretaker, Pattern.Originator;

type
  { Client }
  TfFormulario = class(TForm)
    LabelHistoricoAlteracoes: TLabel;
    ListBoxHistoricoAlteracoes: TListBox;
    RichEditTexto: TRichEdit;
    LabelTitulo: TLabel;
    EditTitulo: TEdit;
    PanelBarraFerramentas: TPanel;
    BitBtnSalvar: TBitBtn;
    SpeedButtonNegrito: TSpeedButton;
    SpeedButtonItalico: TSpeedButton;
    SpeedButtonSublinhado: TSpeedButton;
    ColorBoxCor: TColorBox;
    procedure SpeedButtonSublinhadoClick(Sender: TObject);
    procedure SpeedButtonItalicoClick(Sender: TObject);
    procedure ColorBoxCorSelect(Sender: TObject);
    procedure SpeedButtonNegritoClick(Sender: TObject);
    procedure RichEditTextoClick(Sender: TObject);
    procedure RichEditTextoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure ListBoxHistoricoAlteracoesClick(Sender: TObject);
  private
    FCaretaker: TCaretaker;
    FOriginator: TOriginator;

    procedure AplicarEstilo(const Formatacao: TFontStyle);
    procedure AtualizarBarraFerramentas;
    procedure AtualizarCaixaCores;
    procedure AtualizarBotoesEstiloFonte;
  end;

var
  fFormulario: TfFormulario;

implementation

{$R *.dfm}

{ TfFormulario }

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria o Caretaker (que contém o dicionário de objetos)
  FCaretaker := TCaretaker.Create;

  // Cria o Originator, que corresponde aos dados atuais apresentados na tela
  FOriginator := TOriginator.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  // Libera as variáveis de classe da memória
  FOriginator.Free;
  FCaretaker.Free;
end;

procedure TfFormulario.BitBtnSalvarClick(Sender: TObject);
var
  DataHoraAtual: string;
  Texto: TStringStream;
begin
  // Preenche a informação de título do Originator
  FOriginator.Titulo := EditTitulo.Text;

  // Cria uma instância da classe TStringStream
  Texto := TStringStream.Create;
  try
    // Salva o texto formatado do TRichEdit na stream
    RichEditTexto.Lines.SaveToStream(Texto);

    // Converte a stream em string, preenchendo a informação de texto do Originator
    FOriginator.Texto := Texto.DataString;
  finally
    // Libera a instância de TStringStream
    Texto.Free;
  end;

  // Formata a data e hora atual, transformando-as em uma string
  DataHoraAtual := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);

  // Adiciona o novo estado (Memento) no dicionário
  FCaretaker.Adicionar(DataHoraAtual, FOriginator.SalvarEstado);

  // Adiciona a alteração no histórico
  ListBoxHistoricoAlteracoes.Items.Add(DataHoraAtual);

  // Seleciona a última alteração no histórico
  ListBoxHistoricoAlteracoes.ItemIndex := Pred(ListBoxHistoricoAlteracoes.Count);
end;

procedure TfFormulario.ListBoxHistoricoAlteracoesClick(Sender: TObject);
var
  DataHora: string;
  Texto: TStringStream;
begin
  DataHora := ListBoxHistoricoAlteracoes.Items[ListBoxHistoricoAlteracoes.ItemIndex];

  // Obtém o estado conforme o item selecionado no histórico de alterações,
  // e restaura o título e o texto (substituindo os dados do Originator pelos dados do Memento encontrado)
  FOriginator.RestaurarEstado(FCaretaker.Obter(DataHora));

  // Preenche o campo referente ao título com os dados do Originator
  EditTitulo.Text := FOriginator.Titulo;

  // Cria uma instância da classe TStringStream informando o texto como parâmetro
  Texto := TStringStream.Create(FOriginator.Texto);
  try
    // Preenche o campo referente ao texto, carregando-o da stream
    RichEditTexto.Lines.LoadFromStream(Texto);
  finally
    // Libera a instância de TStringStream
    Texto.Free;
  end;
end;

procedure TfFormulario.ColorBoxCorSelect(Sender: TObject);
begin
  // Altera a cor do texto conforme seleção na caixa de cores
  RichEditTexto.SelAttributes.Color := ColorBoxCor.Selected;
end;

procedure TfFormulario.AtualizarCaixaCores;
begin
  // Exibe a cor na caixa de cores de acordo com o texto
  ColorBoxCor.Selected := RichEditTexto.SelAttributes.Color;
end;

procedure TfFormulario.AtualizarBotoesEstiloFonte;
begin
  // Destaca os botões de acordo com a formatação do texto

  SpeedButtonNegrito.Down := fsBold in RichEditTexto.SelAttributes.Style;
  SpeedButtonItalico.Down := fsItalic in RichEditTexto.SelAttributes.Style;
  SpeedButtonSublinhado.Down := fsUnderline in RichEditTexto.SelAttributes.Style;
end;

procedure TfFormulario.AtualizarBarraFerramentas;
begin
  // Atualiza os botões de estilo da fonte e a caixa de cores
  AtualizarCaixaCores;
  AtualizarBotoesEstiloFonte;
end;

procedure TfFormulario.RichEditTextoClick(Sender: TObject);
begin
  AtualizarBarraFerramentas;
end;

procedure TfFormulario.RichEditTextoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  AtualizarBarraFerramentas;
end;

procedure TfFormulario.AplicarEstilo(const Formatacao: TFontStyle);
begin
  // Aplica ou remove a formatação de texto (negrito, itálico e sublinhado)

  if Formatacao in RichEditTexto.SelAttributes.Style  then
    RichEditTexto.SelAttributes.Style := RichEditTexto.SelAttributes.Style - [Formatacao]
  else
    RichEditTexto.SelAttributes.Style := RichEditTexto.SelAttributes.Style + [Formatacao];

  RichEditTexto.SetFocus;
end;

procedure TfFormulario.SpeedButtonItalicoClick(Sender: TObject);
begin
  // Aplica o estilo itálico
  AplicarEstilo(fsItalic);
end;

procedure TfFormulario.SpeedButtonNegritoClick(Sender: TObject);
begin
  // Aplica o estilo negrito
  AplicarEstilo(fsBold);
end;

procedure TfFormulario.SpeedButtonSublinhadoClick(Sender: TObject);
begin
  // Aplica o estilo sublinhado
  AplicarEstilo(fsUnderline);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
