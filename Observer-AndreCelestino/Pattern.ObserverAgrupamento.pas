unit Pattern.ObserverAgrupamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, Pattern.Observer, Model.Notificacao,
  Vcl.ExtCtrls;

type
  { Concrete Observer }
  TFrameAgrupamento = class(TFrame, IObserver)
    ClientDataSet: TClientDataSet;
    ClientDataSetCategoria: TStringField;
    ClientDataSetTotal: TFloatField;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    LabelTitulo: TLabel;
  public
    // M�todo que ser� chamado pelo Subject
    procedure Atualizar(Notificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrameAgrupamento }

procedure TFrameAgrupamento.Atualizar(Notificacao: TNotificacao);
begin
  if Notificacao.Operacao = 'Cr�dito' then
    Exit;

  // Localiza a categoria para somar o valor do d�bito
  if ClientDataSet.Locate('Categoria', Notificacao.Categoria, []) then
  begin
    ClientDataSet.Edit;

    ClientDataSet.FieldByName('Total').AsFloat :=
      ClientDataSet.FieldByName('Total').AsFloat + Notificacao.Valor;

    ClientDataSet.Post;
    ClientDataSet.First;

    Exit;
  end;

  // Insere a categoria caso ainda n�o exista no DataSet
  ClientDataSet.AppendRecord([Notificacao.Categoria, Notificacao.Valor]);
end;

end.
