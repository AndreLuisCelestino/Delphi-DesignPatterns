unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TfTela = class(TForm)
    btnCadastrarParticipantes: TBitBtn;
    btnRealizarSorteio: TBitBtn;
    Bevel: TBevel;
    btnAbrirLog: TBitBtn;
    procedure btnAbrirLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastrarParticipantesClick(Sender: TObject);
    procedure btnRealizarSorteioClick(Sender: TObject);
  end;

var
  fTela: TfTela;

implementation

uses
  ShellAPI, uLoggerSingleton, uCadastro, uSorteio;

{$R *.dfm}

procedure TfTela.btnAbrirLogClick(Sender: TObject);
var
  sDiretorioAplicacao: string;
begin
  // abre o arquivo de log gerado pelo Singleton (Logger)
  sDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  ShellExecute(Handle, 'open', PAnsiChar(sDiretorioAplicacao + 'Log.txt'), nil, nil, SW_SHOWNORMAL); 
end;

procedure TfTela.FormShow(Sender: TObject);
var
  oLogger: TLoggerSingleton;
begin
  // obtém a instância do Singleton para registrar um log
  oLogger := TLoggerSingleton.ObterInstancia;
  oLogger.RegistrarLog('Usuário iniciou a aplicação.');
end;

procedure TfTela.btnCadastrarParticipantesClick(Sender: TObject);
var
  fCadastro: TfCadastro;
begin
  // abre a tela de cadastro de participantes
  fCadastro := TfCadastro.Create(Self);
  fCadastro.ShowModal;
  FreeAndNil(fCadastro);
end;

procedure TfTela.btnRealizarSorteioClick(Sender: TObject);
var
  fSorteio: TfSorteio;
begin
  // abre a tela de sorteio
  fSorteio := TfSorteio.Create(Self);
  fSorteio.ShowModal;
  FreeAndNil(fSorteio);
end;

end.
