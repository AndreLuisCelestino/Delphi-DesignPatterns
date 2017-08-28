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

  // Define um tipo de função que corresponde ao método da DLL
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
      MessageDlg('Não foi possível carregar a DLL', mtWarning, [mbOK], 0);
      Exit;
    end;

    // Obtém o endereço do método da DLL chamado "ValidarEmail"
    @ValidarEmail := GetProcAddress(HandleDLL, 'ValidarEmail');

    // Chama o método da DLL para validar o e-mail
    result := ValidarEmail(Email);
  finally
    // Descarrega a DLL
    FreeLibrary(HandleDLL);
  end;
end;

end.
