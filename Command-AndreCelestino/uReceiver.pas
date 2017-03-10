unit uReceiver;

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
  // M�todo respons�vel por extrair a lista de processos em execu��o

  Handle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ListaProcessos := TStringList.Create;
  try
    ProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(Handle, ProcessEntry);

    // Percorre os processos que est�o em execu��o,
    // adicionando-os na vari�vel ListaProcessos
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
  // M�todo respons�vel por extrair a lista de programas instalados
  // Obs: a aplica��o deve ser executado como administrador

  Registro := TRegistry.Create;
  ListaChaves := TStringList.Create;
  ListaProgramas := TStringList.Create;
  try
    // Obt�m a lista de chaves existentes no caminho do registro
    // que armazena as informa��es de programas instalados
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
        // Adiciona o nome do programa na vari�vel ListaProgramas
        ListaProgramas.Add(Registro.ReadString('DisplayName'));

      Registro.CloseKey;
    end;

    // Grava a lista de processos no arquivo "Programas.txt"
    ListaProgramas.SaveToFile(GetCurrentDir + '\Info\Programas.txt');
  finally
    // Libera os objetos da mem�ria
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
  // M�todo respons�vel por extrair a lista das vari�veis de ambiente

  ListaVariaveis := TStringList.Create;
  try
    // Obt�m a lista das vari�veis de ambiente
    Variavel := GetEnvironmentStrings;
    while Variavel^ <> #0 do
    begin
      ListaVariaveis.Add(StrPas(Variavel));
      ListaVariaveis.Add(EmptyStr);
      Inc(Variavel, lStrLen(Variavel) + 1);
    end;
    FreeEnvironmentStrings(Variavel);

    // Grava a lista de vari�veis no arquivo "Variaveis.txt"
    ListaVariaveis.SaveToFile(GetCurrentDir + '\Info\Variaveis.txt');
  finally
    // Libera o objeto da mem�ria
    FreeAndNil(ListaVariaveis);
  end;
end;

end.
