unit OneTools.Main.Model;

interface

uses
  System.Classes, Vcl.ExtCtrls, DateUtils, SysUtils, JSONDoc, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TdmMain = class(TDataModule)
    TimerSenha: TTimer;
    TimerFontSQL: TTimer;
    JSONDocument: TJSONDocument;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
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
  Vcl.Graphics, OneTools.Main.View;

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
