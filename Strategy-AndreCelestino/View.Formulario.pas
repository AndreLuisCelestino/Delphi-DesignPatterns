unit View.Formulario;

{
  Exemplo de Strategy com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
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
    // Vari�vel para armazenar a inst�ncia do Context
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

  // Preenche o tipo de valida��o conforme sele��o no ComboBox
  case ComboBoxAlgortimo.ItemIndex of
    0: TipoValidacao := avDLL;
    1: TipoValidacao := avRegExLib;
    2: TipoValidacao := avMailBoxLayer;
  else
    Exit;
  end;

  // Chama o m�todo do Context que, por sua vez, encaminha ao Concrete Strategy
  EmailValido := FContext.ValidarEmail(TipoValidacao, EditEmail.Text);

  // Apresenta o resultado na tela
  if EmailValido then
  begin
    LabelResultado.Caption := 'O endere�o de e-mail � v�lido!';
    LabelResultado.Font.Color := clGreen;
  end
  else
  begin
    LabelResultado.Caption := 'O endere�o de e-mail est� incorreto.';
    LabelResultado.Font.Color := clRed;
  end;

end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria a inst�ncia do Context
  FContext := TContext.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  // Libera a inst�ncia do Context da mem�ria
  FContext.Free;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
