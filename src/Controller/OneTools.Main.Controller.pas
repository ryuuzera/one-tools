unit OneTools.Main.Controller;

interface

uses
  Vcl.WinXCtrls, System.Classes, Vcl.Forms, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Controls;

type
   TMainController = class
    private
       procedure SetCursor( AForm: TForm);
       procedure SetEvents(AForm: TForm);
       procedure EsconderTabs(PageControl: TPageControl);
    public
       procedure ControlaSplitView(var ASplitView: TSplitView);
       procedure OnCreate(AForm: TForm);
   end;

procedure SetMouseMove(Component: TObject);
procedure SetMouseLeave(Component: TObject);
procedure ControlaNav(Nav: TShape; Sender: TObject; PageControl: TPageControl; Page: Integer);
function GeraSQLtoDelphi(AComponenteSQL: String; ATexto: TStrings; State: TToggleSwitchState): String;
procedure ValidarCampoVazio(Condicao: Boolean; AMensagem: String; AFoco: TWinControl);

implementation

uses
  OneTools.Main.View,
  OneTools.Styles.Constants.View, Vcl.StdCtrls, System.SysUtils, Vcl.Dialogs, OneTools.DialogBox.View;

{ TMainController }

procedure TMainController.ControlaSplitView(var ASplitView: TSplitView);
begin
   if ASplitView.Opened then
      ASplitView.Close
   else
      ASplitView.Open;
end;

procedure TMainController.EsconderTabs(PageControl: TPageControl);
var
  I: Integer;
begin
   for I := 0 to Pred(PageControl.PageCount) do
      PageControl.Pages[I].TabVisible := False;
end;

procedure TMainController.OnCreate(AForm: TForm);
begin
   SetCursor(AForm);
   SetEvents(AForm);
   EsconderTabs(FrmMain.PageControl1);
end;

procedure SetMouseLeave(Component: TObject);
begin
   if Component is TPanel then
   begin
      if TPanel(Component).Tag = 22 then
         TPanel(Component).Color := BUTTON_ORANGE
      else
         TPanel(Component).Color := BUTTON_COLOR
   end
   else if Component is TLabel then
      TPanel(TLabel(TComponent(Component)).Parent).Color := BUTTON_COLOR
   else if Component is TImage then
   begin
      if TImage(Component).Tag = 21  then
        TPanel(TImage(TComponent(Component)).Parent).Color := TOP_BAR;
   end;
end;

procedure SetMouseMove(Component: TObject);
begin
   if Component is TPanel then
   begin
      if TPanel(Component).Tag = 22 then
         TPanel(Component).Color := BUTTON_ORANGE_HOVER
      else
         TPanel(Component).Color := BUTTON_COLOR_HOVER
   end
   else if Component is TLabel then
      TPanel(TLabel(TComponent(Component)).Parent).Color := BUTTON_COLOR_HOVER
   else if Component is TImage then
   begin
      if TImage(Component).Tag = 21 then
        TPanel(TImage(TComponent(Component)).Parent).Color := TOP_BAR_HOVER;
   end;
end;

procedure TMainController.SetCursor(AForm: TForm);
var
   I: Integer;
begin
   for I := 0 to Pred(AForm.ComponentCount) do
   begin
      if TForm(AForm.Components[i]).Tag in [10, 20, 21, 22] then
        TWinControl(Aform.Components[i]).Cursor := crHandPoint;
   end;
end;

procedure TMainController.SetEvents(AForm: TForm);
var
  I, Index: Integer;
begin
   for I := 0 to Pred(AForm.ComponentCount) do
   begin
     if (AForm.Components[i].Name = 'PNEvents') then
         Index := I;
   end;

   for I := 0 to Pred(AForm.ComponentCount) do
   begin
      if (AForm.Components[i].Tag = 20) or (AForm.Components[i].Tag = 21) then
      begin
        if AForm.Components[i] is TPanel then
        begin
           TPanel(AForm.Components[i]).Color := BUTTON_COLOR;
           TPanel(AForm.Components[i]).OnMouseEnter := TPanel(AForm.Components[index]).OnMouseEnter;
           TPanel(AForm.Components[i]).OnMouseLeave := TPanel(AForm.Components[index]).OnMouseLeave;
        end;
        if AForm.Components[i] is TLabel then
        begin
           TLabel(AForm.Components[i]).OnMouseEnter := TPanel(AForm.Components[index]).OnMouseEnter;
           TLabel(AForm.Components[i]).OnMouseLeave := TPanel(AForm.Components[index]).OnMouseLeave;
        end;
        if (AForm.Components[i] is TImage) and (AForm.Components[i].Tag = 21) then
        begin
           TImage(AForm.Components[i]).OnMouseEnter := TPanel(AForm.Components[index]).OnMouseEnter;
           TImage(AForm.Components[i]).OnMouseLeave := TPanel(AForm.Components[index]).OnMouseLeave;
        end;

      end;
      if (AForm.Components[i].Tag = 22) then
      begin
        if AForm.Components[i] is TPanel then
        begin
           TPanel(AForm.Components[i]).Color := BUTTON_ORANGE;
           TPanel(AForm.Components[i]).OnMouseEnter := TPanel(AForm.Components[index]).OnMouseEnter;
           TPanel(AForm.Components[i]).OnMouseLeave := TPanel(AForm.Components[index]).OnMouseLeave;
        end;
      end;
   end;
end;

procedure ControlaNav(Nav: TShape; Sender: TObject; PageControl: TPageControl; Page: Integer);
begin
  if Sender is TPanel then
  begin
     Nav.Parent := TPanel(Sender);
     TPanel(Sender).Repaint;
  end
  else if Sender is TLabel then
  begin
    Nav.Parent := TPanel(TLabel(Sender).Parent);
    TPanel(TLabel(Sender).Parent).Repaint;
  end;
  PageControl.ActivePage := PageControl.Pages[Page];
end;

function GeraSQLtoDelphi(AComponenteSQL: String; ATexto: TStrings; State: TToggleSwitchState): String;
var
   I: Integer;
   LCodigo: TStringlist;
begin
   LCodigo := TStringlist.Create;
   try
      if State = tssOn then
      begin
         LCodigo.Add(AComponenteSQL+' := '+AComponenteSQL+'.Create(nil);');
         LCodigo.Add('try');
      end;

      for i := 0 to ATexto.Count -1 do
      begin
         with LCodigo do
         begin
            if State = tssOn then
               Add('   '+ AComponenteSQL + '.SQL.Add(' + QuotedStr(ATexto[i]) + ');')
            else
               Add(AComponenteSQL + '.SQL.Add(' + QuotedStr(ATexto[i]) + ');');
         end;
      end;

      if State = tssOn then
      begin
         LCodigo.Add('finally');
         LCodigo.Add('   '+AComponenteSQL+'.Free;');
         LCodigo.Add('end;');
      end;
      Result := LCodigo.Text;
   finally
      LCodigo.Free;
   end;
end;

procedure ValidarCampoVazio(Condicao: Boolean; AMensagem: String; AFoco: TWinControl);
begin
  if (Condicao) then
  begin
    //MessageDlg(AMensagem, mtInformation, [mbOK], 0);
    MessageBox := TMessageBox.Create(frmMain, AMensagem, mtInformation);
    AFoco.SetFocus;
    Abort;
  end;
end;

end.
