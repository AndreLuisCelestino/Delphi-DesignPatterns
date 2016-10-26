unit uSorteio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBClient;

type
  TfSorteio = class(TForm)
    lbParticipantes: TLabel;
    btnSortear: TBitBtn;
    lbSorteado: TLabel;
    edtSorteado: TEdit;
    ClientDataSet: TClientDataSet;
    ListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure btnSortearClick(Sender: TObject);
  private
    procedure PreencherParticipantes;
  end;

var
  fSorteio: TfSorteio;

implementation

uses
  uLoggerSingleton;

{$R *.dfm}

procedure TfSorteio.FormShow(Sender: TObject);
var
  oLogger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog('Usuário abriu a tela de Sorteio.');

  PreencherParticipantes;
end;

procedure TfSorteio.PreencherParticipantes;
var
  sDiretorioAplicacao: string;
begin
  sDiretorioAplicacao := ExtractFilePath(Application.ExeName);

  if not FileExists(sDiretorioAplicacao + 'Participantes.xml') then
  begin
    Exit;
  end;

  // carrega os dados dos participantes a partir de um XML
  ClientDataSet.LoadFromFile(sDiretorioAplicacao + 'Participantes.xml');
  ClientDataSet.First;

  // adiciona cada participante na ListBox
  while not ClientDataSet.Eof do
  begin
    ListBox.Items.Add(ClientDataSet.FieldByName('Nome').AsString);
    ClientDataSet.Next;
  end;
end;

procedure TfSorteio.btnSortearClick(Sender: TObject);
var
  nSorteado: smallint;
  oLogger: TLoggerSingleton;
begin
  // "embaralha" os números
  Randomize;

  // sorteia um número entre os índices da ListBox
  nSorteado := Random(Pred(ListBox.Items.Count));
  ListBox.ItemIndex := nSorteado;
  edtSorteado.Text := ListBox.Items[nSorteado];

  // obtém a instância do Singleton para registrar um log
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog('Participante sorteado: ' + ListBox.Items[nSorteado]);
end;

end.
