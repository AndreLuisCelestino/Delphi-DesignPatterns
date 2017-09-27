unit Pattern.ConcreteImplementorHTML;

interface

uses
  Classes, Pattern.Implementor;

type
  { Concrete Implementor }
  TFormatoHTML = class(TInterfacedObject, IFormato)
  private
    HTML: TStringList;

    procedure CriarCabecalhoHTML;
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure PularLinha;
    procedure DesenharCabecalho(const Titulo: string);
    procedure ExportarCampo(const Valor: string);
    procedure SalvarArquivo(const NomeArquivo: string);
  end;

implementation

uses
  SysUtils, Forms, Windows, ShellAPI;

{ TFormatoHTML }

constructor TFormatoHTML.Create;
begin
  HTML := TStringList.Create;
  CriarCabecalhoHTML;
end;

procedure TFormatoHTML.CriarCabecalhoHTML;
begin
  HTML.Add('<html>');
  HTML.Add('<head>');
  HTML.Add('<style>');
  HTML.Add('body { font-family: Tahoma; }');
  HTML.Add('table, td, th { border: 1px solid #ddd; text-align: left; }');
  HTML.Add('table { border-collapse: collapse; width: 100%; }');
  HTML.Add('</style>');
  HTML.Add('<head>');
  HTML.Add('</head>');
  HTML.Add('<body>');
  HTML.Add('<table>');
  HTML.Add('<tr>');
end;

procedure TFormatoHTML.DesenharCabecalho(const Titulo: string);
begin
  HTML.Add(Format('<th>%s</th>', [Titulo]));
end;

destructor TFormatoHTML.Destroy;
begin
  FreeAndNil(HTML);
  inherited;
end;

procedure TFormatoHTML.ExportarCampo(const Valor: string);
begin
  HTML.Add(Format('<td>%s</td>', [Valor]));
end;

procedure TFormatoHTML.PularLinha;
begin
  HTML.Add('</tr><tr>');
end;

procedure TFormatoHTML.SalvarArquivo(const NomeArquivo: string);
var
  CaminhoAplicacao: string;
  NomeCompleto: string;
begin
  HTML.Add('</tr>');
  HTML.Add('</table>');
  HTML.Add('</body>');
  HTML.Add('</html>');

  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  NomeCompleto := Format('%s%s.html', [CaminhoAplicacao, NomeArquivo]);
  DeleteFile(PWideChar(NomeCompleto));
  HTML.SaveToFile(NomeCompleto);
  ShellExecute(0, nil, PChar(NomeCompleto), nil,  nil, SW_SHOWNORMAL);
end;

end.

