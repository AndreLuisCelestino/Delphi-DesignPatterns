unit View.Formulario;

{
  Exemplo de Flyweight com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, Buttons, Grids, DBGrids, Pattern.FlyweightFactory;

type
  { Client }
  TfFormulario = class(TForm)
    ClientDataSet: TClientDataSet;
    ClientDataSetCodigo: TIntegerField;
    ClientDataSetNome: TStringField;
    ClientDataSetPais: TStringField;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    BitBtnExportarComFlyweight: TBitBtn;
    BitBtnExportarSemFlyweight: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnExportarComFlyweightClick(Sender: TObject);
    procedure BitBtnExportarSemFlyweightClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  ShellAPI, DateUtils, Pattern.Flyweight, Pattern.ConcreteFlyweight;

{$R *.dfm}

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // carrega os dados dos leitores a partir de um XML
  ClientDataSet.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Dados.xml');
end;

procedure TfFormulario.BitBtnExportarComFlyweightClick(Sender: TObject);
var
  FlyweightFactory: TFlyweightFactory;
  Cartao: TCartao;
  FieldPais: TField;
  FieldNome: TField;
  TempoInicio: TDateTime;
  TempoFim: TDateTime;
  TempoGasto: smallint;
begin
  // cria o objeto da classe Factory do Flyweight
  FlyweightFactory := TFlyweightFactory.Create;

  try
    // armazena a referência dos Fields
    // para evitar o uso do FieldByName dentro do loop
    FieldPais := ClientDataSet.FindField('Pais');
    FieldNome := ClientDataSet.FindField('Nome');

    // armzena o tempo de início do processamento
    TempoInicio := Now;

    // move para o primeiro registro do DataSet
    ClientDataSet.First;

    // executa um loop em todos os registros
    while not ClientDataSet.EOF do
    begin
      // chama o método GetCartao para retornar o objeto compartilhado
      // através do nome do país
      Cartao := FlyweightFactory.GetCartao(FieldPais.AsString);

      // altera a proprieade extrínseca, que é o nome do leitor
      Cartao.NomeLeitor := FieldNome.AsString;

      // chama o método para exportação do cartão
      Cartao.Exportar;

      // move para o próximo registro
      ClientDataSet.Next;
    end;

    // armzena o tempo de fim do processamento
    TempoFim := Now;

    // calcula e exibe o tempo gasto
    TempoGasto := SecondsBetween(TempoFim, TempoInicio);
    ShowMessage(Format('Tempo gasto com Flyweight: %d segundos', [TempoGasto]));
  finally
  // libera o objeto da classe Factory do Flyweight da memória
    FreeAndNil(FlyweightFactory);
  end;

  // abre a pasta com os arquivos criados
  ShellExecute(Application.Handle, PChar('explore'),
    PChar(ExtractFilePath(ParamStr(0)) + 'cartoes'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfFormulario.BitBtnExportarSemFlyweightClick(Sender: TObject);
var
  Cartao: TCartao;
  FieldPais: TField;
  FieldNome: TField;
  TempoInicio: TDateTime;
  TempoFim: TDateTime;
  TempoGasto: smallint;
begin
  // armazena a referência dos Fields
  // para evitar o uso do FieldByName dentro do loop
  FieldPais := ClientDataSet.FindField('Pais');
  FieldNome := ClientDataSet.FindField('Nome');

  // armzena o tempo de início do processamento
  TempoInicio := Now;

  // move para o primeiro registro do DataSet
  ClientDataSet.First;

  // executa um loop em todos os registros
  while not ClientDataSet.EOF do
  begin
    try
      // cria o objeto de cartão conforme o país do leitor
      if FieldPais.AsString = 'Espanha' then
        Cartao := TCartaoEspanha.Create
      else if FieldPais.AsString = 'EUA' then
        Cartao := TCartaoEUA.Create
      else if FieldPais.AsString = 'Brasil' then
        Cartao := TCartaoBrasil.Create
      else if FieldPais.AsString = 'Itália' then
        Cartao := TCartaoItalia.Create;

      // preenche a propriedade referente ao nome do leitor
      Cartao.NomeLeitor := FieldNome.AsString;

      // chama o método para exportação do cartão
      Cartao.Exportar;
    finally
      // libera o objeto de cartão da memória
      FreeAndNil(Cartao);
    end;

    // move para o próximo registro
    ClientDataSet.Next;
  end;

  // armzena o tempo de fim do processamento
  TempoFim := Now;

  // calcula e exibe o tempo gasto
  TempoGasto := SecondsBetween(TempoFim, TempoInicio);
  ShowMessage(Format('Tempo gasto sem Flyweight: %d segundos', [TempoGasto]));

  // abre a pasta com os arquivos criados
  ShellExecute(Application.Handle, PChar('explore'),
    PChar(ExtractFilePath(ParamStr(0)) + 'cartoes'), nil, nil, SW_SHOWNORMAL);
end;

end.
