unit OneTools.Main.Model;

interface

uses
  System.Classes, Vcl.ExtCtrls, DateUtils, SysUtils, JSONDoc;

type
  TdmMain = class(TDataModule)
    TimerSenha: TTimer;
    TimerFontSQL: TTimer;
    JSONDocument: TJSONDocument;
    procedure TimerSenhaTimer(Sender: TObject);
    procedure JSONDocumentChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

uses
  Vcl.Graphics, OneTools.Main.View;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

pprocedure TdmMain.JSONDocumentChange(Sender: TObject);
begin

end;

rocedure TdmMain.TimerSenhaTimer(Sender: TObject);
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
