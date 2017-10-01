unit Pattern.Subsystem.Historico;

interface

type
  { Subsystem }
  TSubsystemHistorico = class
  public
    procedure RegistrarHistoricoDoCalculo(const Fidelidade: integer;
      const Dolar, Preco, ValorVenda: real);
  end;

implementation

uses
  SysUtils;

{ TSubsystemHistorico }

procedure TSubsystemHistorico.RegistrarHistoricoDoCalculo(const Fidelidade: integer;
  const Dolar, Preco, ValorVenda: real);
var
  Arquivo: TextFile;
  PathArquivo: string;
  Desconto: string;
begin
  // obtém o caminho e nome do arquivo de histórico
  PathArquivo := ExtractFilePath(ParamStr(0)) + 'Historico.txt';

  // associa a variável "Arquivo" com o arquivo "Historico.txt"
  AssignFile(Arquivo, PathArquivo);

  if FileExists(PathArquivo) then
    // se o arquivo já existe, coloca-o em modo de edição
    Append(Arquivo)
  else
    // caso contrário, cria o arquivo
    Rewrite(Arquivo);

  // obtém a descrição do desconto conforme fidelidade
  case Fidelidade of
    0: Desconto := 'Desconto de 2%';
    1: Desconto := 'Desconto de 6%';
    2: Desconto := 'Desconto de 10%';
    3: Desconto := 'Desconto de 18%';
  end;

  // escreve os dados no arquivo "Historico.txt"
  WriteLn(Arquivo, 'Data/Hora.........: ' + FormatDateTime('dd/mm/yyyy - hh:nn:ss', Now));
  WriteLn(Arquivo, 'Cotação do Dólar..: ' + FormatFloat('###,###,##0.00', Dolar));
  WriteLn(Arquivo, 'Conversão em R$...: ' + FormatFloat('###,###,##0.00', Dolar * Preco));
  WriteLn(Arquivo, 'Fidelidade........: ' + Desconto);
  WriteLn(Arquivo, 'Margem de venda...: 35%');
  WriteLn(Arquivo, 'Preço final.......: ' + FormatFloat('###,###,##0.00', ValorVenda));
  WriteLn(Arquivo, EmptyStr);

  // fecha o arquivo
  CloseFile(Arquivo);
end;

end.