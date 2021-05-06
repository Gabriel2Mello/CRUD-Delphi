object frmDAO: TfrmDAO
  Left = 0
  Top = 0
  Caption = 'DataModule'
  ClientHeight = 404
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object UniConnection1: TUniConnection
    ProviderName = 'SQL Server'
    Port = 1433
    Database = 'DB_RNX_T1'
    Username = 'evx_admin'
    Server = 'SRVDEV1'
    Connected = True
    Left = 88
    Top = 40
    EncryptedPassword = 'CEFFCDFF8EFF88FF9EFF8CFF85FF87FFBFFF'
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 88
    Top = 96
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Params = <>
    Resource = 'banco'
    Response = RESTResponse1
    Left = 216
    Top = 152
  end
  object RESTClient2: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost:9000'
    ContentType = 'application/json'
    Params = <>
    Left = 216
    Top = 96
  end
  object RESTRequest2: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Method = rmDELETE
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'id'
        Options = [poAutoCreated]
      end>
    Resource = 'banco/{id}'
    Response = RESTResponse2
    Left = 312
    Top = 104
  end
  object RESTResponse1: TRESTResponse
    ContentType = 'application/json'
    Left = 216
    Top = 216
  end
  object RESTResponse2: TRESTResponse
    ContentType = 'text/html'
    Left = 312
    Top = 168
  end
  object RESTRequest3: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'codigo'
        Options = [poAutoCreated]
        Value = '0'
      end>
    Resource = 'banco/{codigo}'
    Response = RESTResponse3
    Left = 400
    Top = 104
  end
  object RESTResponse3: TRESTResponse
    ContentType = 'application/json'
    Left = 400
    Top = 168
  end
  object RESTRequest4: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Method = rmPOST
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        ContentType = ctAPPLICATION_JSON
      end>
    Resource = 'banco'
    Response = RESTResponse4
    Left = 472
    Top = 104
  end
  object RESTResponse4: TRESTResponse
    ContentType = 'application/json'
    Left = 472
    Top = 168
  end
  object RESTRequest5: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient2
    Method = rmPUT
    Params = <
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        ContentType = ctAPPLICATION_JSON
      end
      item
        Kind = pkURLSEGMENT
        Name = 'id'
        Options = [poAutoCreated]
      end>
    Resource = 'banco/{id}'
    Response = RESTResponse5
    Left = 544
    Top = 104
  end
  object RESTResponse5: TRESTResponse
    ContentType = 'application/json'
    Left = 544
    Top = 168
  end
end
