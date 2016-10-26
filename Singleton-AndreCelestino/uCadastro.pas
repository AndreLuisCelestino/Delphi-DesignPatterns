unit uCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, DBGrids, DB, DBClient;

type
  TfCadastro = class(TForm)
    ClientDataSet: TClientDataSet;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    DBGrid: TDBGrid;
    btnInserir: TSpeedButton;
    btnRemover: TSpeedButton;
    DataSource: TDataSource;
    procedure btnInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientDataSetAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ClientDataSetBeforeDelete(DataSet: TDataSet);
    procedure ClientDataSetBeforePost(DataSet: TDataSet);
  end;

var
  fCadastro: TfCadastro;

implementation

uses
  uLoggerSingleton;

{$R *.dfm}

procedure TfCadastro.btnInserirClick(Sender: TObject);
var
  nProximoCodigo: integer;
begin
  // obtém o próximo código do DataSet
  ClientDataSet.Last;
  nProximoCodigo := ClientDataSet.FieldByName('Codigo').AsInteger + 1;

  // coloca o DataSet em modo de inserção e atribui o código ao novo registro
  ClientDataSet.Append;
  ClientDataSet.FieldByName('Codigo').AsInteger := nProximoCodigo;

  // coloca o foco na segunda coluna da DBGrid
  DBGrid.SetFocus;
  DBGrid.SelectedField := ClientDataSet.FieldByName('Nome');
end;

procedure TfCadastro.FormCreate(Sender: TObject);
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
  ClientDataSet.LogChanges := False;
end;

procedure TfCadastro.btnRemoverClick(Sender: TObject);
begin
  // exclui o registro selecionado
  ClientDataSet.Delete;
end;

procedure TfCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sDiretorioAplicacao: string;
begin
  // salva os dados dos participantes para um arquivo XML
  sDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSet.SaveToFile(sDiretorioAplicacao + 'Participantes.xml');
end;

procedure TfCadastro.ClientDataSetAfterPost(
  DataSet: TDataSet);
var
  oLogger: TLoggerSingleton;
  sTexto: string;
begin
  sTexto := Format('Participante "%s" cadastrado.',
    [ClientDataSet.FieldByName('Nome').AsString]);

  // obtém a instância do Singleton para registrar um log
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog(sTexto);
end;

procedure TfCadastro.FormShow(Sender: TObject);
var
  oLogger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog('Usuário abriu a tela de Cadastro de Participantes.');
end;

procedure TfCadastro.ClientDataSetBeforeDelete(
  DataSet: TDataSet);
var
  oLogger: TLoggerSingleton;
  sTexto: string;
begin
  sTexto := Format('Participante "%s" removido.',
    [ClientDataSet.FieldByName('Nome').AsString]);

  // obtém a instância do Singleton para registrar um log    
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog(sTexto);
end;

procedure TfCadastro.ClientDataSetBeforePost(DataSet: TDataSet);
begin
  if Trim(ClientDataSet.FieldByName('Nome').AsString) = EmptyStr then
  begin
    ClientDataSet.Cancel;
    Abort;
  end;
end;

end.
