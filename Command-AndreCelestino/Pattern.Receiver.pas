unit Pattern.Receiver;

interface

type
  { Receiver }
  TReceiver = class
  public
    procedure ExtrairProcessos;
    procedure ExtrairProgramas;
    procedure ExtrairVariaveisAmbiente;
  end;

implementation

uses
  Dialogs, Messages, Windows, TlHelp32, psAPI, SysUtils, Registry, Classes;

{ TReceiver }

procedure TReceiver.ExtrairProcessos;
var
  Handle: THandle;
  ProcessEntry: TProcessEntry32;
  ListaProcessos: TStringList;
begin
  // Método responsável por extrair a lista de processos em execução

  Handle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ListaProcessos := TStringList.Create;
  try
    ProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(Handle, ProcessEntry);

    // Percorre os processos que estão em execução,
    // adicionando-os na variável ListaProcessos
    repeat
      ListaProcessos.Add(ProcessEntry.szExeFile)
    until not Process32Next(Handle, ProcessEntry);

    // Grava a lista de processos no arquivo "Processos.txt"
    ListaProcessos.SaveToFile(GetCurrentDir + '\Info\Processos.txt');
  finally
    CloseHandle(Handle);
  end;
end;

procedure TReceiver.ExtrairProgramas;
const
  CHAVE_REGISTRO = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\';
var
  Registro: TRegistry;
  Contador: integer;
  ListaChaves: TStringList;
  ListaProgramas: TStringList;
begin
  // Método responsável por extrair a lista de programas instalados
  // Obs: a aplicação deve ser executado como administrador

  Registro := TRegistry.Create;
  ListaChaves := TStringList.Create;
  ListaProgramas := TStringList.Create;
  try
    // Obtém a lista de chaves existentes no caminho do registro
    // que armazena as informações de programas instalados
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    Registro.OpenKey(CHAVE_REGISTRO, False);
    Registro.GetKeyNames(ListaChaves);
    Registro.CloseKey;

    // Percorre a lista de chaves para acessar o valor do atributo "DisplayName"
    for Contador := 0 to Pred(ListaChaves.Count) do
    begin
      Registro.RootKey := HKEY_LOCAL_MACHINE;
      Registro.OpenKey(CHAVE_REGISTRO + ListaChaves[Contador], False);

      if Registro.ReadString('DisplayName') <> EmptyStr then
        // Adiciona o nome do programa na variável ListaProgramas
        ListaProgramas.Add(Registro.ReadString('DisplayName'));

      Registro.CloseKey;
    end;

    // Grava a lista de processos no arquivo "Programas.txt"
    ListaProgramas.SaveToFile(GetCurrentDir + '\Info\Programas.txt');
  finally
    // Libera os objetos da memória
    FreeAndNil(ListaProgramas);
    FreeAndNil(ListaChaves);
    FreeAndNil(Registro);
  end;
end;

procedure TReceiver.ExtrairVariaveisAmbiente;
var
  Variavel: PChar;
  ListaVariaveis: TStringList;
begin
  // Método responsável por extrair a lista das variáveis de ambiente

  ListaVariaveis := TStringList.Create;
  try
    // Obtém a lista das variáveis de ambiente
    Variavel := GetEnvironmentStrings;
    while Variavel^ <> #0 do
    begin
      ListaVariaveis.Add(StrPas(Variavel));
      ListaVariaveis.Add(EmptyStr);
      Inc(Variavel, lStrLen(Variavel) + 1);
    end;
    FreeEnvironmentStrings(Variavel);

    // Grava a lista de variáveis no arquivo "Variaveis.txt"
    ListaVariaveis.SaveToFile(GetCurrentDir + '\Info\Variaveis.txt');
  finally
    // Libera o objeto da memória
    FreeAndNil(ListaVariaveis);
  end;
end;

end.
