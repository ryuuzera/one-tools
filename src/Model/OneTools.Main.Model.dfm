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
    OnChange = JSONDocumentChange
    Left = 24
    Top = 72
  end
end
