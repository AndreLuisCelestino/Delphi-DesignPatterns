unit View.Formulario;

{
  Exemplo de Chain of Responsibility com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient;

type
  { Client }
  TfFormulario = class(TForm)
    LabelArquivo: TLabel;
    EditArquivo: TEdit;
    BitBtnProcessarInclusao: TBitBtn;
    DBGrid: TDBGrid;
    OpenDialog: TOpenDialog;
    ClientDataSet: TClientDataSet;
    DataSource: TDataSource;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    ClientDataSetCidade: TStringField;
    procedure BitBtnProcessarInclusaoClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Pattern.Handler, Pattern.ConcreteHandler;

{$R *.dfm}

procedure TfFormulario.BitBtnProcessarInclusaoClick(Sender: TObject);
var
  // Variáveis do tipo da Interface
  // para utilização do recurso de contagem de referência
  ParserTXT: IParser;
  ParserCSV: IParser;
  ParserXML: IParser;
  ParserJSON: IParser;
begin
  // Abre o OpenDialog no subdiretório "Dados" dentro do diretório da aplicação
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName) + 'Dados';
  if not OpenDialog.Execute then
    Exit;

  // Atribui o caminho e nome do arquivo selecionado no EditArquivo
  EditArquivo.Text := OpenDialog.FileName;

  // Cria os Parsers (Concrete Handlers)
  ParserTXT := TParserTXT.Create;
  ParserCSV := TParserCSV.Create;
  ParserXML := TParserXML.Create;
  ParserJSON := TParserJSON.Create;

  // Configura a hierarquia horizontal dos Parsers
  ParserTXT.SetProximoParser(ParserCSV);
  ParserCSV.SetProximoParser(ParserXML);
  ParserXML.SetProximoParser(ParserJSON);
  ParserJSON.SetProximoParser(nil); // opcional

  // Limpa o DataSet
  ClientDataSet.EmptyDataSet;

  // Inicia a cadeia pelo primeiro elo, ou seja, o mais comum ou provável
  ParserTXT.ProcessarInclusao(OpenDialog.FileName, ClientDataSet);

  // Move o cursor do DataSet para o primeiro registro
  ClientDataSet.First;
end;

end.
