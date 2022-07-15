unit OneTools.Main.Model;

interface

uses
  System.Classes, OneTools.Main.View, Vcl.ExtCtrls, DateUtils, SysUtils;

type
  TdmMain = class(TDataModule)
    TimerSenha: TTimer;
    TimerFontSQL: TTimer;
    procedure TimerSenhaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses
  Vcl.Graphics;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMain.TimerSenhaTimer(Sender: TObject);
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

   frmMain.lbSenha.Caption := Integer(SenhaDoDia).ToString;
end;

end.
