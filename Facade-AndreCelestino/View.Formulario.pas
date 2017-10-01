unit View.Formulario;

{
  Exemplo de Fa�ade com Delphi
  Criado por Andr� Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids;

type
  { Client }
  TfFormulario = class(TForm)
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesCliente: TStringField;
    ClientDataSetClientesFidelidade: TSmallintField;
    BitBtnCalcularValorDaVenda: TBitBtn;
    ClientDataSetProdutos: TClientDataSet;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosProduto: TStringField;
    ClientDataSetProdutosPreco: TFloatField;
    DBGridClientes: TDBGrid;
    LabelCliente: TLabel;
    DBGridProdutos: TDBGrid;
    LabelProduto: TLabel;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    Memo: TMemo;
    LabelHistorico: TLabel;
    procedure BitBtnCalcularValorDaVendaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ClientDataSetClientesFidelidadeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  System.UITypes, Pattern.Facade;

{$R *.dfm}

procedure TfFormulario.BitBtnCalcularValorDaVendaClick(Sender: TObject);
var
  Fidelidade: smallint;
  Preco: real;
  Facade: TFacade;
begin
  MessageDlg('Neste momento, o Fa�ade ser� instanciado para:' + sLineBreak +
             ' - Consultar a cota��o do d�lar no WebService;' + sLineBreak +
             ' - Calcular o pre�o em Reais (R$);' + sLineBreak +
             ' - Aplicar desconto conforme Fidelidade e margem de venda;' + sLineBreak +
             ' - Registrar a opera��o no arquivo "Hist�rico.txt".',
             mtInformation, [mbOK], 0);

  Fidelidade := ClientDataSetClientes.FieldByName('Fidelidade').AsInteger;
  Preco := ClientDataSetProdutos.FieldByName('Preco').AsFloat;

  // cria uma inst�ncia do Fa�ade
  Facade := TFacade.Create;
  try
    // chama o m�todo do Fa�ade que, por sua vez,
    // executa as opera��es de todos os Subsystems
    Facade.CalcularValorDeVenda(Fidelidade, Preco);

    // carrega o log da opera��o (gerado por um dos Subsystems)
    Memo.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Historico.txt');

    // navega para a �ltima linha do Memo
    Memo.Lines.Add(EmptyStr);
    Perform(EM_SCROLL, SB_LINEDOWN, 0);
  finally
    // libera o objeto da mem�ria
    FreeAndNil(Facade);
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  // obt�m o caminho do aplica��o
  CaminhoAplicacao := ExtractFilePath(ParamStr(0));

  // exclui o arquivo de hist�rico existente
  DeleteFile(CaminhoAplicacao + 'Historico.txt');

  // carrega os dados de clientes e produtos a partir de arquivos XML
  ClientDataSetClientes.LoadFromFile(CaminhoAplicacao + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(CaminhoAplicacao + 'Produtos.xml');
end;

procedure TfFormulario.ClientDataSetClientesFidelidadeGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  // exibe a descri��o da fidelidade conforme o c�digo
  case Sender.AsInteger of
    0: Text := 'Nenhum';
    1: Text := 'Bronze';
    2: Text := 'Prata';
    3: Text := 'Ouro';
  end;
end;

end.
