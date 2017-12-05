program ExemploBuilder;

uses
  Vcl.Forms,
  View.Formulario in 'View.Formulario.pas' {Form1},
  Pattern.Builder in 'Pattern.Builder.pas',
  Pattern.ConcreteBuilder in 'Pattern.ConcreteBuilder.pas',
  Pattern.Director in 'Pattern.Director.pas',
  Pattern.Product in 'Pattern.Product.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Exemplo de Builder - André Celestino';
  Application.CreateForm(TForm1, Form1);
  ReportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
