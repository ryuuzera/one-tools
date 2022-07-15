unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  System.SysUtils, DateUtils, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    RichEdit1: TRichEdit;
    Panel5: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    Label2: TLabel;
    lbSenha: TLabel;
    TimerSenha: TTimer;
    Panel8: TPanel;
    Panel7: TPanel;
    imgDobesLogo: TImage;
    Image1: TImage;
    procedure Image1Click(Sender: TObject);
    procedure DebugString(Sender: TObject);
    procedure Panel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel6MouseLeave(Sender: TObject);
    procedure Panel6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerSenhaTimer(Sender: TObject);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure ClickPanel(APanel: TPanel);
    procedure UpClickPanel(APanel: TPanel);
    procedure ChangeColorMove(AComponent: TComponent);
    procedure ChangeColorLeave(AComponent: TComponent);
    function RPad(value: string; tamanho: integer; caractere: char): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
   BUTTON_COLOR = $0059B0FF;
   BUTTON_COLOR_HOVER = $001791FF;

implementation

{$R *.dfm}

procedure TForm1.ChangeColorLeave(AComponent: TComponent);
begin
   TPanel(AComponent).Color := BUTTON_COLOR;
end;

procedure TForm1.ChangeColorMove(AComponent: TComponent);
begin
   TPanel(AComponent).Color := BUTTON_COLOR_HOVER;
end;

procedure TForm1.ClickPanel(APanel: TPanel);
begin
   APanel.BevelOuter := bvLowered;
end;

function TForm1.RPad(value:string; tamanho:integer; caractere:char): string;
var
   i : integer;
begin
   Result := value;
   if(Length(value) > tamanho)then
      exit;
   for i := 1 to (tamanho - Length(value)) do
      Result := Result + caractere;
end;

procedure TForm1.DebugString(Sender: TObject);
var
   Lista: TStringlist;
   I: Integer;
begin
//   RichEdit1.Lines.Text := StringReplace(RichEdit1.Lines.Text, '#$D#$A', slinebreak, [rfReplaceAll]);
//   RichEdit1.Lines.Text := StringReplace(RichEdit1.Lines.Text, #39, '', [rfReplaceAll]);
   Lista := TStringlist.Create;
   try
      for I := 0 to Pred(RichEdit1.Lines.Count) do
      begin
         Lista.Add(QuotedStr(RPad(RichEdit1.Lines[i], 120, ' '))+'+ sLineBreak + ');
      end;
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.Text := Lista.Text;
   finally
      Lista.Free;
   end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm1.Panel3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ReleaseCapture();
   Perform(wm_syscommand, $f012, 0);
end;

procedure TForm1.Panel6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   ClickPanel(TPanel(Sender));
end;

procedure TForm1.Panel6MouseLeave(Sender: TObject);
begin
   ChangeColorLeave(TPanel(Sender));
end;

procedure TForm1.Panel6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   ChangeColorMove(TPanel(Sender));
end;

procedure TForm1.Panel6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   UpClickPanel(TPanel(Sender));
end;

procedure TForm1.TimerSenhaTimer(Sender: TObject);
var
   SenhaDoDia,
   iDia,
   iMes,
   iAno: Integer;
begin
   iDia := DayOf(Date);
   iMes := MonthOf(Date);
   iAno := YearOf(Date);

   SenhaDoDia := (iDia + iMes + iAno) * iDia;

   lbSenha.Caption := Integer(SenhaDoDia).ToString;
end;

procedure TForm1.UpClickPanel(APanel: TPanel);
begin
   APanel.BevelOuter := bvNone;
end;

end.
