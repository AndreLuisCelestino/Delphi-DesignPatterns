unit uTela;

{
  Exemplo de Builder com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TfTela = class(TForm)
    DBGrid: TDBGrid;
    DataSourceProdutos: TDataSource;
    MemoDadosCesta: TMemo;
    LabelTipoCesta: TLabel;
    ComboBoxTipoCestas: TComboBox;
    BitBtnMontarCesta: TBitBtn;
    LabelProdutos: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnMontarCestaClick(Sender: TObject);
  private
    procedure CarregarProdutos;
  end;

var
  fTela: TfTela;

implementation

uses
  System.UITypes, uDataModulo, uInterfaces, uBuilder;

{$R *.dfm}

procedure TfTela.CarregarProdutos;
var
  Caminho: string;
begin
  Caminho := ExtractFilePath(Application.ExeName);
  DataModuleProdutos.ClientDataSetProdutos.LoadFromFile(Caminho + 'Produtos.xml');
end;

procedure TfTela.FormCreate(Sender: TObject);
begin
  CarregarProdutos;
end;

procedure TfTela.BitBtnMontarCestaClick(Sender: TObject);
var
  Builder: ICestaBuilder;
  Cesta: ICestaProdutos;
begin
  if ComboBoxTipoCestas.ItemIndex < 0 then
  begin
    MessageDlg('Selecione um tipo de cesta.', mtWarning, [mbOK], 0);
    ComboBoxTipoCestas.SetFocus;
    Exit;
  end;

  MemoDadosCesta.Clear;

  // cria o construtor (builder) e solicita a "construção" do produto
  Builder := TCestaBuilder.Create;
  case ComboBoxTipoCestas.ItemIndex of
    0: Cesta := Builder.MontarCestaBasica;
    1: Cesta := Builder.MontarCestaCompleta;
    2: Cesta := Builder.MontarCestaEspecial;
  end;

  // exibe a lista de produtos da cesta
  MemoDadosCesta.Lines.Add(Cesta.ObterListaProdutos);

  // exibe o valor total da cesta
  MemoDadosCesta.Lines.Add(Cesta.ObterValorTotalCesta);
end;

end.
