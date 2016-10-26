unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Contnrs, ExtCtrls, uReuniao;

type
  TfTela = class(TForm)
    lbListaReunioes: TLabel;
    ListBox: TListBox;
    btnNova: TBitBtn;
    btnDuplicar: TBitBtn;
    Panel: TPanel;
    lbNomeReuniao: TLabel;
    EditNome: TEdit;
    lbData: TLabel;
    DateTimePickerData: TDateTimePicker;
    lbHora: TLabel;
    DateTimePickerHora: TDateTimePicker;
    lbCategoria: TLabel;
    ColorBoxCategoria: TColorBox;
    Label6: TLabel;
    MemoParticipantes: TMemo;
    procedure EditNomeExit(Sender: TObject);
    procedure DateTimePickerDataExit(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBoxClick(Sender: TObject);
    procedure DateTimePickerHoraExit(Sender: TObject);
    procedure ColorBoxCategoriaExit(Sender: TObject);
    procedure MemoParticipantesExit(Sender: TObject);
  private
    // lista de objetos que armazenará as reuniões
    FoListaReunioes: TObjectList;

    // variável para armazenar a reunião atualmente selecionada
    FoReuniaoSelecionada: TReuniao;

    procedure AdicionarNovaReuniaoNaListBox;
    procedure PreencherDados;
  end;

var
  fTela: TfTela;

implementation

{$R *.dfm}

procedure TfTela.EditNomeExit(Sender: TObject);
begin
  FoReuniaoSelecionada.Nome := Trim(EditNome.Text);
end;

procedure TfTela.DateTimePickerDataExit(Sender: TObject);
begin
  FoReuniaoSelecionada.Data := DateTimePickerData.Date;
end;

procedure TfTela.btnDuplicarClick(Sender: TObject);
var
  oReuniaoClone: TReuniao;
begin
  if ListBox.Count = 0 then
  begin
    MessageDlg('Não existem reuniões na lista! Clique em "Nova" para adicionar.',
      mtInformation, [mbOK], 0);
    btnNova.SetFocus;
    Exit;
  end;

  // comando para CLONAR uma nova reunião
  oReuniaoClone := FoReuniaoSelecionada.Clonar;

  // adiciona o clone na lista de reuniões
  FoListaReunioes.Add(oReuniaoClone);

  // adiciona o clone na ListBox
  AdicionarNovaReuniaoNaListBox;

  // preenche os campos no painel
  PreencherDados;

  EditNome.SetFocus;
end;

procedure TfTela.btnNovaClick(Sender: TObject);
var
  oNovaReuniao: TReuniao;
begin
  Panel.Visible := True;

  // comando para CRIAR uma nova reunião
  oNovaReuniao := TReuniao.Create;

  // adiciona o clone na lista de reuniões
  FoListaReunioes.Add(oNovaReuniao);

  // adiciona o clone na ListBox
  AdicionarNovaReuniaoNaListBox;

  // preenche os campos no painel
  PreencherDados;

  EditNome.SetFocus;
end;

procedure TfTela.FormCreate(Sender: TObject);
begin
  // cria a lista de objetos que armazenará as reuniões
  FoListaReunioes := TObjectList.Create;
end;

procedure TfTela.ListBoxClick(Sender: TObject);
begin
  PreencherDados;
end;

procedure TfTela.DateTimePickerHoraExit(Sender: TObject);
begin
  FoReuniaoSelecionada.Hora := DateTimePickerHora.Time;
end;

procedure TfTela.ColorBoxCategoriaExit(Sender: TObject);
begin
  FoReuniaoSelecionada.Categoria := ColorBoxCategoria.Selected;
end;

procedure TfTela.MemoParticipantesExit(Sender: TObject);
begin
  FoReuniaoSelecionada.Participantes := MemoParticipantes.Text;
end;

procedure TfTela.AdicionarNovaReuniaoNaListBox;
begin
  // adiciona um novo item na ListBox
  ListBox.Items.Add('Reunião #' + IntToStr(ListBox.Items.Count + 1));
  ListBox.ItemIndex := ListBox.Items.Count - 1;
end;

procedure TfTela.PreencherDados;
begin
  // seleciona a reunião na lista de objetos conforme o ItemIndex da ListBox
  // e atribui à variável FoReuniaoSelecionada
  FoReuniaoSelecionada := FoListaReunioes[ListBox.ItemIndex] as TReuniao;

  EditNome.Text := FoReuniaoSelecionada.Nome;
  DateTimePickerData.Date := FoReuniaoSelecionada.Data;
  DateTimePickerHora.Time := FoReuniaoSelecionada.Hora;
  ColorBoxCategoria.Selected := FoReuniaoSelecionada.Categoria;
  MemoParticipantes.Text := FoReuniaoSelecionada.Participantes;
end;

end.
