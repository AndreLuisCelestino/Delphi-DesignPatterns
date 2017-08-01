program ExemploObserver;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {fFormulario},
  Model.Notificacao in 'Model.Notificacao.pas',
  Pattern.Subject in 'Pattern.Subject.pas',
  Pattern.Observer in 'Pattern.Observer.pas',
  Pattern.ObserverSaldo in 'Pattern.ObserverSaldo.pas' {FrameSaldo: TFrame},
  Pattern.ObserverLog in 'Pattern.ObserverLog.pas' {FrameLog: TFrame},
  Pattern.ConcreteSubject in 'Pattern.ConcreteSubject.pas' {FrameCadastroOperacoes: TFrame},
  Pattern.ObserverAgrupamento in 'Pattern.ObserverAgrupamento.pas' {FrameAgrupamento: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfFormulario, fFormulario);
  Application.Run;
end.
