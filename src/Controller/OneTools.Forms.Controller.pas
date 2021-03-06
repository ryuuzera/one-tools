unit OneTools.Forms.Controller;

interface

uses
  Vcl.Forms, System.UITypes,Vcl.Graphics, System.SysUtils;

function ShowModalFoco(Form: TForm; Centered: Boolean = true): TModalResult;

implementation

function ShowModalFoco(Form: TForm; Centered: Boolean = true): TModalResult;
var
  Back: TForm;
begin
  Back := TForm.Create(nil);
  try
    Back.Position := poDesigned;
    Back.BorderStyle := bsNone;
    Back.AlphaBlend := true;
    Back.AlphaBlendValue := 192;
    Back.Color := clBlack;
    Back.SetBounds(0, 0, Screen.Width, Screen.Height);
    Back.Show;
    if Centered then begin
      Form.Left := (Back.ClientWidth - Form.Width) div 2;
      Form.Top := (Back.ClientHeight - Form.Height) div 2;
    end;
    result := Form.ShowModal;
  finally
    Back.Free;
  end;
end;

end.
