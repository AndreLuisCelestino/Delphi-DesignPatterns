unit View.Formulario;

{
  Exemplo de Decorator com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AppEvnts;

type
  { Client }
  TfFormulario = class(TForm)
    GroupBox: TGroupBox;
    CheckBoxDataHora: TCheckBox;
    CheckBoxNomeUsuario: TCheckBox;
    CheckBoxVersaoWindows: TCheckBox;
    BitBtnGerarExcecao: TBitBtn;
    Memo: TMemo;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsException(Sender: TObject; E: Exception);
    procedure BitBtnGerarExcecaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.Component, Pattern.ConcreteComponent, Pattern.Decorator.DataHora,
  Pattern.Decorator.NomeUsuario, Pattern.Decorator.VersaoWindows;

{$R *.dfm}

procedure TfFormulario.ApplicationEventsException(Sender: TObject; E: Exception);
var
  LogExcecao: ILogExcecao;
begin
  LogExcecao := TLogExcecao.Create(E);

  // para "decorar" o objeto com data e hora da exce��o
  if CheckBoxDataHora.Checked then
    LogExcecao := TDataHoraDecorator.Create(LogExcecao);
  
  // para "decorar" o objeto com o nome do usu�rio
  if CheckBoxNomeUsuario.Checked then
    LogExcecao := TNomeUsuarioDecorator.Create(LogExcecao);
  
  // para "decorar" o objeto com a vers�o do Windows
  if CheckBoxVersaoWindows.Checked then
    LogExcecao := TVersaoWindowsDecorator.Create(LogExcecao);
  
  // exibir� os campos conforme a(s) decora��o(�es) selecionada(s)
  Memo.Lines.Add(LogExcecao.ObterDadosExcecao);
  Memo.Lines.Add(EmptyStr);
end;

procedure TfFormulario.BitBtnGerarExcecaoClick(Sender: TObject);
begin
  // gera uma exce��o para entrar no evento "OnException" do TApplicationEvents
  raise Exception.Create('Exce��o de exemplo para teste!');
end;

procedure TfFormulario.FormShow(Sender: TObject);
begin
  MessageDlg('Devido � restri��es do Windows 10, a aplica��o dever� ser executada ' +
    'com privil�gios de Administrador para que a extra��o da vers�o do Windows funcione.',
    mtWarning, [mbOK], 0);
end;

end.
