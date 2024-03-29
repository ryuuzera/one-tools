program OneTools;

uses
  Vcl.Forms,
  OneTools.Main.View in '..\View\OneTools.Main.View.pas' {frmMain},
  OneTools.Styles.Constants.View in '..\View\Styles\OneTools.Styles.Constants.View.pas',
  OneTools.Main.Controller in '..\Controller\OneTools.Main.Controller.pas',
  OneTools.Helpers.Panel.Controller in '..\Controller\Helpers\OneTools.Helpers.Panel.Controller.pas',
  OneTools.Main.Model in '..\Model\OneTools.Main.Model.pas' {dmMain: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  Vcl.Controls,
  OneTools.Forms.Controller in '..\Controller\OneTools.Forms.Controller.pas',
  OneTools.Forms.FormBase1.View in '..\View\FormBase\OneTools.Forms.FormBase1.View.pas' {frmBase1},
  OneTools.DialogBox.View in '..\View\OneTools.DialogBox.View.pas' {MessageBox},
  OneTools.Privacy.Controller in '..\Controller\Private\OneTools.Privacy.Controller.pas',
  JSONDoc in '..\View\JSONDoc.pas',
  JSONTreeView in '..\View\JSONTreeView.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
