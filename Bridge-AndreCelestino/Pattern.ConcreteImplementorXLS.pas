unit Pattern.ConcreteImplementorXLS;

interface

uses
  ExcelXP, Pattern.Implementor;

type
  { Concrete Implementor }
  TFormatoXLS = class(TInterfacedObject, IFormato)
  private
    Linha: integer;
    Coluna: integer;
    Excel: TExcelApplication;

    procedure CriarAplicacaoExcel;
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure PularLinha;
    procedure DesenharCabecalho(const Titulo: string);
    procedure ExportarCampo(const Valor: string);
    procedure SalvarArquivo(const NomeArquivo: string);
  end;

implementation

uses
  SysUtils, Windows, Variants, Forms;

{ TFormatoXLS }

constructor TFormatoXLS.Create;
begin
  CriarAplicacaoExcel;

  Linha := 1;
  Coluna := 1;
end;

procedure TFormatoXLS.CriarAplicacaoExcel;
begin
  Excel := TExcelApplication.Create(nil);
  Excel.Connect;
  Excel.WorkBooks.Add(xlWBATWorksheet, 0);
  Excel.Visible[0] := True;
end;

procedure TFormatoXLS.DesenharCabecalho(const Titulo: string);
var
  Celula: string;
begin
  Celula:= Chr(64 + Coluna) + IntToStr(Linha);
  Excel.Range[Celula, Celula].Font.Bold := True;
  Excel.Range[Celula, Celula].Value2 := Titulo;
  Inc(Coluna);
end;

destructor TFormatoXLS.Destroy;
begin
  Excel.Disconnect;
  FreeAndNil(Excel);

  inherited;
end;

procedure TFormatoXLS.ExportarCampo(const Valor: string);
var
  Celula: string;
begin
  Celula:= Chr(64 + Coluna) + IntToStr(Linha);
  Excel.Range[Celula, Celula].Value2 := Valor;
  Inc(Coluna);
end;

procedure TFormatoXLS.PularLinha;
begin
  Inc(Linha);
  Coluna := 1;
  Excel.Columns.AutoFit;
end;

procedure TFormatoXLS.SalvarArquivo(const NomeArquivo: string);
var
  CaminhoAplicacao: string;
  NomeCompleto: string;
begin
  CaminhoAplicacao := ExtractFilePath(Application.ExeName);
  NomeCompleto := Format('%s%s.xls', [CaminhoAplicacao, NomeArquivo]);
  DeleteFile(PWideChar(NomeArquivo));

  Excel.ActiveWorkbook.SaveAs(NomeCompleto,
      xlNormal, EmptyStr, EmptyStr, False, False, xlNoChange,
      xlUserResolution, False, EmptyParam, EmptyParam, 0, 0);
end;

end.
