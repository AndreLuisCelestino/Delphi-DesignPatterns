unit Pattern.Product;

interface

uses
  System.Classes;

type
  { Product }
  TProduct = class
  private
    // Objeto que armazenará o conteúdo HTML
    FConteudoHTML: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // Concatena o conteúdo HTML ao objeto "FConteudoHTML"
    procedure Adicionar(const Texto: string);

    // Abre uma caixa de diálogo para salvar o arquivo HTML
    procedure SalvarArquivo;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TProduct }

procedure TProduct.Adicionar(const Texto: string);
begin
  FConteudoHTML.Add(Texto);
end;

constructor TProduct.Create;
begin
  FConteudoHTML := TStringList.Create;
end;

destructor TProduct.Destroy;
begin
  FreeAndNil(FConteudoHTML);
  inherited;
end;

procedure TProduct.SalvarArquivo;
var
  SaveDialog: TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.DefaultExt := 'html';
    SaveDialog.InitialDir := GetCurrentDir;

    if not SaveDialog.Execute then
      Exit;

    FConteudoHTML.SaveToFile(SaveDialog.FileName, TEncoding.UTF8);
  finally
    FreeAndNil(SaveDialog);
  end;
end;

end.
