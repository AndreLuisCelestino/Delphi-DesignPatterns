unit View.Formulario;

{
  Exemplo de Visitor com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Generics.Collections, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.ComCtrls, Vcl.ExtCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.ObjectScope, Pattern.ConcreteElement;

type
  { Client }
  TfFormulario = class(TForm)
    AdapterBindSource: TAdapterBindSource;
    Bevel: TBevel;
    BindingsList: TBindingsList;
    BitBtnAdicionar: TBitBtn;
    BitBtnSalario: TBitBtn;
    BitBtnSenioridade: TBitBtn;
    ComboBoxFuncao: TComboBox;
    DateTimePickerAdmissao: TDateTimePicker;
    EditNome: TEdit;
    EditSalario: TEdit;
    LabelAdmissao: TLabel;
    LabelFuncao: TLabel;
    LabelNome: TLabel;
    LabelSalario: TLabel;
    LinkGridToDataSourceAdapterBindSource: TLinkGridToDataSource;
    Panel: TPanel;
    PanelBotoes: TPanel;
    StringGrid: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSalarioClick(Sender: TObject);
    procedure BitBtnSenioridadeClick(Sender: TObject);
    procedure BitBtnAdicionarClick(Sender: TObject);
    procedure AdapterBindSourceCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Object Structure }
    FObjectStructure: TObjectList<TFuncionario>;

    procedure PreencherDadosFictícios;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Pattern.Visitor, Pattern.ConcreteVisitor.Salario, Pattern.ConcreteVisitor.Senioridade,
  Pattern.Element, Pattern.ConcreteElement.Programador, Pattern.ConcreteElement.Gerente;

{$R *.dfm}

procedure TfFormulario.AdapterBindSourceCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Cria o adaptador para usar o LiveBindings na TStringGrid com o Object Structure
  ABindSourceAdapter := TListBindSourceAdapter<TFuncionario>.Create(Self, FObjectStructure);
end;

procedure TfFormulario.BitBtnSalarioClick(Sender: TObject);
var
  Visitor: IVisitor;
  Element: TFuncionario;
begin
  // Cria uma instância do Concrete Visitor referente ao aumento de salário
  Visitor := TSalario.Create;

  // Chama o método Accept para executar a operação em cada elemento da Object Structure
  for Element in FObjectStructure do
  begin
    Element.Accept(Visitor);
  end;

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfFormulario.BitBtnSenioridadeClick(Sender: TObject);
var
  Visitor: IVisitor;
  Element: TFuncionario;
begin
  // Cria uma instância do Concrete Visitor referente à definição da senioridade
  Visitor := TSenioridade.Create;

  // Chama o método Accept para executar a operação em cada elemento da Object Structure
  for Element in FObjectStructure do
  begin
    Element.Accept(Visitor);
  end;

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfFormulario.BitBtnAdicionarClick(Sender: TObject);
var
  Element: TFuncionario;
begin
  Element := nil;
  // Cria o Concrete Element (Programador ou Gerente) conforme seleção na TComboBox
  case ComboBoxFuncao.ItemIndex of
    0: Element := TProgramador.Create;
    1: Element := TGerente.Create;
  end;

  // Preenche os dados do objeto
  Element.Nome := EditNome.Text;
  Element.Funcao := ComboBoxFuncao.Text;
  Element.Admissao := DateTimePickerAdmissao.Date;
  Element.Salario := StrToFloatDef(EditSalario.Text, 0);

  // Adiciona na Object Structure (lista de objetos)
  FObjectStructure.Add(Element);

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
var
  Adapter: TListBindSourceAdapter<TFuncionario>;
begin
  // Cria a instância do Object Structure
  FObjectStructure := TObjectList<TFuncionario>.Create;

  // Descomentar a linha abaixo para trabalhar com dados de exemplo
  //PreencherDadosFictícios;

  // Configura o LiveBindings para trabalhar com o Object Structure
  Adapter := TListBindSourceAdapter<TFuncionario>(AdapterBindSource.InternalAdapter);
  Adapter.SetList(FObjectStructure);
  Adapter.Active := True;
end;

procedure TfFormulario.PreencherDadosFictícios;
var
  Funcionario: tfuncionario;
begin
  Funcionario := TProgramador.Create;
  Funcionario.Nome := 'Anthony Kiedis';
  Funcionario.Funcao := 'Programador';
  Funcionario.Admissao := StrToDate('10/11/2010');
  Funcionario.Salario := 3180.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TProgramador.Create;
  Funcionario.Nome := 'Saul Hudson';
  Funcionario.Funcao := 'Programador';
  Funcionario.Admissao := StrToDate('28/05/2015');
  Funcionario.Salario := 2420.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TGerente.Create;
  Funcionario.Nome := 'Kirk Hammett';
  Funcionario.Funcao := 'Gerente';
  Funcionario.Admissao := StrToDate('06/04/2013');
  Funcionario.Salario := 4390.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TProgramador.Create;
  Funcionario.Nome := 'Steven Tyler';
  Funcionario.Funcao := 'Programador';
  Funcionario.Admissao := StrToDate('08/08/2012');
  Funcionario.Salario := 3630.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TGerente.Create;
  Funcionario.Nome := 'Anette Olzon';
  Funcionario.Funcao := 'Gerente';
  Funcionario.Admissao := StrToDate('27/01/2014');
  Funcionario.Salario := 4150.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TGerente.Create;
  Funcionario.Nome := 'Paul Stanley';
  Funcionario.Funcao := 'Gerente';
  Funcionario.Admissao := StrToDate('14/04/2011');
  Funcionario.Salario := 4660.00;
  FObjectStructure.Add(Funcionario);

  Funcionario := TProgramador.Create;
  Funcionario.Nome := 'Rob Thomas';
  Funcionario.Funcao := 'Programador';
  Funcionario.Admissao := StrToDate('04/07/2016');
  Funcionario.Salario := 2270.00;
  FObjectStructure.Add(Funcionario);
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
