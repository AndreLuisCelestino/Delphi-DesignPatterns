unit Pattern.Singleton;

interface

type
  { Singleton }
  TLoggerSingleton = class
  private
    // variável que aponta para o arquivo de log
    ArquivoLog: TextFile;

    // o construtor é declarado como privado
    // para evitar que seja chamado por outras classes
    constructor Create;
  public
    // método principal do Singleton
    class function ObterInstancia: TLoggerSingleton;

    class function NewInstance: TObject; override;

    // método para registrar o texto do parâmetro no arquivo de log
    procedure RegistrarLog(const Texto: string);
  end;

var
  Instancia: TLoggerSingleton;

implementation

uses
  Forms, SysUtils;

{ TLogger }

constructor TLoggerSingleton.Create;
var
  DiretorioAplicacao: string;
begin
  // associa o aquivo "Log.txt" que está na pasta do projeto
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(ArquivoLog, DiretorioAplicacao + 'Log.txt');

  // se o arquivo não existir, é criado
  if not FileExists(DiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(ArquivoLog);
    CloseFile(ArquivoLog);
  end;
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

procedure TLoggerSingleton.RegistrarLog(const Texto: string);
var
  sDataHora: string;
begin
  // abre o arquivo de log para edição
  Append(ArquivoLog);

  // escreve a data, hora e texto no arquivo de log
  sDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(ArquivoLog, sDataHora + Texto);

  // fecha o arquivo
  CloseFile(ArquivoLog);
end;

initialization

finalization
  FreeAndNil(Instancia);


end.
