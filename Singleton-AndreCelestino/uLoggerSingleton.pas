unit uLoggerSingleton;

interface

type
  TLoggerSingleton = class
  private
    // variável que aponta para o arquivo de log
    FArquivoLog: TextFile;

    // o construtor é declarado como privado
    // para evitar que seja chamado por outras classes
    constructor Create;
  public
    // método principal do Singleton
    class function ObterInstancia: TLoggerSingleton;

    class function NewInstance: TObject; override;

    // método para registrar o texto do parâmetro no arquivo de log
    procedure RegistrarLog(const psTexto: string);

    destructor Destroy; override;
  end;

var
  Instancia: TLoggerSingleton;

implementation

uses
  Forms, SysUtils;

{ TLogger }

constructor TLoggerSingleton.Create;
var
  sDiretorioAplicacao: string;
begin
  // associa o aquivo "Log.txt" que está na pasta do projeto
  sDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(FArquivoLog, sDiretorioAplicacao + 'Log.txt');

  // se o arquivo não existir, é criado
  if not FileExists(sDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

destructor TLoggerSingleton.Destroy;
begin
  // libera o Singleton da memória
  FreeAndNil(Instancia);

  inherited;
end;

class function TLoggerSingleton.NewInstance: TObject;
begin
  // se já houver uma instância, ela é retornada
  // caso contrário, o objeto é instanciado antes de ser retornado
 
  if not Assigned(Instancia) then
  begin
    // chama a função "NewInstance" da herança (TObject)
    Instancia := TLoggerSingleton(inherited NewInstance);
  end;
 
  result := Instancia;
end;

class function TLoggerSingleton.ObterInstancia: TLoggerSingleton;
begin
  // chama o método Create, que cria (uma única vez) e retorna a instância
  result := TLoggerSingleton.Create;
end;

procedure TLoggerSingleton.RegistrarLog(const psTexto: string);
var
  sDataHora: string;
begin
  // abre o arquivo de log para edição
  Append(FArquivoLog);

  // escreve a data, hora e texto no arquivo de log
  sDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(FArquivoLog, sDataHora + psTexto);

  // fecha o arquivo
  CloseFile(FArquivoLog);
end;

end.
