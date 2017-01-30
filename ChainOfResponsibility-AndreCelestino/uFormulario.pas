unit uFormulario;

{
  Exemplo de Chain of Responsibility com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Datasnap.DBClient;

type
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
  uHandler, uConcreteHandler;

{$R *.dfm}

procedure TfFormulario.BitBtnProcessarInclusaoClick(Sender: TObject);
var
  // Vari�veis do tipo da Interface
  // para utiliza��o do recurso de contagem de refer�ncia
  ParserTXT: IParser;
  ParserCSV: IParser;
  ParserXML: IParser;
  ParserJSON: IParser;
begin
  // Abre o OpenDialog no subdiret�rio "Dados" dentro do diret�rio da aplica��o
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

  // Inicia a cadeia pelo primeiro elo, ou seja, o mais comum ou prov�vel
  ParserTXT.ProcessarInclusao(OpenDialog.FileName, ClientDataSet);

  // Move o cursor do DataSet para o primeiro registro
  ClientDataSet.First;
end;

end.
