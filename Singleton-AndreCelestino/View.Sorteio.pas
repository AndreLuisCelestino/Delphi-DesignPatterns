unit View.Sorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient;

type
  TfSorteio = class(TForm)
    LabelParticipantes: TLabel;
    BitBtnSortear: TBitBtn;
    LabelSorteado: TLabel;
    EditSorteado: TEdit;
    ClientDataSet: TClientDataSet;
    ListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtnSortearClick(Sender: TObject);
  private
    procedure PreencherParticipantes;
  end;

var
  fSorteio: TfSorteio;

implementation

uses
  Pattern.Singleton;

{$R *.dfm}

procedure TfSorteio.FormShow(Sender: TObject);
var
  Logger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog('Usuário abriu a tela de Sorteio.');

  PreencherParticipantes;
end;

procedure TfSorteio.PreencherParticipantes;
var
  DiretorioAplicacao: string;
begin
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);

  if not FileExists(DiretorioAplicacao + 'Participantes.xml') then
    Exit;

  // carrega os dados dos participantes a partir de um XML
  ClientDataSet.LoadFromFile(DiretorioAplicacao + 'Participantes.xml');
  ClientDataSet.First;

  // adiciona cada participante na ListBox
  while not ClientDataSet.Eof do
  begin
    ListBox.Items.Add(ClientDataSet.FieldByName('Nome').AsString);
    ClientDataSet.Next;
  end;
end;

procedure TfSorteio.BitBtnSortearClick(Sender: TObject);
var
  Sorteado: smallint;
  Logger: TLoggerSingleton;
begin
  // "embaralha" os números
  Randomize;

  // sorteia um número entre os índices da ListBox
  Sorteado := Random(Pred(ListBox.Items.Count));
  ListBox.ItemIndex := Sorteado;
  EditSorteado.Text := ListBox.Items[Sorteado];

  // obtém a instância do Singleton para registrar um log
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog('Participante sorteado: ' + ListBox.Items[Sorteado]);
end;

end.
