unit View.Formulario;

{
  Exemplo de Builder com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  { Client }
  TForm1 = class(TForm)
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    ClientDataSet: TClientDataSet;
    BitBtn1: TBitBtn;
    Bevel: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  Pattern.Director, Pattern.Builder, Pattern.ConcreteBuilder, Pattern.Product;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  Director: TDirector;
  ConcreteBuilder: IBuilder;
  Product: TProduct;
begin
  // Cria uma instância do Director
  Director := TDirector.Create;

  // Cria uma instância do Concrete Builder, informando os dados como parâmetro
  ConcreteBuilder := TConcreteBuilder.Create(ClientDataSet.Data);
  try
    // Solicita a construção do objeto ao Director
    Director.Construct(ConcreteBuilder);

    // Recebe o produto pronto ("constrúido")
    Product := ConcreteBuilder.GetRelatorio;

    // Chama o método para salvar o arquivo em disco
    Product.SalvarArquivo;
  finally
    // Libera o Director da memória
    FreeAndNil(Director);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Carrega o arquivo "vendors.xml" que está na pasta do executável
  ClientDataSet.LoadFromFile(GetCurrentDir + '\vendors.xml');
end;

end.
