unit View.Formulario;

{
  Exemplo de Bridge com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfFormulario = class(TForm)
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetProdutos: TClientDataSet;
    DBGridClientes: TDBGrid;
    DBGridProdutos: TDBGrid;
    BitBtnExportarClientesXLS: TBitBtn;
    BitBtnExportarClientesHTML: TBitBtn;
    BitBtnExportarProdutosXLS: TBitBtn;
    BitBtnExportarProdutosHTML: TBitBtn;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesCidade: TStringField;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosDescricao: TStringField;
    ClientDataSetProdutosEstoque: TIntegerField;
    Bevel: TBevel;
    LabelClientes: TLabel;
    LabelProdutos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnExportarClientesXLSClick(Sender: TObject);
    procedure BitBtnExportarClientesHTMLClick(Sender: TObject);
    procedure BitBtnExportarProdutosXLSClick(Sender: TObject);
    procedure BitBtnExportarProdutosHTMLClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Pattern.Abstraction, Pattern.RefinedAbstraction.Clientes, Pattern.RefinedAbstraction.Produtos,
  Pattern.ConcreteImplementorXLS, Pattern.ConcreteImplementorHTML;

{$R *.dfm}

procedure TfFormulario.BitBtnExportarClientesXLSClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorClientes.Create(TFormatoXLS.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.BitBtnExportarClientesHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorClientes.Create(TFormatoHTML.Create);
  try
    Exportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  CaminhoAplicacao: string;
begin
  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(CaminhoAplicacao + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(CaminhoAplicacao + 'Produtos.xml');
end;

procedure TfFormulario.BitBtnExportarProdutosXLSClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorProdutos.Create(TFormatoXLS.Create);
  try
    Exportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    Exportador := nil;
  end;
end;

procedure TfFormulario.BitBtnExportarProdutosHTMLClick(Sender: TObject);
var
  Exportador: IExportador;
begin
  Exportador := TExportadorProdutos.Create(TFormatoHTML.Create);
  try
    Exportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    Exportador := nil;
  end;
end;

end.
