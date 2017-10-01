unit View.Formulario;

{
  Exemplo de Adapter com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  { Client }
  TfFormulario = class(TForm)
    lbCEP: TLabel;
    lbCidade: TLabel;
    EditCidade: TEdit;
    lbBairro: TLabel;
    EditBairro: TEdit;
    btnViaCEP: TBitBtn;
    btnCorreios: TBitBtn;
    EditCEP: TMaskEdit;
    lbLogradouro: TLabel;
    EditLogradouro: TEdit;
    procedure btnViaCEPClick(Sender: TObject);
    procedure btnCorreiosClick(Sender: TObject);
  private
    // função para verificar se o CEP é válido
    function ValidarCEP: boolean;

    // altera o texto dos componentes TEdit para "Aguarde..."
    procedure IndicarStatusDeProcessamento;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
   System.UITypes, WebService.ViaCEP, Pattern.Target, Pattern.Adapter,
   Pattern.Adaptee;

{$R *.dfm}

procedure TfFormulario.btnViaCEPClick(Sender: TObject);
var
  WebServiceViaCEP: TWebServiceViaCEP;
  Comunicador: TComunicador;
  Retorno: TStringList;
begin
  // se o CEP não for válido, nada é executado
  if not ValidarCEP then
  begin
    Exit;
  end;

  IndicarStatusDeProcessamento;

  // instancia o objeto da classe de consulta do ViaCEP
  WebServiceViaCEP := TWebServiceViaCEP.Create;

  // instancia o comunicador (Target), injetando o objeto de consulta
  Comunicador := TComunicador.Create(WebServiceViaCEP);

  // instancia uma TStringList para receber o retorno
  Retorno := TStringList.Create;
  try
    // invoca o método de consulta do Target e recebe o retorno
    Retorno := Comunicador.ConsultarEndereco(EditCEP.Text);

    // exibe os dados
    EditLogradouro.Text := Retorno.Values['Logradouro'];
    EditBairro.Text := Retorno.Values['Bairro'];
    EditCidade.Text := Retorno.Values['Cidade'];
  finally
    // libera os objetos da memória
    FreeAndNil(Retorno);
    FreeAndNil(Comunicador);
  end;
end;

procedure TfFormulario.btnCorreiosClick(Sender: TObject);
var
  WebServiceCorreios: TWebServiceCorreios;
  Adapter: TAdapter;
  Comunicador: TComunicador;
  Retorno: TStringList;
begin
  // se o CEP não for válido, nada é executado
  if not ValidarCEP then
    Exit;

  IndicarStatusDeProcessamento;

  // instancia o objeto da classe de consulta dos correios (Adaptee)
  WebServiceCorreios := TWebServiceCorreios.Create;

  // instancia o adaptador (Adapter)
  Adapter := TAdapter.Create(WebServiceCorreios);

  // instancia o comunicador (Target), injetando o adaptador
  Comunicador := TComunicador.Create(Adapter);

  // instancia uma TStringList para receber o retorno
  Retorno := TStringList.Create;
  try
    try
      // invoca o método de consulta e recebe o retorno
      Retorno := Comunicador.ConsultarEndereco(EditCEP.Text);

      // preenche os dados
      EditLogradouro.Text := Retorno.Values['Logradouro'];
      EditBairro.Text := Retorno.Values['Bairro'];
      EditCidade.Text := Retorno.Values['Cidade'];
    except
      // se ocorrer alguma exceção na comunicação com o WebService,
      // os textos dos campos são apagados
      EditLogradouro.Clear;
      EditBairro.Clear;
      EditCidade.Clear;
    end;
  finally
    // libera os objetos da memória
    FreeAndNil(Retorno);
    FreeAndNil(Comunicador);
  end;
end;

function TfFormulario.ValidarCEP: boolean;
begin
  // função para verificar se o CEP é válido,
  // testando se o número de caracteres é igual a 8

  result := True;
  if Length(EditCEP.Text) < 8 then
  begin
    MessageDlg('Digite o CEP corretamente.', mtWarning, [mbOK], 0);
    EditCEP.SetFocus;
    result := False;
  end;
end;

procedure TfFormulario.IndicarStatusDeProcessamento;
begin
  // preenche a propriedade Text dos componentes TEdit com o texto "Aguarde"
  EditLogradouro.Text := 'Aguarde...';
  EditBairro.Text := 'Aguarde...';
  EditCidade.Text := 'Aguarde...';

  Application.ProcessMessages;
end;

end.
