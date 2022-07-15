unit OneTools.Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Math, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls,
  OneTools.Helpers.Panel.Controller, OneTools.Styles.Constants.View,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, ShellAPI, OneTools.DialogBox.View;

type
  TfrmMain = class(TForm)
    pnBody: TPanel;
    pnTop: TPanel;
    SplitView: TSplitView;
    pnSplitView: TPanel;
    imgMenu: TImage;
    pnClose: TPanel;
    pnMinimize: TPanel;
    pnMaximize: TPanel;
    imgClose: TImage;
    imgMaximize: TImage;
    imgMinimize: TImage;
    pnMenuLogoBackground: TPanel;
    pnMenuLogo: TPanel;
    pnMenuCenterBackground: TPanel;
    pnMenuCenter: TPanel;
    pnMenuBottomBackground: TPanel;
    pnMenuBottom: TPanel;
    pnMenuLogoImg: TPanel;
    pnMenuLabelLogo: TPanel;
    lbMenuLogo: TLabel;
    ImgMenuLogo: TImage;
    pnSQLIdent: TPanel;
    pnStringDebug: TPanel;
    PNEvents: TPanel;
    Panel1: TPanel;
    lbIdentSQL: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Nav: TShape;
    pnBodyCenter: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    lbSenha: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    reSQLtoDelphi: TRichEdit;
    Label4: TLabel;
    edSQLDelphi: TEdit;
    Label5: TLabel;
    Shape1: TShape;
    pnGerarSQLDelphi: TPanel;
    swGeraCreate: TToggleSwitch;
    Label6: TLabel;
    pnCriptoXML: TPanel;
    lbCriptoXML: TLabel;
    TabSheet4: TTabSheet;
    Panel9: TPanel;
    lbDev: TLabel;
    Image2: TImage;
    lbSource: TLabel;
    procedure pnTopMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgMaximizeClick(Sender: TObject);
    procedure imgMinimizeClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PNEventsMouseLeave(Sender: TObject);
    procedure PNEventsMouseEnter(Sender: TObject);
    procedure pnSQLIdentClick(Sender: TObject);
    procedure pnStringDebugClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure pnGerarSQLDelphiClick(Sender: TObject);
    procedure pnCriptoXMLClick(Sender: TObject);
    procedure lbSourceClick(Sender: TObject);
    procedure lbDevClick(Sender: TObject);
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
  end;

var
  frmMain: TfrmMain;

implementation

uses
  OneTools.Main.Controller;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   with TMainController.Create do
      OnCreate(Self);
end;

function TfrmMain.GetBorderSpace: Integer;
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

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
   Close();
end;

procedure TfrmMain.imgMaximizeClick(Sender: TObject);
begin
   if WindowState = wsNormal then
      WindowState := wsMaximized
   else
      WindowState := wsNormal;
end;

procedure TfrmMain.imgMenuClick(Sender: TObject);
begin
   with TMainController.Create do
      ControlaSplitView(SplitView);
end;

procedure TfrmMain.imgMinimizeClick(Sender: TObject);
begin
   Application.Minimize;
end;

function TfrmMain.IsBorderless: Boolean;
begin
   Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

procedure TfrmMain.lbDevClick(Sender: TObject);
begin
  ShellExecute(0, 'Open', PChar('https://fmsoftware.online/contato'), PChar(''), nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.lbSourceClick(Sender: TObject);
begin
   ShellExecute(0, 'Open', PChar('https://github.com/ryuuzera/one-tools'), PChar(''), nil, SW_SHOWNORMAL);
end;

procedure TfrmMain.PNEventsMouseEnter(Sender: TObject);
begin
  SetMouseMove(Sender);
end;

procedure TfrmMain.PNEventsMouseLeave(Sender: TObject);
begin
   SetMouseLeave(Sender);
end;

procedure TfrmMain.Paint;
begin
  inherited;
  if (WindowState = wsNormal) and (not IsBorderless) then
  begin
    Canvas.Pen.Color := clBlack;
    Canvas.MoveTo(0, 0);
    Canvas.LineTo(Width, 0);
  end;
end;

procedure TfrmMain.Panel1Click(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 2);
end;

procedure TfrmMain.pnCriptoXMLClick(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 3);
end;

procedure TfrmMain.pnGerarSQLDelphiClick(Sender: TObject);
begin
  ValidarCampoVazio(String(edSQLDelphi.Text).IsEmpty, 'Insira o nome do componente SQL!', edSQLDelphi);
  reSQLtoDelphi.Text := GeraSQLtoDelphi(edSQLDelphi.Text,
                                          reSQLtoDelphi.Lines,
                                            swGeraCreate.State);
end;

procedure TfrmMain.pnSQLIdentClick(Sender: TObject);
begin
  ControlaNav(Nav, Sender, PageControl1, 0);
end;

procedure TfrmMain.pnStringDebugClick(Sender: TObject);
begin
  ControlaNav(Nav, Sender, PageControl1, 1);
end;

procedure TfrmMain.pnTopMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
   ReleaseCapture();
   Perform(wm_syscommand, $F012, 0);
end;

procedure TfrmMain.Resize;
begin
   inherited;
     Padding.Top := IfThen(((WindowState = wsNormal) and (not IsBorderless)), 1, 0);
end;

procedure TfrmMain.WMNCCalcSize(var Msg: TWMNCCalcSize);
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