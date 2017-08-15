unit View.Formulario;

{
  Exemplo de State com Delphi
  Criado por André Luis Celestino: www.andrecelestino.com
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Pattern.Context, System.ImageList, Vcl.ImgList;

type
  TfFormulario = class(TForm)
    PanelCampos: TPanel;
    LabelDescricao: TLabel;
    DBGrid: TDBGrid;
    ClientDataSet: TClientDataSet;
    ClientDataSetDescricao: TStringField;
    ClientDataSetQtde: TIntegerField;
    EditDescricao: TEdit;
    LabelQtde: TLabel;
    EditQtde: TEdit;
    LabelValor: TLabel;
    EditValor: TEdit;
    ClientDataSetTotal: TFloatField;
    EditDesconto: TEdit;
    LabelDesconto: TLabel;
    LabelFrete: TLabel;
    EditFrete: TEdit;
    LabelTotal: TLabel;
    EditTotal: TEdit;
    Bevel: TBevel;
    BitBtnAdicionar: TBitBtn;
    DataSource: TDataSource;
    PanelCategoria: TPanel;
    LabelCategoria: TLabel;
    ImageList: TImageList;
    ClientDataSetValor: TFloatField;
    procedure ClientDataSetCalcFields(DataSet: TDataSet);
    procedure BitBtnAdicionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure EditValorKeyPress(Sender: TObject; var Key: Char);
  private
    FContext: TContext;

    procedure AdicionarItem;
    procedure RemoverItem;
    procedure AtualizarCategoria;
    procedure AtualizarCampos;
  end;

var
  fFormulario: TfFormulario;

implementation

uses
  Utils.Enumerated;

{$R *.dfm}

procedure TfFormulario.AdicionarItem;
begin
  // Adiciona os valores no TClientDataSet
  ClientDataSet.Append;
  ClientDataSet.FieldByName('Descricao').AsString := Trim(EditDescricao.Text);
  ClientDataSet.FieldByName('Qtde').AsFloat := StrToIntDef(EditQtde.Text, 0);
  ClientDataSet.FieldByName('Valor').AsFloat := StrToFloatDef(EditValor.Text, 0);
  ClientDataSet.Post;

  // Chama o método "AdicionarItem" do Context, que encaminhará a chamada ao estado atual
  FContext.AdicionarItem(ClientDataSet.FieldByName('Total').AsFloat);
end;

procedure TfFormulario.AtualizarCampos;
begin
  // Atualiza os campos da tela com os valores obtidos do estado atual
  EditDesconto.Text := FormatFloat('###,##0.00', FContext.ObterValorDesconto);
  EditFrete.Text := FormatFloat('###,##0.00', FContext.ObterValorFrete);
  EditTotal.Text := FormatFloat('###,##0.00',
    FContext.ObterTotalPedido - FContext.ObterValorDesconto + FContext.ObterValorFrete);

  EditDescricao.Clear;
  EditQtde.Clear;
  EditValor.Clear;
  EditDescricao.SetFocus;
end;

procedure TfFormulario.AtualizarCategoria;
begin
  // Método para atribuir a descrição e cor da catagoria no componente TPanel

  case FContext.ObterCategoriaPedido of

    cpBronze:
    begin
      PanelCategoria.Caption := 'Bronze';
      PanelCategoria.Font.Color := clGreen;
    end;

    cpPrata:
    begin
      PanelCategoria.Caption := 'Prata';
      PanelCategoria.Font.Color := clOlive;
    end;

    cpOuro:
    begin
      PanelCategoria.Caption := 'Ouro';
      PanelCategoria.Font.Color := clBlue;
    end;

  end;
end;

procedure TfFormulario.BitBtnAdicionarClick(Sender: TObject);
begin
  AdicionarItem;
  AtualizarCategoria;
  AtualizarCampos;
end;

procedure TfFormulario.ClientDataSetCalcFields(DataSet: TDataSet);
begin
  // Campo calculado para armazenar o total do item (Qtde x Valor Unitário)
  ClientDataSet.FieldByName('Total').AsFloat :=
    ClientDataSet.FieldByName('Qtde').AsInteger * ClientDataSet.FieldByName('Valor').AsFloat;
end;

procedure TfFormulario.DBGridCellClick(Column: TColumn);
begin
  // Caso o usuário clique na célula da coluna "Remover", exclui o item
  if UpperCase(Column.FieldName) = 'REMOVER' then
  begin
    RemoverItem;
    AtualizarCategoria;
    AtualizarCampos;
  end;
end;

procedure TfFormulario.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  // Desenha a imagem na coluna "Remover" da Grid
  if UpperCase(Column.FieldName) = 'REMOVER' then
  begin
    DBGrid.Canvas.FillRect(Rect);
    ImageList.Draw(DBGrid.Canvas, Rect.Left + 24, Rect.Top + 1, 0);
  end;
end;

procedure TfFormulario.EditValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9', #8, #44])) then
    Key := #0;
end;

procedure TfFormulario.FormCreate(Sender: TObject);
begin
  // Cria o Context
  FContext := TContext.Create;
end;

procedure TfFormulario.FormDestroy(Sender: TObject);
begin
  // Destrói o Context
  FContext.Destroy;
end;

procedure TfFormulario.RemoverItem;
begin
  if ClientDataSet.IsEmpty then
    Exit;

  // Chama o método "RemoverItem" do Context, que encaminhará a chamada ao estado atual
  FContext.RemoverItem(ClientDataSet.FieldByName('Total').AsFloat);

  ClientDataSet.Delete;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
