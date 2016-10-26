unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TfTela = class(TForm)
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
  fTela: TfTela;

implementation

uses
  uWebServiceViaCEP, uWebServiceCorreios, uComunicador, uAdapter;

{$R *.dfm}

procedure TfTela.btnViaCEPClick(Sender: TObject);
var
  oWebServiceViaCEP: TWebServiceViaCEP;
  oComunicador: TComunicador;
  slRetorno: TStringList;
begin
  // se o CEP não for válido, nada é executado
  if not ValidarCEP then
  begin
    Exit;
  end;

  IndicarStatusDeProcessamento;

  // instancia o objeto da classe de consulta do ViaCEP
  oWebServiceViaCEP := TWebServiceViaCEP.Create;

  // instancia o comunicador (Target), injetando o objeto de consulta
  oComunicador := TComunicador.Create(oWebServiceViaCEP);

  // instancia uma TStringList para receber o retorno
  slRetorno := TStringList.Create;
  try
    // invoca o método de consulta do Target e recebe o retorno
    slRetorno := oComunicador.ConsultarEndereco(EditCEP.Text);

    // exibe os dados
    EditLogradouro.Text := slRetorno.Values['Logradouro'];
    EditBairro.Text := slRetorno.Values['Bairro'];
    EditCidade.Text := slRetorno.Values['Cidade'];
  finally
    // libera os objetos da memória
    FreeAndNil(slRetorno);
    FreeAndNil(oComunicador);
  end;
end;

procedure TfTela.btnCorreiosClick(Sender: TObject);
var
  oWebServiceCorreios: TWebServiceCorreios;
  oAdapter: TAdapter;
  oComunicador: TComunicador;
  slRetorno: TStringList;
begin
  // se o CEP não for válido, nada é executado
  if not ValidarCEP then
  begin
    Exit;
  end;

  IndicarStatusDeProcessamento;

  // instancia o objeto da classe de consulta dos correios (Adaptee)
  oWebServiceCorreios := TWebServiceCorreios.Create;

  // instancia o adaptador (Adapter)
  oAdapter := TAdapter.Create(oWebServiceCorreios);

  // instancia o comunicador (Target), injetando o adaptador
  oComunicador := TComunicador.Create(oAdapter);

  // instancia uma TStringList para receber o retorno
  slRetorno := TStringList.Create;
  try
    try
      // invoca o método de consulta e recebe o retorno
      slRetorno := oComunicador.ConsultarEndereco(EditCEP.Text);

      // preenche os dados
      EditLogradouro.Text := slRetorno.Values['Logradouro'];
      EditBairro.Text := slRetorno.Values['Bairro'];
      EditCidade.Text := slRetorno.Values['Cidade'];
    except
      // se ocorrer alguma exceção na comunicação com o WebService,
      // os textos dos campos são apagados
      EditLogradouro.Clear;
      EditBairro.Clear;
      EditCidade.Clear;
    end;
  finally
    // libera os objetos da memória
    FreeAndNil(slRetorno);
    FreeAndNil(oComunicador);
  end;
end;

function TfTela.ValidarCEP: boolean;
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

procedure TfTela.IndicarStatusDeProcessamento;
begin
  // preenche a propriedade Text dos componentes TEdit com o texto "Aguarde"
  EditLogradouro.Text := 'Aguarde...';
  EditBairro.Text := 'Aguarde...';
  EditCidade.Text := 'Aguarde...';

  Application.ProcessMessages;
end;

end.
