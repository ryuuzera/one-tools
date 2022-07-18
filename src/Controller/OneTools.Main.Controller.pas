unit OneTools.Main.Controller;

interface

uses
  Vcl.WinXCtrls, System.Classes, Vcl.Forms, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Graphics, OneTools.Main.Model;

type
   TMainController = class
    private
       procedure SetCursor( AForm: TForm);
       procedure SetEvents(AForm: TForm);
       procedure EsconderTabs(PageControl: TPageControl);
    public
       procedure ControlaSplitView(var ASplitView: TSplitView);
       procedure IndentarTexto(RichEdit: TRichEdit; Limit: Integer);
       procedure DebugarString(RichEdit: TRichEdit);
       function Criptografar(ATexto: String): String;
       function Descriptografar(ATexto: String): String;
       procedure OnCreate(AForm: TForm);
       procedure ControlaJSONViewer;
   end;

procedure SetMouseMove(Component: TObject);
procedure SetMouseLeave(Component: TObject);
procedure ControlaNav(Nav: TShape; Sender: TObject; PageControl: TPageControl; Page: Integer);
procedure GeraSQLtoDelphi(RE: TRichEdit; AComponenteSQL: String; ATexto: TStrings; State: TToggleSwitchState;
      EliminaEspacos: Boolean = False);
procedure ValidarCampoVazio(Condicao: Boolean; AMensagem: String; AFoco: TWinControl);
procedure Color_Words(RE: TRichEdit; const AWord: string; AOptions: TSearchTypes; Color: TColor);


implementation

uses
  OneTools.Main.View,
  OneTools.Styles.Constants.View, Vcl.StdCtrls, System.SysUtils, Vcl.Dialogs, OneTools.DialogBox.View,
  OneTools.Privacy.Controller, Winapi.Messages;

{ TMainController }

procedure TMainController.ControlaJSONViewer;
begin
   if (frmMain.PC_JSON.ActivePageIndex = 0) then
   begin
      frmMain.pnJSONVisualizacao.BevelOuter := bvLowered;
      frmMain.pnJSONText.BevelOuter := bvNone;
   end
   else
   begin
      frmMain.pnJSONVisualizacao.BevelOuter := bvNone;
      frmMain.pnJSONText.BevelOuter := bvLowered;
   end;

   dmMain.JSONDocument.JSONText := frmMain.reJSONView.Text;
   frmMain.JSONTree.LoadJson;
//   ControlaNav(nil, Sender, frmMain.PC_JSON, 0);
end;

procedure TMainController.ControlaSplitView(var ASplitView: TSplitView);
begin
   if ASplitView.Opened then
      ASplitView.Close
   else
      ASplitView.Open;
end;

function TMainController.Criptografar(ATexto: String): String;
var
   iKeyLen : Integer;
   iKeyPos : Integer;
   iOffSet : Integer;
   sDest   : string;
   iPos    : Integer;
   iAsc    : Integer;
begin
   Result := '';
   if Trim(ATexto) <> '' then
   begin
      iKeyLen := Length(CHAVE);
      iKeyPos := 0;

      Randomize;
      iOffSet := Random(256);
      sDest   := Format('%1.2x',[iOffSet]);

      for iPos := 1 to Length(ATexto) do
      begin
         iAsc := (Ord(ATexto[iPos]) + iOffSet) mod 255;
         if iKeyPos < iKeyLen then
            iKeyPos := iKeyPos + 1
         else
            iKeyPos := 1;

         iAsc    := iAsc xor Ord(CHAVE[iKeyPos]);
         sDest   := sDest + Format('%1.2x',[iAsc]);
         iOffSet := iAsc;
      end;
      Result := sDest;
   end;
end;

procedure TMainController.DebugarString(RichEdit: TRichEdit);
begin
   RichEdit.Lines.Text := StringReplace(RichEdit.Lines.Text, '#$D#$A', sLineBreak, [rfReplaceAll]);
   RichEdit.Lines.Text := StringReplace(RichEdit.Lines.Text, #39, '', [rfReplaceAll]);
end;

function TMainController.Descriptografar(ATexto: String): String;
var
   iOffset  : Integer;
   iPos     : Integer;
   iAsc     : Integer;
   iCharAsc : Integer;
   iKeyPos  : Integer;
   iKeyLen  : Integer;
   sDest    : string;
begin
   Result := '';
   if Trim(ATexto) <> '' then
   begin
      iKeyLen := Length(CHAVE);
      iKeyPos := 0;
      iOffSet := StrToInt('$' + Copy(ATexto, 1, 2));
      iPos    := 3;

      repeat
         iAsc := StrToInt('$' + Copy(ATexto, iPos, 2));
         if iKeyPos < iKeyLen then
            iKeyPos := iKeyPos + 1
         else
            iKeyPos := 1;

         iCharAsc := iAsc xor Ord(CHAVE[iKeyPos]);
         if iCharAsc <= iOffSet then
            iCharAsc := 255 + iCharAsc - iOffSet
         else
            iCharAsc := iCharAsc - iOffSet;

         sDest   := sDest + Chr(iCharAsc);
         iOffSet := iAsc;
         iPos    := iPos + 2;
      until (iPos >= Length(ATexto));

      Result:= sDest;
   end;
end;

procedure TMainController.EsconderTabs(PageControl: TPageControl);
var
  I: Integer;
begin
   for I := 0 to Pred(PageControl.PageCount) do
      PageControl.Pages[I].TabVisible := False;
   PageControl.ActivePage := PageControl.Pages[0];
end;

procedure TMainController.IndentarTexto(RichEdit: TRichEdit; Limit: Integer);
var
   Lista: TStringlist;
   I: Integer;

      function RPad(value:string; tamanho:integer; caractere:char): string;
      var
         i : integer;
      begin
         Result := value;
         if(Length(value) > tamanho)then
            exit;
         for i := 1 to (tamanho - Length(value)) do
            Result := Result + caractere;
      end;


begin
   Lista := TStringlist.Create;
   try
      for I := 0 to Pred(RichEdit.Lines.Count) do
      begin
         Lista.Add(QuotedStr(RPad(RichEdit.Lines[i], Limit, ' '))+'+ sLineBreak + ');
      end;
      RichEdit.Lines.Clear;
      RichEdit.Lines.Text := Lista.Text;
   finally
      Lista.Free;
   end;
end;

procedure TMainController.OnCreate(AForm: TForm);
begin
   SetCursor(AForm);
   SetEvents(AForm);
   if AForm.ClassName = 'TfrmMain' then
   begin
      EsconderTabs(FrmMain.PageControl1);
      EsconderTabs(FrmMain.PC_JSON);
      frmMain.reJSONView.MaxLength := System.MaxInt-2;
   end;
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
     if Assigned(Nav) then
        Nav.Parent := TPanel(Sender);
     TPanel(Sender).Repaint;
  end
  else if Sender is TLabel then
  begin
    if Assigned(Nav) then
       Nav.Parent := TPanel(TLabel(Sender).Parent);
    TPanel(TLabel(Sender).Parent).Repaint;
  end;
  PageControl.ActivePage := PageControl.Pages[Page];
end;

procedure GeraSQLtoDelphi(RE: TRichEdit; AComponenteSQL: String; ATexto: TStrings; State: TToggleSwitchState;
   EliminaEspacos: boolean = False);
var
   I: Integer;
   LCodigo: TStringlist;
begin
   LCodigo := TStringlist.Create;
   LCodigo.Text := ATexto.Text;
   RE.Lines.Clear;
   try
      if State = tssOn then
      begin
         RE.Lines.Add(AComponenteSQL+' := '+AComponenteSQL+'.Create(nil);');
         RE.Lines.Add('try');
      end;

      for i := 0 to LCodigo.Count -1 do
      begin
         with RE.Lines do
         begin
            if State = tssOn then
            begin
               if not (EliminaEspacos) then
                  Add('   '+ AComponenteSQL + '.SQL.Add(' + QuotedStr(LCodigo[i]) + ');')
               else
                  Add('   '+ AComponenteSQL + '.SQL.Add(' + QuotedStr(Trim(LCodigo[i])) + ');');
            end
            else
            begin
               if not (EliminaEspacos) then
                  Add(AComponenteSQL + '.SQL.Add(' + QuotedStr(LCodigo[i]) + ');')
               else
                  Add(AComponenteSQL + '.SQL.Add(' + QuotedStr(Trim(LCodigo[i])) + ');');
            end;
         end;
      end;

      if State = tssOn then
      begin
         RE.Lines.Add('finally');
         RE.Lines.Add('   '+AComponenteSQL+'.Free;');
         RE.Lines.Add('end;');
      end;
   finally
      LCodigo.Free;
   end;
end;

procedure ValidarCampoVazio(Condicao: Boolean; AMensagem: String; AFoco: TWinControl);
begin
  if (Condicao) then
  begin
    MessageShow(AMensagem, mtInformation, [mbOK]);
    AFoco.SetFocus;
    Abort;
  end;
end;

procedure Color_Words(RE: TRichEdit; const AWord: string; AOptions: TSearchTypes; Color: TColor);
Var
  FoundAt : integer;
begin
  FoundAt := RE.FindText(AWord,0,maxInt,AOptions);
  while FoundAt <> -1 do
  begin
     RE.SelStart := FoundAt;
     RE.SelLength := Length(AWord);
     RE.SelAttributes.Color := Color;
     RE.SelText := AWord;
     FoundAt:= RE.FindText(AWord,FoundAt + length(AWord),maxInt,AOptions);
  end;
end;

end.
