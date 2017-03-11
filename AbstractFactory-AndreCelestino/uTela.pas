unit uTela;

{
  Exemplo de Abstract Factory com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uInterfaces;

type
  TfAbstractFactory = class(TForm)
    gbDadosNotebook: TGroupBox;
    GroupBoxMarcas: TRadioGroup;
    edtNomeNotebook: TEdit;
    edtTela: TEdit;
    edtMemoriaRAM: TEdit;
    lbNomeNotebook: TLabel;
    lbTela: TLabel;
    lbMemoriaRAM: TLabel;
    gbDadosDesktop: TGroupBox;
    lbNomeDesktop: TLabel;
    lbProcessador: TLabel;
    lbHD: TLabel;
    edtNomeDesktop: TEdit;
    edtProcessador: TEdit;
    edtHD: TEdit;
    procedure GroupBoxMarcasClick(Sender: TObject);
  private
    Marca: IFactoryMarca;

    procedure MostrarDadosProdutos;
    procedure CriarInstanciaMarca;
  end;

var
  fAbstractFactory: TfAbstractFactory;

implementation

uses
  uMarcas;

const
  nOPCAO_DELL = 0;
  nOPCAO_APPLE = 1;
  nOPCAO_LENOVO = 2;

{$R *.dfm}

procedure TfAbstractFactory.CriarInstanciaMarca;
begin
  // Única estrutura condicional da aplicação
  case GroupBoxMarcas.ItemIndex of
    nOPCAO_DELL: Marca := TDell.Create;
    nOPCAO_APPLE: Marca := TApple.Create;
    nOPCAO_LENOVO: Marca := TLenovo.Create;
  end;
end;

procedure TfAbstractFactory.GroupBoxMarcasClick(Sender: TObject);
begin
  CriarInstanciaMarca;
  MostrarDadosProdutos;
end;

procedure TfAbstractFactory.MostrarDadosProdutos;
var
  Notebook: INotebook;
  Desktop: IDesktop;
begin
  Notebook := Marca.ConsultarNotebook;
  Desktop := Marca.ConsultarDesktop;

  edtNomeNotebook.Text := Notebook.BuscarNome;
  edtTela.Text := Notebook.BuscarTamanhoTela;
  edtMemoriaRAM.Text := Notebook.BuscarMemoriaRAM;

  edtNomeDesktop.Text := Desktop.BuscarNome;
  edtProcessador.Text := Desktop.BuscarNomeProcessador;
  edtHD.Text := Desktop.BuscarTamanhoHD;
end;

end.
