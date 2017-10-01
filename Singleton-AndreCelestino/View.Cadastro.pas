unit View.Cadastro;

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
    SpeedButtonInserir: TSpeedButton;
    SpeedButtonRemover: TSpeedButton;
    DataSource: TDataSource;
    procedure SpeedButtonInserirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonRemoverClick(Sender: TObject);
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
  Pattern.Singleton;

{$R *.dfm}

procedure TfCadastro.SpeedButtonInserirClick(Sender: TObject);
var
  ProximoCodigo: integer;
begin
  // obtém o próximo código do DataSet
  ClientDataSet.Last;
  ProximoCodigo := ClientDataSet.FieldByName('Codigo').AsInteger + 1;

  // coloca o DataSet em modo de inserção e atribui o código ao novo registro
  ClientDataSet.Append;
  ClientDataSet.FieldByName('Codigo').AsInteger := ProximoCodigo;

  // coloca o foco na segunda coluna da DBGrid
  DBGrid.SetFocus;
  DBGrid.SelectedField := ClientDataSet.FieldByName('Nome');
end;

procedure TfCadastro.FormCreate(Sender: TObject);
var
  DiretorioAplicacao: string;
begin
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);

  if not FileExists(DiretorioAplicacao + 'Participantes.xml') then
    Exit;

  // carrega os dados dos participantes a partir de um XML
  ClientDataSet.LoadFromFile(DiretorioAplicacao + 'Participantes.xml');
  ClientDataSet.LogChanges := False;
end;

procedure TfCadastro.SpeedButtonRemoverClick(Sender: TObject);
begin
  // exclui o registro selecionado
  ClientDataSet.Delete;
end;

procedure TfCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
var
  DiretorioAplicacao: string;
begin
  // salva os dados dos participantes para um arquivo XML
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSet.SaveToFile(DiretorioAplicacao + 'Participantes.xml');
end;

procedure TfCadastro.ClientDataSetAfterPost(
  DataSet: TDataSet);
var
  Logger: TLoggerSingleton;
  Texto: string;
begin
  Texto := Format('Participante "%s" cadastrado.',
    [ClientDataSet.FieldByName('Nome').AsString]);

  // obtém a instância do Singleton para registrar um log
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog(Texto);
end;

procedure TfCadastro.FormShow(Sender: TObject);
var
  Logger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog('Usuário abriu a tela de Cadastro de Participantes.');
end;

procedure TfCadastro.ClientDataSetBeforeDelete(
  DataSet: TDataSet);
var
  Logger: TLoggerSingleton;
  Texto: string;
begin
  Texto := Format('Participante "%s" removido.',
    [ClientDataSet.FieldByName('Nome').AsString]);

  // obtém a instância do Singleton para registrar um log    
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog(Texto);
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
