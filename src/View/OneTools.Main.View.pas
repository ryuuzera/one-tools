unit OneTools.Main.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Math, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.StdCtrls,
  OneTools.Helpers.Panel.Controller, OneTools.Styles.Constants.View,
  Vcl.Imaging.pngimage, Vcl.ComCtrls, ShellAPI, OneTools.DialogBox.View,
  JSONTreeView, JSONDoc, REST.Client, EncdDecd, Data.DB, Datasnap.DBClient, Vcl.DBGrids,
  Vcl.Samples.Gauges, Vcl.Grids, Vcl.ValEdit, System.IOUtils, System.Types, FireDAC.Phys.FBDef,
  FireDAC.Stan.Def, FireDAC.VCLUI.Wait, FireDAC.Phys.IBWrapper, FireDAC.Phys.IBBase, FireDAC.Phys,
  FireDAC.Stan.Intf, FireDAC.Phys.FB, System.Threading;


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
    pnBodyCenter: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Panel2: TPanel;
    Panel3: TPanel;
    Label8: TLabel;
    pnIndentar: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    reIndentarAuto: TRichEdit;
    Label7: TLabel;
    edIdentCharLinha: TEdit;
    Shape2: TShape;
    Panel4: TPanel;
    Panel12: TPanel;
    reDebugString: TRichEdit;
    Panel13: TPanel;
    Label9: TLabel;
    pnConverterDebug: TPanel;
    Panel15: TPanel;
    Label10: TLabel;
    swEliminaEspacos: TToggleSwitch;
    Panel14: TPanel;
    Label11: TLabel;
    pnCriptografar: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    reCriptografia: TRichEdit;
    pnDescriptografar: TPanel;
    TabSheet5: TTabSheet;
    Panel16: TPanel;
    Panel20: TPanel;
    Panel22: TPanel;
    Label12: TLabel;
    PC_JSON: TPageControl;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Panel25: TPanel;
    reJSONView: TRichEdit;
    Panel26: TPanel;
    JSONTree: TJSONTreeView;
    pnVisualizarJSON: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Panel21: TPanel;
    pnJSONVisualizacao: TPanel;
    pnJSONText: TPanel;
    TabSheet8: TTabSheet;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Edit1: TEdit;
    Shape3: TShape;
    Enviar: TPanel;
    Panel30: TPanel;
    Label15: TLabel;
    Image3: TImage;
    ComboBox1: TComboBox;
    Panel31: TPanel;
    Label16: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    pnBackupRestore: TPanel;
    Label17: TLabel;
    TabSheet9: TTabSheet;
    Panel32: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Label19: TLabel;
    Panel36: TPanel;
    valueList: TValueListEditor;
    Panel33: TPanel;
    Panel37: TPanel;
    DBGrid1: TDBGrid;
    Label18: TLabel;
    dsNode: TDataSource;
    cdsNode: TClientDataSet;
    Panel38: TPanel;
    cdsNodecheck: TBooleanField;
    cdsNodecaminho: TStringField;
    lbStatus: TLabel;
    pnNodeModules: TPanel;
    Label20: TLabel;
    TabSheet10: TTabSheet;
    Panel40: TPanel;
    Label21: TLabel;
    Panel42: TPanel;
    Panel43: TPanel;
    BackupRestoreProgress
    : TRichEdit;
    pgBackupRestore: TPageControl;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Panel41: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    navBackup: TShape;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    IBRestore: TFDIBRestore;
    IBBackup: TFDIBBackup;
    edArquivoOrigem: TEdit;
    Shape4: TShape;
    Label22: TLabel;
    Panel44: TPanel;
    edArquivoBackup: TEdit;
    Shape5: TShape;
    Label23: TLabel;
    Image4: TImage;
    Image5: TImage;
    edArquivoBackupOrigem: TEdit;
    Shape6: TShape;
    Image6: TImage;
    Label24: TLabel;
    Label25: TLabel;
    edArquivoRestaurado: TEdit;
    Shape7: TShape;
    Image7: TImage;
    Panel39: TPanel;
    Nav: TShape;
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
    procedure pnIndentarClick(Sender: TObject);
    procedure pnConverterDebugClick(Sender: TObject);
    procedure pnCriptografarClick(Sender: TObject);
    procedure pnDescriptografarClick(Sender: TObject);
    procedure pnJSONTextClick(Sender: TObject);
    procedure pnVisualizarJSONClick(Sender: TObject);
    procedure pnJSONVisualizacaoClick(Sender: TObject);
    procedure Panel30Click(Sender: TObject);
    procedure Panel31Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure adicionarDiretorioLista(Sender: TObject);
    procedure pnNodeModulesClick(Sender: TObject);
    procedure Panel33Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
      Column: TColumn; State: TGridDrawState);
    procedure Panel37Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure cdsNodecheckGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure Panel38Click(Sender: TObject);
    procedure Panel46Click(Sender: TObject);
    procedure Panel45Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure pnBackupRestoreClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Panel44Click(Sender: TObject);
    procedure IBBackupProgress(ASender: TFDPhysDriverService; const AMessage: string);
    procedure IBBackupBeforeExecute(Sender: TObject);
    procedure IBBackupAfterExecute(Sender: TObject);
    procedure Panel39Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure IBRestoreAfterExecute(Sender: TObject);
    procedure IBRestoreBeforeExecute(Sender: TObject);
    procedure IBRestoreProgress(ASender: TFDPhysDriverService; const AMessage: string);
  private
     { Private declarations }
    FRestClient: TRestClient;
    FBackupThread: TThread;
    FRestoreThread: TThread;
    function GetBorderSpace: Integer;
    function IsBorderless: Boolean;
    procedure WMNCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
    function BuscaDiretorios(const Dir, TargetDir: string): TArray<string>;
    procedure EnableAfterThread(Sender: TObject);
    { Private declarations }
  protected
    procedure Paint; override;
    procedure Resize; override;
  public
    { Public declarations }
    constructor OnCreate(AOwner: TComponent); reintroduce;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  OneTools.Main.Controller, OneTools.Main.Model;

{$R *.dfm}

procedure TfrmMain.Button2Click(Sender: TObject);
begin
   with TMainController.Create do
      try
         Edit2.Text := EncodeString(Criptografar(FormatDateTime('dd/mm/yyyy', StrToDate(Edit2.Text))));
      finally
         Free;
      end;
end;

procedure TfrmMain.cdsNodecheckGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
   Text := EmptyStr;
end;

procedure TfrmMain.DBGrid1CellClick(Column: TColumn);
begin

  if Column.FieldName = 'check' then
  begin
      DBGrid1.DataSource.Dataset.Edit;

     if (DBGrid1.DataSource.Dataset.FieldByName('check').AsBoolean) then
        DBGrid1.DataSource.Dataset.FieldByName('check').AsBoolean := False
     else
        DBGrid1.DataSource.Dataset.FieldByName('check').AsBoolean := True;

     DBGrid1.DataSource.Dataset.Post;
  end;

end;

procedure TfrmMain.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;

  if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    Exit;

  if Column.FieldName = 'check' then
  begin
    TDBGrid(Sender).Canvas.FillRect(Rect);
    (Sender as TDBGrid).DataSource.Dataset.Edit;
    if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('check').AsBoolean) then
    begin
      Check := DFCS_CHECKED
    end
    else
    begin
      Check := 0;
    end;

    R := Rect;
    InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
      DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   SetWindowRgn(ComboBox1.Handle, CreateRectRgn(2,2,ComboBox1.Width - 2,
               ComboBox1.Height - 2), True);
   with TMainController.Create do
   try
      OnCreate(Self);
   finally
      Free;
   end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
   with TMainController.Create do
      try
         Edit2.Text := DateToStr(StrToDate(Descriptografar(DecodeString(Edit2.Text)))) ;
      finally
         Free;
      end;
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

procedure TfrmMain.IBBackupAfterExecute(Sender: TObject);
begin
   TThread.Synchronize(TThread(FBackupThread), procedure
   begin
      MessageShow('Backup concluído com sucesso!', mtInformation, [mbok]);
   end);
end;

procedure TfrmMain.IBBackupBeforeExecute(Sender: TObject);
begin
   TThread.Synchronize(TThread(FBackupThread), procedure
   begin
      Panel44.Enabled := False;
      Panel44.Visible := False;
      BackupRestoreProgress.Lines.Clear;
   end);
end;

procedure TfrmMain.IBBackupProgress(ASender: TFDPhysDriverService; const AMessage: string);
begin
   TThread.Synchronize(TThread(FBackupThread), procedure
   begin
      SendMessage(BackupRestoreProgress.handle, WM_VSCROLL, SB_BOTTOM, 0);
      BackupRestoreProgress.Lines.Add(AMessage);
   end);
end;

procedure TfrmMain.Image4Click(Sender: TObject);
begin
   with TOpenDialog.Create(nil) do
   begin
      Title := 'Selecione o Banco de dados de origem';
      Filter := 'Banco de Dados Firebird (*.FDB)|*.FDB';
      DefaultExt := 'FDB';
      FilterIndex := 1;
      if Execute then
         edArquivoOrigem.Text := Filename;
      Free;
   end;
end;

procedure TfrmMain.Image5Click(Sender: TObject);
begin
   with TSaveDialog.Create(nil) do
   begin
      Title := 'Selecione o Local do Backup';
      Filter := 'Arquivo de Backup Firebird (*.fbk)|*.fbk';
      DefaultExt := 'fbk';
      FilterIndex := 1;
      if Execute then
         edArquivoBackup.Text := Filename;
      Free;
   end;
end;

procedure TfrmMain.Image6Click(Sender: TObject);
begin
   with TOpenDialog.Create(nil) do
   begin
      Title := 'Selecione o Arquivo de origem';
      Filter := 'Arquivo de Backup Firebird (*.fbk)|*.fbk';
      DefaultExt := 'fbk';
      FilterIndex := 1;
      if Execute then
         edArquivoBackupOrigem.Text := Filename;
      Free;
   end;
end;

procedure TfrmMain.Image7Click(Sender: TObject);
begin
   with TSaveDialog.Create(nil) do
   begin
      Title := 'Selecione o Local de Restauração';
      Filter := 'Banco de Dados Firebird (*.FDB)|*.FDB';
      DefaultExt := 'FDB';
      FilterIndex := 1;
      if Execute then
         edArquivoRestaurado.Text := Filename;
      Free;
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
   try
      ControlaSplitView(SplitView);
   finally
      Free;
   end;
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

constructor TfrmMain.OnCreate(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FRestClient := dmMain.RESTClient;
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
   ControlaNav(Nav, Sender, PageControl1, 3);
end;

procedure TfrmMain.Panel30Click(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 6);
end;

procedure TfrmMain.Panel31Click(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 6);
end;

procedure TfrmMain.Panel33Click(Sender: TObject);
begin
   if (valueList.Strings.Count > 0) then
      valueList.deleterow(valueList.Row)
   else
      MessageShow('Nenhum diretório adicionado!', mtInformation, [mbOK]);
end;

function TfrmMain.BuscaDiretorios(const Dir, TargetDir: string): TArray<string>;
var
  Directories: TArray<string>;                                
  DirPath: string;
  SubDirectories: TArray<string>;
  SubDirPath: string;
begin
   Result := nil;
   Directories := TDirectory.GetDirectories(Dir);
   for DirPath in Directories do
   begin
      try
         lbStatus.Caption := Format('Buscando em: %s',[DirPath]);
         if Pos(TargetDir, DirPath) > 0 then
         begin
            SetLength(Result, Length(Result) + 1);
            Result[High(Result)] := DirPath;
            cdsNode.Append;
            cdsNode.FieldByName('check').AsBoolean := True;
            cdsNode.FieldByName('caminho').AsString := Result[High(Result)];
            cdsNode.Post;
         end
         else
         begin
            SubDirectories := BuscaDiretorios(DirPath, TargetDir);
            for SubDirPath in SubDirectories do
            begin
               SetLength(Result, Length(Result) + 1);
               Result[High(Result)] := SubDirPath;
            end;
         end;   
      finally
         Application.ProcessMessages;
      end;
   end;
end;

procedure TfrmMain.Panel37Click(Sender: TObject);
var
   NodeModules: TArray<String>;
   I: Integer;
  K: Integer;
begin
   if (valueList.Strings.Count = 0) then
   begin
      MessageShow('Adicione pelo menos um diretório!', mtInformation, [mbOK]);
      Abort;
   end;
   cdsNode.EmptyDataSet;
   cdsNode.Open;
   for I := 0 to valueList.Strings.Count -1 do
   begin
      buscaDiretorios(valueList.Strings.ValueFromIndex[i], 'node_modules');
   end;
   lbStatus.Caption := 'Finalizado!';

end;

procedure TfrmMain.Panel38Click(Sender: TObject);

   procedure Remove(const Dir: string);
   var
     ShOp: TSHFileOpStruct;
     TotalFiles: Integer;
   begin
     ZeroMemory(@ShOp, SizeOf(ShOp));
     ShOp.Wnd := Self.Handle;
     ShOp.wFunc := FO_DELETE;
     ShOp.pFrom := PChar(Dir + #0);
     ShOp.pTo := nil;
     ShOp.fFlags := FOF_SIMPLEPROGRESS or FOF_NOCONFIRMATION or FOF_NOERRORUI or FOF_NOCONFIRMMKDIR;
     ShOp.lpszProgressTitle := PChar('Excluindo arquivos...');
     SHFileOperation(ShOp);
   end;

begin
   if cdsNode.IsEmpty then
   begin
      MessageShow('Nenhum diretório de node_modules selecionado!', mtInformation, [mbOK]);
      Abort;
   end;
   cdsNode.First;
   while not cdsNode.eof do
   begin
      try
         if (cdsNode.FieldByName('check').AsBoolean) then
         begin
            Remove(cdsNode.FieldByName('caminho').AsString);
            cdsNode.Delete;
         end;
          cdsNode.Next;
      except
         MessageShow(Format('Erro ao tentar excluir o diretório %s', [cdsNode.FieldByName('caminho').AsString]), mtInformation, [mbOK]);
      end;
   end;
end;

procedure TfrmMain.Panel39Click(Sender: TObject);
begin
   if (String(edArquivoBackupOrigem.Text).IsEmpty) or (String(edArquivoRestaurado.Text).IsEmpty) then
   begin
      MessageShow('Obrigatório informar o arquivo de origem e diretório de destino!', mtInformation, [mbOK]);
      Abort;
   end;

   try
      IBRestore.BackupFiles.Clear;
      IBRestore.Host     := '127.0.0.1';
      IBRestore.Password := 'masterkey';
      IBRestore.Port     := 3050;
      IBRestore.UserName := 'SYSDBA';
      IBRestore.Protocol := ipTCPIP;
      IBRestore.Database := edArquivoRestaurado.Text; //edArquivoRestaurado.Text
      IBRestore.BackupFiles.Add(edArquivoBackupOrigem.Text);

      FRestoreThread := TThread.CreateAnonymousThread(procedure
      begin
         try
             IBRestore.Restore;
         except on E:exception do
            begin
               FRestoreThread.Terminate;
               TThread.Synchronize(nil,
                  procedure
                  begin
                     // Notifica o thread principal sobre a exceção
                      Panel39.Visible := True;
                      Panel39.Enabled := True;
                      MessageShow(Format('Ocorreu o seguinte erro ao tentar efetuar a restauração: %s', [e.Message]), mtInformation, [mbOK]);
                  end
               );
            end;
         end;
      end
      );
      FRestoreThread.FreeOnTerminate := True;
      FRestoreThread.OnTerminate := EnableAfterThread;
      FRestoreThread.Start;

   except

   end;
end;

procedure TfrmMain.adicionarDiretorioLista(Sender: TObject);

   function getIndex: integer;
   begin
      Exit(valueList.Strings.Count + 1)
   end;

begin
   with TFileOpenDialog.Create(nil) do
   begin
      Options := [fdoPickFolders];
      Title := 'Selecione um diretório';
      if Execute then
      begin
         valueList.InsertRow(getIndex.ToString(), FileName, true);
      end;
      Free;
   end
end;

procedure TfrmMain.pnJSONTextClick(Sender: TObject);
begin
   PC_JSON.ActivePage := PC_JSON.Pages[1];
   pnJSONVisualizacao.BevelOuter := bvNone;
   pnJSONText.BevelOuter := bvLowered;
end;

procedure TfrmMain.pnJSONVisualizacaoClick(Sender: TObject);
begin
   dmMain.JSONDocument.JSONText := reJSONView.Text;
   JSONTree.LoadJson;
   PC_JSON.ActivePage := PC_JSON.Pages[0];
   pnJSONVisualizacao.BevelOuter := bvLowered;
   pnJSONText.BevelOuter := bvNone;
end;

procedure TfrmMain.pnNodeModulesClick(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 7);
end;

procedure TfrmMain.pnVisualizarJSONClick(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 5);
end;

procedure TfrmMain.pnBackupRestoreClick(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 0);
end;

procedure TfrmMain.pnConverterDebugClick(Sender: TObject);
begin
   with TMainController.Create do
   try
//      reDebugString.Lines.Text := DebugString(reDebugString.Lines.Text);
      DebugarString(reDebugString);
      HighlightSQLKeywords(reDebugString);
   finally
      Free;
   end;
end;

procedure TfrmMain.pnCriptografarClick(Sender: TObject);
var
   Cripto: TStringlist;
   I: Integer;
begin
   Cripto := TStringlist.Create;
   with TMainController.Create do
   try
      for I := 0 to Pred(reCriptografia.Lines.Count) do
         Cripto.Add(Criptografar(reCriptografia.Lines[i]));
      reCriptoGrafia.Lines.Clear;
      reCriptoGrafia.Lines.Text := Cripto.Text;
   finally
      Free;
      Cripto.Free;
   end;
end;

procedure TfrmMain.pnCriptoXMLClick(Sender: TObject);
begin
   ControlaNav(Nav, Sender, PageControl1, 4);
end;

procedure TfrmMain.pnDescriptografarClick(Sender: TObject);
var
   Cripto: TStringlist;
   I: Integer;
begin
   Cripto := TStringlist.Create;
   with TMainController.Create do
   try
      for I := 0 to Pred(reCriptografia.Lines.Count) do
         Cripto.Add(Descriptografar(reCriptografia.Lines[i]));
      reCriptoGrafia.Lines.Clear;
      reCriptoGrafia.Lines.Text := Cripto.Text;
   finally
      Free;
      Cripto.Free;
   end;
end;

procedure TfrmMain.pnGerarSQLDelphiClick(Sender: TObject);
begin
  ValidarCampoVazio(String(edSQLDelphi.Text).IsEmpty, 'Insira o nome do componente SQL!', edSQLDelphi);
  GeraSQLtoDelphi(reSQLtoDelphi,
                    edSQLDelphi.Text,
                      reSQLtoDelphi.Lines,
                        swGeraCreate.State,
                          swEliminaEspacos.State = tssOn);
end;

procedure TfrmMain.pnIndentarClick(Sender: TObject);
begin
   ValidarCampoVazio(String(edIdentCharLinha.Text).IsEmpty,
                        'Insira o limite máximo de caracteres por linha!',
                           edIdentCharLinha);
   with TMainController.Create do
   try
      IndentarTexto(reIndentarAuto,
         String(edIdentCharLinha.Text).ToInteger);
   finally
      Free;
   end;
end;

procedure TfrmMain.pnSQLIdentClick(Sender: TObject);
begin
  ControlaNav(Nav, Sender, PageControl1, 1);
end;

procedure TfrmMain.pnStringDebugClick(Sender: TObject);
begin
  ControlaNav(Nav, Sender, PageControl1, 2);
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

procedure TfrmMain.Panel44Click(Sender: TObject);
begin
   if (String(edArquivoOrigem.Text).IsEmpty) or (String(edArquivoBackup.Text).IsEmpty) then
   begin
      MessageShow('Obrigatório informar o arquivo de origem e diretório de destino!', mtInformation, [mbOK]);
      Abort;
   end;

   try
      IBBackup.BackupFiles.Clear;
      IBBackup.Host     := '127.0.0.1';
      IBBackup.Password := 'masterkey';
      IBBackup.Port     := 3050;
      IBBackup.UserName := 'SYSDBA';
      IBBackup.Protocol := ipTCPIP;
      IBBackup.Database := edArquivoOrigem.Text;
      IBBackup.BackupFiles.Add(edArquivoBackup.Text);

       FBackupThread := TThread.CreateAnonymousThread(procedure
      begin
         try
             IBBackup.Backup;
         except on E:exception do
            begin
               FBackupThread.Terminate;
               TThread.Synchronize(nil,
                  procedure
                  begin
                     // Notifica o thread principal sobre a exceção
                      Panel39.Visible := True;
                      Panel39.Enabled := True;
                      MessageShow(Format('Ocorreu o seguinte erro ao tentar efetuar o backup: %s', [e.Message]), mtInformation, [mbOK]);
                  end
               );
            end;
         end;

      end
      );

      FBackupThread.FreeOnTerminate := True;
      FBackupThread.OnTerminate := EnableAfterThread;
      FBackupThread.Start;
   except on E:exception do
      begin

      end;
   end;
end;

procedure TFrmMain.EnableAfterThread(Sender: TObject);
begin
   Panel44.Enabled := True;
   Panel44.Visible := True;
   Panel39.Enabled := True;
   Panel39.Visible := True;
end;

procedure TfrmMain.Panel45Click(Sender: TObject);
begin
   ControlaNav(navBackup, Sender, pgBackupRestore, 1);
end;

procedure TfrmMain.Panel46Click(Sender: TObject);
begin
   ControlaNav(navBackup, Sender, pgBackupRestore, 0);
end;

procedure TfrmMain.IBRestoreAfterExecute(Sender: TObject);
begin
   TThread.Synchronize(TThread(FRestoreThread), procedure
   begin
      MessageShow('Restauração concluída com sucesso!', mtInformation, [mbok]);
   end);
end;

procedure TfrmMain.IBRestoreBeforeExecute(Sender: TObject);
begin
   TThread.Synchronize(TThread(FRestoreThread), procedure
   begin
      Panel39.Enabled := False;
      Panel39.Visible := False;
      BackupRestoreProgress.Lines.Clear;
   end);
end;

procedure TfrmMain.IBRestoreProgress(ASender: TFDPhysDriverService; const AMessage: string);
begin
   TThread.Synchronize(TThread(FRestoreThread), procedure
   begin
      SendMessage(BackupRestoreProgress.handle, WM_VSCROLL, SB_BOTTOM, 0);
      BackupRestoreProgress.Lines.Add(AMessage);
   end);
end;

end.
