unit View.Formulario;

{
  Exemplo de Decorator com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
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

  // para "decorar" o objeto com data e hora da exceção
  if CheckBoxDataHora.Checked then
    LogExcecao := TDataHoraDecorator.Create(LogExcecao);
  
  // para "decorar" o objeto com o nome do usuário
  if CheckBoxNomeUsuario.Checked then
    LogExcecao := TNomeUsuarioDecorator.Create(LogExcecao);
  
  // para "decorar" o objeto com a versão do Windows
  if CheckBoxVersaoWindows.Checked then
    LogExcecao := TVersaoWindowsDecorator.Create(LogExcecao);
  
  // exibirá os campos conforme a(s) decoração(ões) selecionada(s)
  Memo.Lines.Add(LogExcecao.ObterDadosExcecao);
  Memo.Lines.Add(EmptyStr);
end;

procedure TfFormulario.BitBtnGerarExcecaoClick(Sender: TObject);
begin
  // gera uma exceção para entrar no evento "OnException" do TApplicationEvents
  raise Exception.Create('Exceção de exemplo para teste!');
end;

procedure TfFormulario.FormShow(Sender: TObject);
begin
  MessageDlg('Devido à restrições do Windows 10, a aplicação deverá ser executada ' +
    'com privilégios de Administrador para que a extração da versão do Windows funcione.',
    mtWarning, [mbOK], 0);
end;

end.
