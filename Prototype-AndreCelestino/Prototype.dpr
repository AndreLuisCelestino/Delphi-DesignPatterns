program Prototype;

uses
  Forms,
  uTela in 'uTela.pas' {fTela},
  uReuniao in 'uReuniao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfTela, fTela);
  Application.Run;
end.
