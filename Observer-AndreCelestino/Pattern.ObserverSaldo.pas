unit Pattern.ObserverSaldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Pattern.Observer, Model.Notificacao;

type
  { Concrete Observer }
  TFrameSaldo = class(TFrame, IObserver)
    LabelTitulo: TLabel;
    LabelCreditos: TLabel;
    LabelDebitos: TLabel;
    LabelSaldo: TLabel;
    LabelValorDebitos: TLabel;
    LabelValorCreditos: TLabel;
    LabelValorSaldo: TLabel;
  private
    // Vari�veis para armazenar o total de d�bitos e cr�ditos
    FCreditos: real;
    FDebitos: real;
  public
    // M�todo que ser� chamado pelo Subject
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameSaldo }

procedure TFrameSaldo.Atualizar(Notificacao: TNotificacao);
var
  Saldo: real;
begin
  // Soma o valor � vari�vel conforme a opera��o
  if Notificacao.Operacao = 'Cr�dito' then
    FCreditos := FCreditos + Notificacao.Valor
  else if Notificacao.Operacao = 'D�bito' then
    FDebitos := FDebitos + Notificacao.Valor;

  // Calcula o saldo
  Saldo := FCreditos - FDebitos;

  // Exibe os valores nos componentes TLabel
  LabelValorCreditos.Caption := FormatFloat('###,##0.00', FCreditos);
  LabelValorDebitos.Caption := FormatFloat('###,##0.00', FDebitos);
  LabelValorSaldo.Caption := FormatFloat('###,##0.00', Saldo);
end;

end.
