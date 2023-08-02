//unit OneTools.FileOperation.Controller;
//
//interface
//
//uses
//  System.Win.ComObj, Winapi.ShlObj, Vcl.Samples.Gauges, Winapi.Windows, Winapi.ShellAPI;
//
//type
//  TProgressSink = class(TInterfacedObject, IFileOperationProgressSink)
//  private
//    FProgressBar: TGauge;
//  public
//    constructor Create(ProgressBar: TGauge);
//    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
//    function _AddRef: Integer; stdcall;
//    function _Release: Integer; stdcall;
//    function QueryContinue: HResult; stdcall;
//    function OnProgress(ulProgress: UInt32; ulProgressTotal: UInt32;
//      ulFileProgress: UInt32; ulFileProgressTotal: UInt32;
//      hr: HRESULT; var pfCancel: BOOL): HResult; stdcall;
//    function OnBegin(operation: IFileOperation; var items: IShellItemArray;
//      const pfCancel: BOOL): HResult; stdcall;
//    function OnEnd(operation: IFileOperation; hrResult: HRESULT): HResult; stdcall;
//  end;
//
//  procedure Remove(const Dir: string; Progress: TGauge);
//
//implementation
//
//{ TProgressSink }
//constructor TProgressSink.Create(ProgressBar: TGauge);
//begin
//  FProgressBar := ProgressBar;
//end;
//
//function TProgressSink.QueryInterface(const IID: TGUID; out Obj): HResult;
//begin
//  if GetInterface(IID, Obj) then
//    Result := S_OK
//  else
//    Result := E_NOINTERFACE;
//end;
//
//function TProgressSink._AddRef: Integer;
//begin
//  Result := -1;
//end;
//
//function TProgressSink._Release: Integer;
//begin
//  Result := -1;
//end;
//
//function TProgressSink.QueryContinue: HResult;
//begin
//  Result := S_OK;
//end;
//
//function TProgressSink.OnProgress(ulProgress, ulProgressTotal, ulFileProgress,
//  ulFileProgressTotal: UInt32; hr: HRESULT; var pfCancel: BOOL): HResult;
//begin
//  if FProgressBar <> nil then
//  begin
//    FProgressBar.MaxValue := ulProgressTotal;
//    FProgressBar.Progress := ulProgress;
//  end;
//  Result := S_OK;
//end;
//
//function TProgressSink.OnBegin(operation: IFileOperation; var items: IShellItemArray;
//  const pfCancel: BOOL): HResult;
//begin
//  Result := S_OK;
//end;
//
//function TProgressSink.OnEnd(operation: IFileOperation; hrResult: HRESULT): HResult;
//begin
//  Result := S_OK;
//end;
//
//procedure Remove(const Dir: string; Progress: TGauge);
//var
//  FileOp: IFileOperation;
//  Item: IShellItem;
//  Sink: IFileOperationProgressSink;
//begin
//  // Criar a interface IFileOperation
//  FileOp := CreateComObject(CLSID_FileOperation) as IFileOperation;
//
//  // Habilitar a flag FOF_NOCONFIRMATION para desabilitar a caixa de diálogo de confirmação
//  FileOp.SetOperationFlags(FOF_NOCONFIRMATION);
//
//  // Adicionar os arquivos a serem excluídos à lista de operações
//  Item := SHCreateItemFromParsingName(PChar(Dir), nil, IShellItem2);
//  FileOp.DeleteItem(Item, nil);
//
//  // Criar a interface IFileOperationProgressSink
//  Sink := TProgressSink.Create(Progress);
//  FileOp.Advise(Sink, nil);
//
//  // Executar a operação
//  FileOp.PerformOperations;
//end;
//
//end.

