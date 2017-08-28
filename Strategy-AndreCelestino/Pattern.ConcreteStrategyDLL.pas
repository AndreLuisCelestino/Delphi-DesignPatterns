unit Pattern.ConcreteStrategyDLL;

interface

uses
  Pattern.Strategy;

type
  { Concrete Strategy - DLL }
  TConcreteStrategyDLL = class(TInterfacedObject, IStrategy)
  public
    // Assinatura da Interface Strategy
    function ValidarEmail(const Email: string): boolean;
  end;

  // Define um tipo de fun��o que corresponde ao m�todo da DLL
  TValidarEmail = function(const Email: string): boolean; stdcall;

implementation

uses
  Winapi.Windows, Vcl.Dialogs, System.UITypes;

{ TConcreteStrategyDLL }

function TConcreteStrategyDLL.ValidarEmail(const Email: string): boolean;
var
 HandleDLL: THandle;
 ValidarEmail: TValidarEmail;
begin
  result := False;

  // Carrega a DLL
  HandleDLL := LoadLibrary('ValidadorEmail.dll');
  try
    if HandleDLL = 0 then
    begin
      MessageDlg('N�o foi poss�vel carregar a DLL', mtWarning, [mbOK], 0);
      Exit;
    end;

    // Obt�m o endere�o do m�todo da DLL chamado "ValidarEmail"
    @ValidarEmail := GetProcAddress(HandleDLL, 'ValidarEmail');

    // Chama o m�todo da DLL para validar o e-mail
    result := ValidarEmail(Email);
  finally
    // Descarrega a DLL
    FreeLibrary(HandleDLL);
  end;
end;

end.
