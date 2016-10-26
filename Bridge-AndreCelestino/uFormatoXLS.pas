unit uFormatoXLS;

interface

uses
  ExcelXP, uInterfaceFormato;

type
  { Concrete Implementor }
  TFormatoXLS = class(TInterfacedObject, IFormato)
  private
    FnLinha: integer;
    FnColuna: integer;
    FoExcel: TExcelApplication;

    procedure CriarAplicacaoExcel;
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure PularLinha;
    procedure DesenharCabecalho(const psTitulo: string);
    procedure ExportarCampo(const psValor: string);
    procedure SalvarArquivo(const psNomeArquivo: string);
  end;

implementation

uses
  SysUtils, Windows, Variants, Forms;

{ TFormatoXLS }

constructor TFormatoXLS.Create;
begin
  CriarAplicacaoExcel;

  FnLinha := 1;
  FnColuna := 1;
end;

procedure TFormatoXLS.CriarAplicacaoExcel;
begin
  FoExcel := TExcelApplication.Create(nil);
  FoExcel.Connect;
  FoExcel.WorkBooks.Add(xlWBATWorksheet, 0);
  FoExcel.Visible[0] := True;
end;

procedure TFormatoXLS.DesenharCabecalho(const psTitulo: string);
var
  sCelula: string;
begin
  sCelula:= Chr(64 + FnColuna) + IntToStr(FnLinha);
  FoExcel.Range[sCelula, sCelula].Font.Bold := True;
  FoExcel.Range[sCelula, sCelula].Value2 := psTitulo;
  Inc(FnColuna);
end;

destructor TFormatoXLS.Destroy;
begin
  FoExcel.Disconnect;
  FreeAndNil(FoExcel);
  
  inherited;
end;

procedure TFormatoXLS.ExportarCampo(const psValor: string);
var
  sCelula: string;
begin
  sCelula:= Chr(64 + FnColuna) + IntToStr(FnLinha);
  FoExcel.Range[sCelula, sCelula].Value2 := psValor;
  Inc(FnColuna);
end;

procedure TFormatoXLS.PularLinha;
begin
  Inc(FnLinha);
  FnColuna := 1;
  FoExcel.Columns.AutoFit;
end;

procedure TFormatoXLS.SalvarArquivo(const psNomeArquivo: string);
var
  sCaminhoAplicacao: string;
  sNomeArquivo: string;
begin
  sCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  sNomeArquivo := Format('%s%s.xls', [sCaminhoAplicacao, psNomeArquivo]);
  DeleteFile(PAnsiChar(sNomeArquivo));
  
  FoExcel.ActiveWorkbook.SaveAs(sNomeArquivo,
      xlNormal, EmptyStr, EmptyStr, False, False, xlNoChange,
      xlUserResolution, False, EmptyParam, EmptyParam, 0, 0);
end;

end.
