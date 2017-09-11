unit View.Formulario;

{
  Exemplo de Template Method com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Pattern.AbstractClass, Vcl.Buttons;

type
  TfFormulario = class(TForm)
    ClientDataSet: TClientDataSet;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    Panel: TPanel;
    RadioGroupTipo: TRadioGroup;
    LabelConsulta: TLabel;
    EditConsulta: TEdit;
    BitBtnConsultar: TBitBtn;
    procedure BitBtnConsultarClick(Sender: TObject);
  private
    function ObterConcreteClass: TAbstractClass;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.ConcreteClassRepositories, Pattern.ConcreteClassUsers;

{$R *.dfm}

procedure TfFormulario.BitBtnConsultarClick(Sender: TObject);
var
  ConcreteClass: TAbstractClass;
begin
  if Trim(EditConsulta.Text) = EmptyStr then
  begin
    MessageDlg('Selecione um texto para a consulta.', mtWarning, [mbOK], 0);
    Exit;
  end;

  if RadioGroupTipo.ItemIndex < 0 then
  begin
    MessageDlg('Selecione um tipo de consulta.', mtWarning, [mbOK], 0);
    Exit;
  end;

  ConcreteClass := ObterConcreteClass;
  try
    // Executa o Template Method
    ClientDataSet.Data := ConcreteClass.ConsultarDadosGitHub;
  finally
    ConcreteClass.Free;
  end;
end;

function TfFormulario.ObterConcreteClass: TAbstractClass;
begin
  // Retorna a instância de uma Concrete Class conforme seleção
  result := nil;
  case RadioGroupTipo.ItemIndex of
    0: result := TConcreteClassRepositories.Create(EditConsulta.Text);
    1: result := TConcreteClassUsers.Create(EditConsulta.Text);
  end;
end;

end.
