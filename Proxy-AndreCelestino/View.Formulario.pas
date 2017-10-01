unit View.Formulario;

{
  Exemplo de Proxy com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Pattern.Subject, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  { Client }
  TfFormulario = class(TForm)
    BitBtnCalcularDistancia: TBitBtn;
    ComboBoxEstadoOrigem: TComboBox;
    EditCidadeOrigem: TEdit;
    EditCidadeDestino: TEdit;
    ComboBoxEstadoDestino: TComboBox;
    LabelOrigem: TLabel;
    LabelDestino: TLabel;
    MemoHistorico: TMemo;
    RadioGroupCache: TRadioGroup;
    procedure BitBtnCalcularDistanciaClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Pattern.Proxy, Pattern.RealSubject;

{$R *.dfm}

procedure TfFormulario.BitBtnCalcularDistanciaClick(Sender: TObject);
var
  Calculador: ICalculador;
  Origem: string;
  Destino: string;
  Distancia: string;
begin
  // Formata a origem e destino no formato "Cidade,Estado" para ser enviado na URL
  Origem := Format('%s,%s', [EditCidadeOrigem.Text, ComboBoxEstadoOrigem.Text]);
  Destino := Format('%s,%s', [EditCidadeDestino.Text, ComboBoxEstadoDestino.Text]);

  // Condi��o importante:
  // Define se o calculador da dist�ncia ser� o Proxy ou o Real Subject
  // - Se for o Proxy, far� proveito do cache de dados
  // - Se for o Real Subject, a consulta sempre ser� feita pela API
  case RadioGroupCache.ItemIndex of
    0: Calculador := TCalculadorProxy.Create;
    1: Calculador := TCalculadorReal.Create;
  end;

  // Chama o m�todo de c�lculo da dist�ncia
  Distancia := Calculador.CalcularDistancia(Origem, Destino);

  // Adiciona os dados da consulta no hist�rico
  MemoHistorico.Lines.Add(Format('%s -> %s = %s', [Origem, Destino, Distancia]));

  // Limpa os campos para uma nova consulta
  EditCidadeOrigem.Clear;
  EditCidadeDestino.Clear;
  ComboBoxEstadoOrigem.Text := EmptyStr;
  ComboBoxEstadoDestino.Text := EmptyStr;

  EditCidadeOrigem.SetFocus;
end;

end.
