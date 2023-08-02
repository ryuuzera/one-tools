object dmMain: TdmMain
  OldCreateOrder = False
  Height = 320
  Width = 504
  object TimerSenha: TTimer
    OnTimer = TimerSenhaTimer
    Left = 32
    Top = 16
  end
  object TimerFontSQL: TTimer
    Enabled = False
    Interval = 100
    Left = 96
    Top = 16
  end
  object JSONDocument: TJSONDocument
    Left = 24
    Top = 72
  end
  object RESTClient: TRESTClient
    Params = <>
    Left = 168
    Top = 17
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 237
    Top = 17
  end
  object RESTResponse: TRESTResponse
    Left = 316
    Top = 17
  end
end
