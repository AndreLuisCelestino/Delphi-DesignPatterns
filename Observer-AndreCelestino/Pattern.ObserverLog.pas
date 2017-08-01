unit Pattern.ObserverLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, Pattern.Observer, Model.Notificacao;

type
  { Concrete Observer }
  TFrameLog = class(TFrame, IObserver)
    LabelTitulo: TLabel;
    MemoLog: TMemo;
  public
    // Método que será chamado pelo Subject
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameLog }

procedure TFrameLog.Atualizar(Notificacao: TNotificacao);
var
  TextoLog: string;
begin
  TextoLog := Format('Uma operação de %s de %.2f foi adicionada',
    [Notificacao.Operacao, Notificacao.Valor]);

  // Adiciona o log no Memo
  MemoLog.Lines.Add(TextoLog);
end;

end.
