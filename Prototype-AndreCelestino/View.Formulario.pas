unit View.Formulario;

{
  Exemplo de Prototype com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  System.UITypes, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Contnrs, ExtCtrls, Pattern.Prototype, Pattern.ConcretePrototype,
  System.Generics.Collections;

type
  { Client }
  TfFormulario = class(TForm)
    BitBtnDuplicar: TBitBtn;
    BitBtnNova: TBitBtn;
    ColorBoxCategoria: TColorBox;
    DateTimePickerData: TDateTimePicker;
    DateTimePickerHora: TDateTimePicker;
    EditNome: TEdit;
    LabelCategoria: TLabel;
    LabelData: TLabel;
    LabelHora: TLabel;
    LabelListaReunioes: TLabel;
    LabelNomeReuniao: TLabel;
    LabelParticipantes: TLabel;
    ListBox: TListBox;
    MemoParticipantes: TMemo;
    Panel: TPanel;
    procedure EditNomeExit(Sender: TObject);
    procedure DateTimePickerDataExit(Sender: TObject);
    procedure BitBtnDuplicarClick(Sender: TObject);
    procedure BitBtnNovaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure DateTimePickerHoraExit(Sender: TObject);
    procedure ColorBoxCategoriaExit(Sender: TObject);
    procedure MemoParticipantesExit(Sender: TObject);
  private
    // lista de objetos que armazenar� as reuni�es
    ListaReunioes: TList<IPrototype>;

    // vari�vel para armazenar a reuni�o atualmente selecionada
    ReuniaoSelecionada: TConcretePrototype;

    procedure AdicionarNovaReuniaoNaListBox;
    procedure PreencherDados;
  end;

var
  fFormulario: TfFormulario;

implementation

{$R *.dfm}

procedure TfFormulario.EditNomeExit(Sender: TObject);
begin
  ReuniaoSelecionada.Nome := Trim(EditNome.Text);
end;

procedure TfFormulario.DateTimePickerDataExit(Sender: TObject);
begin
  ReuniaoSelecionada.Data := DateTimePickerData.Date;
end;

procedure TfFormulario.BitBtnDuplicarClick(Sender: TObject);
var
  ReuniaoClone: IPrototype;
begin
  if ListBox.Count = 0 then
  begin
    MessageDlg('N�o existem reuni�es na lista! Clique em "Nova" para adicionar.',
      mtInformation, [mbOK], 0);
    BitBtnNova.SetFocus;
    Exit;
  end;

  // comando para CLONAR uma nova reuni�o
  ReuniaoClone := ReuniaoSelecionada.Clonar;

  // adiciona o clone na lista de reuni�es
  ListaReunioes.Add(ReuniaoClone);

  // adiciona o clone na ListBox
  AdicionarNovaReuniaoNaListBox;

  // preenche os campos no painel
  PreencherDados;

  EditNome.SetFocus;
end;

procedure TfFormulario.BitBtnNovaClick(Sender: TObject);
var
  NovaReuniao: IPrototype;
begin
  Panel.Visible := True;

  // comando para CRIAR uma nova reuni�o
  NovaReuniao := TConcretePrototype.Create;

  // adiciona o clone na lista de reuni�es
  ListaReunioes.Add(NovaReuniao);

  // adiciona o clone na ListBox
  AdicionarNovaReuniaoNaListBox;

  // preenche os campos no painel
  PreencherDados;

  EditNome.SetFocus;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // cria a lista de objetos que armazenar� as reuni�es
  ListaReunioes := TList<IPrototype>.Create;
end;

procedure TfFormulario.ListBoxClick(Sender: TObject);
begin
  PreencherDados;
end;

procedure TfFormulario.DateTimePickerHoraExit(Sender: TObject);
begin
  ReuniaoSelecionada.Hora := DateTimePickerHora.Time;
end;

procedure TfFormulario.ColorBoxCategoriaExit(Sender: TObject);
begin
  ReuniaoSelecionada.Categoria := ColorBoxCategoria.Selected;
end;

procedure TfFormulario.MemoParticipantesExit(Sender: TObject);
begin
  ReuniaoSelecionada.Participantes := MemoParticipantes.Text;
end;

procedure TfFormulario.AdicionarNovaReuniaoNaListBox;
begin
  // adiciona um novo item na ListBox
  ListBox.Items.Add('Reuni�o #' + IntToStr(ListBox.Items.Count + 1));
  ListBox.ItemIndex := ListBox.Items.Count - 1;
end;

procedure TfFormulario.PreencherDados;
begin
  // seleciona a reuni�o na lista de objetos conforme o ItemIndex da ListBox
  // e atribui � vari�vel FoReuniaoSelecionada
  ReuniaoSelecionada := ListaReunioes[ListBox.ItemIndex] as TConcretePrototype;

  EditNome.Text := ReuniaoSelecionada.Nome;
  DateTimePickerData.Date := ReuniaoSelecionada.Data;
  DateTimePickerHora.Time := ReuniaoSelecionada.Hora;
  ColorBoxCategoria.Selected := ReuniaoSelecionada.Categoria;
  MemoParticipantes.Text := ReuniaoSelecionada.Participantes;
end;

end.
