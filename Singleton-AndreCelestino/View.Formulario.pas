unit View.Formulario;

{
  Exemplo de Singleton com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfFormulario = class(TForm)
    BitBtnCadastrarParticipantes: TBitBtn;
    BitBtnRealizarSorteio: TBitBtn;
    BitBtnAbrirLog: TBitBtn;
    Bevel: TBevel;
    procedure FormShow(Sender: TObject);
    procedure BitBtnAbrirLogClick(Sender: TObject);
    procedure BitBtnCadastrarParticipantesClick(Sender: TObject);
    procedure BitBtnRealizarSorteioClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  ShellAPI, Pattern.Singleton, View.Cadastro, View.Sorteio;

{$R *.dfm}

procedure TfFormulario.BitBtnAbrirLogClick(Sender: TObject);
var
  DiretorioAplicacao: string;
begin
  // abre o arquivo de log gerado pelo Singleton (Logger)
  DiretorioAplicacao := ExtractFilePath(Application.ExeName);
  ShellExecute(Handle, 'open', PWideChar(DiretorioAplicacao + 'Log.txt'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfFormulario.FormShow(Sender: TObject);
var
  Logger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  Logger := TLoggerSingleton.ObterInstancia;
  Logger.RegistrarLog('Usuário iniciou a aplicação.');
end;

procedure TfFormulario.BitBtnCadastrarParticipantesClick(Sender: TObject);
var
  fCadastro: TfCadastro;
begin
  // abre a tela de cadastro de participantes
  fCadastro := TfCadastro.Create(Self);
  fCadastro.ShowModal;
  FreeAndNil(fCadastro);
end;

procedure TfFormulario.BitBtnRealizarSorteioClick(Sender: TObject);
var
  fSorteio: TfSorteio;
begin
  // abre a tela de sorteio
  fSorteio := TfSorteio.Create(Self);
  fSorteio.ShowModal;
  FreeAndNil(fSorteio);
end;

end.
