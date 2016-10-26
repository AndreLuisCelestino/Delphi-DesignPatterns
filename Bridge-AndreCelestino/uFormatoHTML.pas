unit uFormatoHTML;

interface

uses
  Classes, uInterfaceFormato;

type
  { Concrete Implementor }
  TFormatoHTML = class(TInterfacedObject, IFormato)
  private
    FslHTML: TStringList;

    procedure CriarCabecalhoHTML;
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure PularLinha;
    procedure DesenharCabecalho(const psTitulo: string);
    procedure ExportarCampo(const psValor: string);
    procedure SalvarArquivo(const psNomeArquivo: string);
  end;

implementation

uses
  SysUtils, Forms, Windows, ShellAPI;

{ TFormatoHTML }

constructor TFormatoHTML.Create;
begin
  FslHTML := TStringList.Create;
  CriarCabecalhoHTML;
end;

procedure TFormatoHTML.CriarCabecalhoHTML;
begin
  FslHTML.Add('<html>');
  FslHTML.Add('<head>');
  FslHTML.Add('<style>');
  FslHTML.Add('body { font-family: Tahoma; }');
  FslHTML.Add('table, td, th { border: 1px solid #ddd; text-align: left; }');
  FslHTML.Add('table { border-collapse: collapse; width: 100%; }');
  FslHTML.Add('</style>');
  FslHTML.Add('<head>');
  FslHTML.Add('</head>');
  FslHTML.Add('<body>');
  FslHTML.Add('<table>');
  FslHTML.Add('<tr>');
end;

procedure TFormatoHTML.DesenharCabecalho(const psTitulo: string);
begin
  FslHTML.Add(Format('<th>%s</th>', [psTitulo]));
end;

destructor TFormatoHTML.Destroy;
begin
  FreeAndNil(FslHTML);
  inherited;
end;

procedure TFormatoHTML.ExportarCampo(const psValor: string);
begin
  FslHTML.Add(Format('<td>%s</td>', [psValor]));
end;

procedure TFormatoHTML.PularLinha;
begin
  FslHTML.Add('</tr><tr>');
end;

procedure TFormatoHTML.SalvarArquivo(const psNomeArquivo: string);
var
  sCaminhoAplicacao: string;
  sNomeArquivo: string;
begin
  FslHTML.Add('</tr>');
  FslHTML.Add('</table>');
  FslHTML.Add('</body>');
  FslHTML.Add('</html>');

  sCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  sNomeArquivo := Format('%s%s.html', [sCaminhoAplicacao, psNomeArquivo]);
  DeleteFile(PAnsiChar(sNomeArquivo));
  FslHTML.SaveToFile(sNomeArquivo);
  ShellExecute(0, nil, PChar(sNomeArquivo), nil,  nil, SW_SHOWNORMAL);
end;

end.

