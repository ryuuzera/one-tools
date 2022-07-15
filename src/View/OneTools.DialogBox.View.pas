unit OneTools.DialogBox.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, OneTools.Forms.FormBase1.View,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TTipoDlg = (mtInformation, mtWarning, mtError);

  TMessageBox = class(TfrmBase1)
    lbTIPO: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    lbMensagem: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: Tcomponent; AMensagem: String; ATipo: TTipoDlg; Botoes: String = ''); reintroduce;
  end;

  function ShowModalFoco(Form: TForm; Centered: Boolean = true): TModalResult;

var
  MessageBox: TMessageBox;

implementation

{$R *.dfm}

{ TfrmBase2 }

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

constructor TMessageBox.Create(AOwner: Tcomponent; AMensagem: String; ATipo: TTipoDlg;
  Botoes: String = '');
begin
  inherited Create(AOwner);
  case ATipo of
    mtInformation: lbTIPO.Caption := 'AVISO';
    mtWarning:     lbTIPO.Caption := 'ATENÇÃO';
    mtError:       lbTIPO.Caption := 'ERRO';
  end;
  lbMensagem.Caption := AMensagem;
  ShowModalFoco(Self);
end;

procedure TMessageBox.Panel5Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOK;
end;

end.
