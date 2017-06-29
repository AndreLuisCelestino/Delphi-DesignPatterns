unit View.CadastroMembro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TfCadastroMembro = class(TForm)
    Bevel: TBevel;
    BitBtnCancelar: TBitBtn;
    BitBtnOK: TBitBtn;
    ComboBoxPerfil: TComboBox;
    EditNome: TEdit;
    LabelNome: TLabel;
    LabelPerfil: TLabel;
    procedure BitBtnOKClick(Sender: TObject);
  end;

var
  fCadastroMembro: TfCadastroMembro;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfCadastroMembro.BitBtnOKClick(Sender: TObject);
begin
  if Trim(EditNome.Text).IsEmpty then
  begin
    MessageDlg('Digite o nome do membro.', mtWarning, [mbOK], 0);
    EditNome.SetFocus;
    Exit;
  end;

  ModalResult := mrOK;
end;

end.
