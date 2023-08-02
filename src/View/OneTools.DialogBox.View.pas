unit OneTools.DialogBox.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, OneTools.Forms.FormBase1.View,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TStatusbtn = (Sim, Nao, Cancel, OK);
  TTipoDlg = (mtInformation, mtWarning, mtError);
  TMsgDlgBtn = (mbYes, mbNo, mbOK, mbCancel, mbAbort, mbRetry, mbIgnore,
    mbAll, mbNoToAll, mbYesToAll, mbHelp, mbClose);
  TMsgDlgButtons = set of TMsgDlgBtn;

  TMessageBox = class(TfrmBase1)
    lbTIPO: TLabel;
    Panel2: TPanel;
    imgInfo: TImage;
    Panel3: TPanel;
    lbMensagem: TLabel;
    Panel4: TPanel;
    pnOKYES: TPanel;
    pnNOCANCEL: TPanel;
    imgError: TImage;
    imgWarning: TImage;
    procedure pnOKYESClick(Sender: TObject);
    procedure pnNOCANCELClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FBotaoOKSIM: TStatusbtn;
    FBotaoNoCancel: TStatusbtn;
    constructor Create(AOwner: Tcomponent; AMensagem: String; ATipo: TTipoDlg; Botoes: TMsgDlgButtons); reintroduce;
  public
    { Public declarations }
    class function Show(AMensagem: String; ATipo: TTipoDlg; Botoes: TMsgDlgButtons): TMessageBox;
  end;

  function ShowModalFoco(Form: TForm; Centered: Boolean = true): TModalResult;
  function MessageShow(AMensagem: String; ATipo: TTipoDlg; Botoes: TMsgDlgButtons): TModalResult;

var
  MessageBox: TMessageBox;

implementation

{$R *.dfm}

{ TMessageBox }

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
    Beep;
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
  Botoes: TMsgDlgButtons);
begin
  inherited Create(AOwner);
  case ATipo of
    mtInformation:
    begin
       lbTIPO.Caption := 'AVISO';
       imgInfo.Visible := True;
    end;
    mtWarning:
    begin
       lbTIPO.Caption := 'ATENÇÃO';
       imgWarning.Visible := True;
    end;
    mtError:
    begin
       lbTIPO.Caption := 'ERRO';
       imgError.Visible := True;
    end;
  end;
  if mbOK in Botoes then
  begin
    pnOKYES.Caption := 'OK';
    FBotaoOKSIM := Ok
  end
  else if mbYES in Botoes then
  begin
    pnOKYES.Caption := 'Sim';
    FBotaoOKSIM := Sim;
  end;
  if mbNO in Botoes then
  begin
    pnNOCANCEL.Caption := 'Não';
    pnNOCANCEL.Visible := True;
    FBotaoNoCancel := Nao;
  end
  else if mbCancel in Botoes then
  begin
    pnNOCANCEL.Caption := 'Cancelar';
    pnNOCANCEL.Visible := True;
    FBotaoNoCancel := Cancel;
  end;

  lbMensagem.Caption := AMensagem;

  ShowModalFoco(Self);
end;

procedure TMessageBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key in [VK_RETURN] then
    pnOKYES.onClick(self);
  if key in [VK_ESCAPE] then
    pnNOCANCEL.onClick(self);
end;

procedure TMessageBox.pnNOCANCELClick(Sender: TObject);
begin
  inherited;
  if FBotaoOKSIM = Nao then
    ModalResult := mrNo
  else if FBotaoOKSIM = Cancel then
    ModalResult := mrCancel;

  Close;
end;

procedure TMessageBox.pnOKYESClick(Sender: TObject);
begin
  inherited;
  if FBotaoOKSIM = Ok then
     ModalResult := mrOK
  else if FBotaoOKSIM = Sim then
     ModalResult := mrYes;
end;

class function TMessageBox.Show(AMensagem: String; ATipo: TTipoDlg;
  Botoes: TMsgDlgButtons): TMessageBox;
begin
   Result := TMessageBox.Create(nil, AMensagem, ATipo, Botoes);
end;

function MessageShow(AMensagem: String; ATipo: TTipoDlg; Botoes: TMsgDlgButtons): TModalResult;
begin
   Result := TMessageBox.Show(AMensagem, ATipo, Botoes).ModalResult;
end;

end.
