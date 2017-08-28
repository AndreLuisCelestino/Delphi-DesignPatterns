unit View.Formulario;

{
  Exemplo de Strategy com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Pattern.Context;

type
  { Client }
  TfFormulario = class(TForm)
    Bevel: TBevel;
    BitBtnValidar: TBitBtn;
    ComboBoxAlgortimo: TComboBox;
    EditEmail: TEdit;
    LabelAlgoritmo: TLabel;
    LabelEmail: TLabel;
    LabelResultado: TLabel;
    procedure BitBtnValidarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    // Variável para armazenar a instância do Context
    FContext: TContext;
  end;

var
  fFormulario: TfFormulario;

implementation

{$R *.dfm}

procedure TfFormulario.BitBtnValidarClick(Sender: TObject);
var
  TipoValidacao: TTipoValidacao;
  EmailValido: boolean;
begin
  LabelResultado.Caption := EmptyStr;
  Application.ProcessMessages;

  // Preenche o tipo de validação conforme seleção no ComboBox
  case ComboBoxAlgortimo.ItemIndex of
    0: TipoValidacao := avDLL;
    1: TipoValidacao := avRegExLib;
    2: TipoValidacao := avMailBoxLayer;
  else
    Exit;
  end;

  // Chama o método do Context que, por sua vez, encaminha ao Concrete Strategy
  EmailValido := FContext.ValidarEmail(TipoValidacao, EditEmail.Text);

  // Apresenta o resultado na tela
  if EmailValido then
  begin
    LabelResultado.Caption := 'O endereço de e-mail é válido!';
    LabelResultado.Font.Color := clGreen;
  end
  else
  begin
    LabelResultado.Caption := 'O endereço de e-mail está incorreto.';
    LabelResultado.Font.Color := clRed;
  end;

end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria a instância do Context
  FContext := TContext.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  // Libera a instância do Context da memória
  FContext.Free;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
