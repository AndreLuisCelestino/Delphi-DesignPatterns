unit View.Formulario;

{
  Exemplo de Command com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  { Client }
  TfFormulario = class(TForm)
    GroupBox: TGroupBox;
    MemoProgramas: TMemo;
    LabelProgramas: TLabel;
    LabelProcessos: TLabel;
    MemoProcessos: TMemo;
    BitBtnExecutarComandos: TBitBtn;
    CheckBoxProgramas: TCheckBox;
    CheckBoxProcessos: TCheckBox;
    CheckBoxVariaveisAmbiente: TCheckBox;
    LabelVariaveisAmbiente: TLabel;
    MemoVariaveis: TMemo;
    procedure BitBtnExecutarComandosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.Command, Pattern.Receiver, Pattern.Invoker, Pattern.ConcreteCommand;

{$R *.dfm}

procedure TfFormulario.BitBtnExecutarComandosClick(Sender: TObject);
var
  Receiver: TReceiver;
  Invoker: TInvoker;
begin
  // Remove os artigos antigos das extrações anteriores
  DeleteFile(GetCurrentDir + '\Info\Programas.txt');
  DeleteFile(GetCurrentDir + '\Info\Processos.txt');
  DeleteFile(GetCurrentDir + '\Info\Variaveis.txt');

  // Cria o Receiver (objeto que contém a codificação das operações)
  Receiver := TReceiver.Create;

  // Cria o Invoker (objeto que armazena os comandos e os executa)
  Invoker := TInvoker.Create;
  try
    if CheckBoxProgramas.Checked then     
      // Armazena o comando de extração de programas no Invoker
      Invoker.Add(TProgramas.Create(Receiver));

    if CheckBoxProcessos.Checked then
      // Armazena o comando de extração de processos no Invoker
      Invoker.Add(TProcessos.Create(Receiver));

    if CheckBoxVariaveisAmbiente.Checked then
      // Armazena o comando de extração das variáveis de ambiente no Invoker
      Invoker.Add(TVariaveisAmbiente.Create(Receiver));

    // Solicita ao Invoker que execute todos os comandos armazenados
    Invoker.ExtrairInformacoes;
  finally
    // Libera os objetos da memória
    FreeAndNil(Invoker);
    FreeAndNil(Receiver);
  end;

  // Limpa o conteúdos dos componentes TMemo
  MemoProgramas.Clear;
  MemoProcessos.Clear;
  MemoVariaveis.Clear;  

  // Carrega a lista de programas extraídos
  if FileExists(GetCurrentDir + '\Info\Programas.txt') then
    MemoProgramas.Lines.LoadFromFile(GetCurrentDir + '\Info\Programas.txt');

  // Carrega a lista de processos extraídos
  if FileExists(GetCurrentDir + '\Info\Processos.txt') then
    MemoProcessos.Lines.LoadFromFile(GetCurrentDir + '\Info\Processos.txt');

  // Carrega a lista de variáveis de ambiente extraídas
  if FileExists(GetCurrentDir + '\Info\Variaveis.txt') then
    MemoVariaveis.Lines.LoadFromFile(GetCurrentDir + '\Info\Variaveis.txt');
end;

procedure TfFormulario.FormShow(Sender: TObject);
begin
  MessageDlg('Devido à restrições do Windows 10, a aplicação deverá ser executada ' +
    'com privilégios de Administrador para que a extração da lista de programas funcione.',
    mtWarning, [mbOK], 0);
end;

end.
