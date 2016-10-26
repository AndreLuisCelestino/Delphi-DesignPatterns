unit uTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, Grids, DBGrids, StdCtrls, Buttons;

type
  TfTela = class(TForm)
    DBGrid: TDBGrid;
    dsProdutos: TDataSource;
    mmDadosCesta: TMemo;
    lbTipoCesta: TLabel;
    cbTipoCestas: TComboBox;
    btnMontarCesta: TBitBtn;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnMontarCestaClick(Sender: TObject);
  private
    procedure CarregarProdutos;
  end;

var
  fTela: TfTela;

implementation

uses
  uDataModulo, uInterfaces, uBuilder;

{$R *.dfm}

procedure TfTela.CarregarProdutos;
var
  sCaminho: string;
begin
  sCaminho := ExtractFilePath(Application.ExeName);
  dmProdutos.cdsProdutos.LoadFromFile(sCaminho + 'Produtos.xml');
end;

procedure TfTela.FormCreate(Sender: TObject);
begin
  CarregarProdutos;
end;

procedure TfTela.btnMontarCestaClick(Sender: TObject);
var
  Builder: ICestaBuilder;
  Cesta: ICestaProdutos;
begin
  if cbTipoCestas.ItemIndex < 0 then
  begin
    MessageDlg('Selecione um tipo de cesta.', mtWarning, [mbOK], 0);
    cbTipoCestas.SetFocus;
    Exit;
  end;

  mmDadosCesta.Clear;

  // cria o construtor (builder) e solicita a "construção" do produto
  Builder := TCestaBuilder.Create;
  case cbTipoCestas.ItemIndex of
    0: Cesta := Builder.MontarCestaBasica;
    1: Cesta := Builder.MontarCestaCompleta;
    2: Cesta := Builder.MontarCestaEspecial;
  end;

  // exibe a lista de produtos da cesta
  mmDadosCesta.Lines.Add(Cesta.ObterListaProdutos);

  // exibe o valor total da cesta
  mmDadosCesta.Lines.Add(Cesta.ObterValorTotalCesta);
end;

end.
