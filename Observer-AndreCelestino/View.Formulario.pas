unit View.Formulario;

{
  Exemplo de Observer com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Pattern.ObserverSaldo,
  Pattern.ObserverLog, Pattern.ConcreteSubject, Pattern.ObserverAgrupamento,
  Vcl.ExtCtrls;

type
  { Client }
  TfFormulario = class(TForm)
    FrameCadastroOperacoes: TFrameCadastroOperacoes;
    FrameSaldo: TFrameSaldo;
    FrameLog: TFrameLog;
    FrameAgrupamento: TFrameAgrupamento;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

{$R *.dfm}

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Registra os Observers, adicionando-os na lista do Concrete Subject

  FrameCadastroOperacoes.AdicionarObserver(FrameSaldo);
  FrameCadastroOperacoes.AdicionarObserver(FrameAgrupamento);
  FrameCadastroOperacoes.AdicionarObserver(FrameLog);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
