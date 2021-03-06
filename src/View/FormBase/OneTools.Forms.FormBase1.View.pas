unit OneTools.Forms.FormBase1.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  OneTools.Main.Controller;

type
  TfrmBase1 = class(TForm)
    pnTop: TPanel;
    pnClose: TPanel;
    imgClose: TImage;
    pnMaximize: TPanel;
    imgMaximize: TImage;
    pnMinimize: TPanel;
    imgMinimize: TImage;
    Panel1: TPanel;
    PNEvents: TPanel;
    procedure imgCloseClick(Sender: TObject);
    procedure PNEventsMouseEnter(Sender: TObject);
    procedure PNEventsMouseLeave(Sender: TObject);
  private
   { Private declarations }
    function GetBorderSpace: Integer;
    function IsBorderless: Boolean;
    procedure WMNCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
    { Private declarations }
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
  end;

var
  frmBase1: TfrmBase1;

implementation

uses
  System.Math;

{$R *.dfm}

{ TfrmBase1 }

constructor TfrmBase1.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   with TMainController.Create do
   try
      OnCreate(Self);
   finally
      Free;
   end;
end;

function TfrmBase1.GetBorderSpace: Integer;
begin
   case BorderStyle of
      bsSingle:
         Result := GetSystemMetrics(SM_CYFIXEDFRAME);
      bsDialog, bsToolWindow:
         Result := GetSystemMetrics(SM_CYDLGFRAME);
      bsSizeable, bsSizeToolWin:
         Result := GetSystemMetrics(SM_CYSIZEFRAME) +
                   GetSystemMetrics(SM_CXPADDEDBORDER);
      else
         Result := 0;
   end;
end;

procedure TfrmBase1.imgCloseClick(Sender: TObject);
begin
   Close;
end;

function TfrmBase1.IsBorderless: Boolean;
begin
   Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

procedure TfrmBase1.Paint;
begin
   inherited;
   if (WindowState = wsNormal) and (not IsBorderless) then
   begin
      Canvas.Pen.Color := clBlack;
      Canvas.MoveTo(0, 0);
      Canvas.LineTo(Width, 0);
   end;
end;

procedure TfrmBase1.PNEventsMouseEnter(Sender: TObject);
begin
   SetMouseMove(Sender);
end;

procedure TfrmBase1.PNEventsMouseLeave(Sender: TObject);
begin
   SetMouseLeave(Sender);
end;

procedure TfrmBase1.Resize;
begin
   inherited;
   Padding.Top := IfThen(((WindowState = wsNormal) and (not IsBorderless)), 1, 0);
end;

procedure TfrmBase1.WMNCCalcSize(var Msg: TWMNCCalcSize);
var
   CaptionBarHeight: Integer;
begin
   inherited;
   if BorderStyle = bsNone then
     exit;
   CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);
   if WindowState = wsNormal then
     Inc(CaptionBarHeight, GetBorderSpace);
   Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight);
end;

end.
