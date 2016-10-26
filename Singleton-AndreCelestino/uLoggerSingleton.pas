unit uLoggerSingleton;

interface

type
  TLoggerSingleton = class
  private
    // vari�vel que aponta para o arquivo de log
    FArquivoLog: TextFile;

    // o construtor � declarado como privado
    // para evitar que seja chamado por outras classes
    constructor Create;
  public
    // m�todo principal do Singleton
    class function ObterInstancia: TLoggerSingleton;

    class function NewInstance: TObject; override;

    // m�todo para registrar o texto do par�metro no arquivo de log
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
  // associa o aquivo "Log.txt" que est� na pasta do projeto
  sDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(FArquivoLog, sDiretorioAplicacao + 'Log.txt');

  // se o arquivo n�o existir, � criado
  if not FileExists(sDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

destructor TLoggerSingleton.Destroy;
begin
  // libera o Singleton da mem�ria
  FreeAndNil(Instancia);

  inherited;
end;

class function TLoggerSingleton.NewInstance: TObject;
begin
  // se j� houver uma inst�ncia, ela � retornada
  // caso contr�rio, o objeto � instanciado antes de ser retornado
 
  if not Assigned(Instancia) then
  begin
    // chama a fun��o "NewInstance" da heran�a (TObject)
    Instancia := TLoggerSingleton(inherited NewInstance);
  end;
 
  result := Instancia;
end;

class function TLoggerSingleton.ObterInstancia: TLoggerSingleton;
begin
  // chama o m�todo Create, que cria (uma �nica vez) e retorna a inst�ncia
  result := TLoggerSingleton.Create;
end;

procedure TLoggerSingleton.RegistrarLog(const psTexto: string);
var
  sDataHora: string;
begin
  // abre o arquivo de log para edi��o
  Append(FArquivoLog);

  // escreve a data, hora e texto no arquivo de log
  sDataHora := FormatDateTime('[dd/mm/yyyy hh:nn:ss] ', Now);
  WriteLn(FArquivoLog, sDataHora + psTexto);

  // fecha o arquivo
  CloseFile(FArquivoLog);
end;

end.
