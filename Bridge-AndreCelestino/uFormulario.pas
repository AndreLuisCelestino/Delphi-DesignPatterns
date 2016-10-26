unit uFormulario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons;

type
  TfFormulario = class(TForm)
    ClientDataSetClientes: TClientDataSet;
    ClientDataSetProdutos: TClientDataSet;
    GridClientes: TDBGrid;
    GridProdutos: TDBGrid;
    btnExportarClientesXLS: TBitBtn;
    btnExportarClientesHTML: TBitBtn;
    btnExportarProdutosXLS: TBitBtn;
    btnExportarProdutosHTML: TBitBtn;
    DataSourceClientes: TDataSource;
    DataSourceProdutos: TDataSource;
    ClientDataSetClientesCodigo: TIntegerField;
    ClientDataSetClientesNome: TStringField;
    ClientDataSetClientesCidade: TStringField;
    ClientDataSetProdutosCodigo: TIntegerField;
    ClientDataSetProdutosDescricao: TStringField;
    ClientDataSetProdutosEstoque: TIntegerField;
    Bevel: TBevel;
    lbClientes: TLabel;
    lbProdutos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportarClientesXLSClick(Sender: TObject);
    procedure btnExportarClientesHTMLClick(Sender: TObject);
    procedure btnExportarProdutosXLSClick(Sender: TObject);
    procedure btnExportarProdutosHTMLClick(Sender: TObject);
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  uInterfaceExportador, uExportadorClientes, uExportadorProdutos, uFormatoXLS, uFormatoHTML;

{$R *.dfm}

procedure TfFormulario.btnExportarClientesXLSClick(Sender: TObject);
var
  oExportador: IExportador;
begin
  oExportador := TExportadorClientes.Create(TFormatoXLS.Create);
  try
    oExportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    oExportador := nil;
  end;
end;

procedure TfFormulario.btnExportarClientesHTMLClick(Sender: TObject);
var
  oExportador: IExportador;
begin
  oExportador := TExportadorClientes.Create(TFormatoHTML.Create);
  try
    oExportador.ExportarDados(ClientDataSetClientes.Data);
  finally
    oExportador := nil;
  end;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  sCaminhoAplicacao: string;
begin
  sCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  ClientDataSetClientes.LoadFromFile(sCaminhoAplicacao + 'Clientes.xml');
  ClientDataSetProdutos.LoadFromFile(sCaminhoAplicacao + 'Produtos.xml');
end;

procedure TfFormulario.btnExportarProdutosXLSClick(Sender: TObject);
var
  oExportador: IExportador;
begin
  oExportador := TExportadorProdutos.Create(TFormatoXLS.Create);
  try
    oExportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    oExportador := nil;
  end;
end;

procedure TfFormulario.btnExportarProdutosHTMLClick(Sender: TObject);
var
  oExportador: IExportador;
begin
  oExportador := TExportadorProdutos.Create(TFormatoHTML.Create);
  try
    oExportador.ExportarDados(ClientDataSetProdutos.Data);
  finally
    oExportador := nil;
  end;
end;

end.
