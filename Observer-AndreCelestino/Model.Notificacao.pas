unit Model.Notificacao;

interface

type
  { record para ser utilizado como transporte de dados }
  TNotificacao = record
    Operacao: string;
    Categoria: string;
    Valor: real;
  end;

implementation

end.
