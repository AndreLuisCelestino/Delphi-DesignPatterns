unit Pattern.ConcreteFlyweight;

interface

uses
  Classes, ExtCtrls, Pattern.Flyweight, PNGImage;

type
  { Concrete Flyweight - classe base }
  TCartao = class(TInterfacedObject, ICartao)
  protected
    PNGArquivo: TPNGImage;
    Mensagem: TStringList;
    FCaminhoImagens: string;
    FNomeLeitor: string;

    procedure SetNomeLeitor(const NomeLeitor: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Exportar;
    property NomeLeitor: string write SetNomeLeitor;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoEspanha = class(TCartao)
  public
    constructor Create;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoEUA = class(TCartao)
  public
    constructor Create;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoBrasil = class(TCartao)
    constructor Create;
  end;

  { Concrete Flyweight - classe herdada }  
  TCartaoItalia = class(TCartao)
    constructor Create;
  end;

implementation

uses
  SysUtils, Graphics;

{ TCartao }

constructor TCartao.Create;
begin
  // cria o objeto da classe TStringList para armazenar a mensagem do cartão
  Mensagem := TStringList.Create;

  // cria o objeto da classe TPNGObject para exportar o arquivo
  PNGArquivo := TPNGImage.Create;
  PNGArquivo.Canvas.Font.Name := 'Verdana';
  PNGArquivo.Canvas.Font.Size := 11;
  PNGArquivo.Canvas.Font.Style := [fsBold];

  // armazena o caminho da pasta de exportações
  FCaminhoImagens := Format('%s\cartoes\', [ExtractFilePath(ParamStr(0))]);
end;

destructor TCartao.Destroy;
begin
  // libera os objetos da memória
  FreeAndNil(Mensagem);
  FreeAndNil(PNGArquivo);

  inherited;
end;

procedure TCartao.Exportar;
begin
  // escreve o texto por cima da imagem
  PNGArquivo.Canvas.TextOut(5, 10, StringReplace(Mensagem[0], '%nome%', FNomeLeitor, []));
  PNGArquivo.Canvas.TextOut(5, 70, Mensagem[1]);
  PNGArquivo.Canvas.TextOut(5, 95, Mensagem[2]);
  PNGArquivo.Canvas.TextOut(5, 120, Mensagem[3]);

  // salva o arquivo
  PNGArquivo.SaveToFile(Format('%s\Cartao - %s.png', [FCaminhoImagens, FNomeLeitor]));
end;

procedure TCartao.SetNomeLeitor(const NomeLeitor: string);
begin
  // armazena o nome do leitor para concatenar no nome do arquivo
  FNomeLeitor := NomeLeitor;
end;

{ TCartaoEspanha }

constructor TCartaoEspanha.Create;
begin
  inherited;

  // carrega a imagem da bandeira da Espanha
  PNGArquivo.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'imagens\Espanha.png');

  // preenche a mensagem em espanhol
  Mensagem.Add('Hola, %nome%!');
  Mensagem.Add('Feliz Año Nuevo!');
  Mensagem.Add('Siempre visite el blog');
  Mensagem.Add('para leer los nuevos artículos! :)');
end;

{ TCartaoBrasil }

constructor TCartaoBrasil.Create;
begin
  inherited;

  // carrega a imagem da bandeira do Brasil
  PNGArquivo.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'imagens\Brasil.png');

  // preenche a mensagem em português
  Mensagem.Add('Olá, %nome%!');
  Mensagem.Add('Feliz Ano Novo!');
  Mensagem.Add('Sempre visite o blog');
  Mensagem.Add('para ler os novos artigos! :)');
end;

{ TCartaoEUA }

constructor TCartaoEUA.Create;
begin
  inherited;

  // carrega a imagem da bandeira dos EUA
  PNGArquivo.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'imagens\EUA.png');

  // preenche a mensagem em inglês
  Mensagem.Add('Hello, %nome%!');
  Mensagem.Add('Happy New Year!');
  Mensagem.Add('Remember to always visit the blog');
  Mensagem.Add('to check out the newest posts! :)');
end;

{ TCartaoItalia }

constructor TCartaoItalia.Create;
begin
  inherited;

  // carrega a imagem da bandeira da Itália
  PNGArquivo.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'imagens\Italia.png');

  // preenche a mensagem em italiano
  Mensagem.Add('Ciao, %nome%!');
  Mensagem.Add('Felice Anno Nuovo!');
  Mensagem.Add('Sempre visitare il blog');
  Mensagem.Add('per leggere i nuovi articoli! :)');
end;

end.
