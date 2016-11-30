unit uVersaoWindowsDecorator;

interface

uses
  uDecorator;

type
  { Concrete Decorator }
  TVersaoWindowsDecorator = class(TDecorator)
  private
    function ObterVersaoWindows: string;
  protected
    function ObterDadosExcecao: string; override;
  end;

implementation

uses
  SysUtils, Windows, Registry;

function TVersaoWindowsDecorator.ObterDadosExcecao: string;
begin
  // retorna a string dos outros decoradores primeiro
  result := inherited ObterDadosExcecao;

  // adiciona a versão do Windows
  result := result + 'Versão do Sistema Operacional: ' + ObterVersaoWindows;
end;

function TVersaoWindowsDecorator.ObterVersaoWindows: string;
var
  Registro: TRegistry;
  nMajorVersion: byte;
  nMinorVersion: byte;
begin
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_LOCAL_MACHINE;
    Registro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion', False);
    nMajorVersion := Registro.ReadInteger('CurrentMajorVersionNumber');
    nMinorVersion := Registro.ReadInteger('CurrentMinorVersionNumber');

    case nMajorVersion of
      5: case nMinorVersion of
          1: result := 'Windows XP';
        end;
      6: case nMinorVersion of
          0: result := 'Windows Vista';
          1: result := 'Windows 7';
          2: result := 'Windows 8';
          3: result := 'Windows 8.1';
        end;
      10: case nMinorVersion of
          0: result := 'Windows 10';
        end;
    end;
  finally
    FreeAndNil(Registro);
  end;
end;

end.
