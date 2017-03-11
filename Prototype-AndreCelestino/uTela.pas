unit uTela;

{
  Exemplo de Prototype com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  System.UITypes, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Contnrs, ExtCtrls, uReuniao;

type
  TfTela = class(TForm)
    LabelListaReunioes: TLabel;
    ListBox: TListBox;
    BitBtnNova: TBitBtn;
    BitBtnDuplicar: TBitBtn;
    Panel: TPanel;
    LabelNomeReuniao: TLabel;
    EditNome: TEdit;
    LabelData: TLabel;
    DateTimePickerData: TDateTimePicker;
    LabelHora: TLabel;
    DateTimePickerHora: TDateTimePicker;
    LabelCategoria: TLabel;
    ColorBoxCategoria: TColorBox;
    LabelParticipantes: TLabel;
    MemoParticipantes: TMemo;
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
    ListaReunioes: TObjectList;

    // vari�vel para armazenar a reuni�o atualmente selecionada
    ReuniaoSelecionada: TReuniao;

    procedure AdicionarNovaReuniaoNaListBox;
    procedure PreencherDados;
  end;

var
  fTela: TfTela;

implementation

{$R *.dfm}

procedure TfTela.EditNomeExit(Sender: TObject);
begin
  ReuniaoSelecionada.Nome := Trim(EditNome.Text);
end;

procedure TfTela.DateTimePickerDataExit(Sender: TObject);
begin
  ReuniaoSelecionada.Data := DateTimePickerData.Date;
end;

procedure TfTela.BitBtnDuplicarClick(Sender: TObject);
var
  ReuniaoClone: TReuniao;
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

procedure TfTela.BitBtnNovaClick(Sender: TObject);
var
  NovaReuniao: TReuniao;
begin
  Panel.Visible := True;

  // comando para CRIAR uma nova reuni�o
  NovaReuniao := TReuniao.Create;

  // adiciona o clone na lista de reuni�es
  ListaReunioes.Add(NovaReuniao);

  // adiciona o clone na ListBox
  AdicionarNovaReuniaoNaListBox;

  // preenche os campos no painel
  PreencherDados;

  EditNome.SetFocus;
end;

procedure TfTela.FormCreate(Sender: TObject);
begin
  // cria a lista de objetos que armazenar� as reuni�es
  ListaReunioes := TObjectList.Create;
end;

procedure TfTela.ListBoxClick(Sender: TObject);
begin
  PreencherDados;
end;

procedure TfTela.DateTimePickerHoraExit(Sender: TObject);
begin
  ReuniaoSelecionada.Hora := DateTimePickerHora.Time;
end;

procedure TfTela.ColorBoxCategoriaExit(Sender: TObject);
begin
  ReuniaoSelecionada.Categoria := ColorBoxCategoria.Selected;
end;

procedure TfTela.MemoParticipantesExit(Sender: TObject);
begin
  ReuniaoSelecionada.Participantes := MemoParticipantes.Text;
end;

procedure TfTela.AdicionarNovaReuniaoNaListBox;
begin
  // adiciona um novo item na ListBox
  ListBox.Items.Add('Reuni�o #' + IntToStr(ListBox.Items.Count + 1));
  ListBox.ItemIndex := ListBox.Items.Count - 1;
end;

procedure TfTela.PreencherDados;
begin
  // seleciona a reuni�o na lista de objetos conforme o ItemIndex da ListBox
  // e atribui � vari�vel FoReuniaoSelecionada
  ReuniaoSelecionada := ListaReunioes[ListBox.ItemIndex] as TReuniao;

  EditNome.Text := ReuniaoSelecionada.Nome;
  DateTimePickerData.Date := ReuniaoSelecionada.Data;
  DateTimePickerHora.Time := ReuniaoSelecionada.Hora;
  ColorBoxCategoria.Selected := ReuniaoSelecionada.Categoria;
  MemoParticipantes.Text := ReuniaoSelecionada.Participantes;
end;

end.
