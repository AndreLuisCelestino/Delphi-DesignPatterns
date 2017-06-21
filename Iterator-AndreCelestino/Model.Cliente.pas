unit Model.Cliente;

interface

type
  TCliente = class
  private
    FCodigo: integer;
    FNome: string;
    FEndereco: string;
    FPais: string;
    FEmail: string;
  public
    property Codigo: integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Endereco: string read FEndereco write FEndereco;
    property Pais: string read FPais write FPais;
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
