unit DAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UniProvider, SQLServerUniProvider,
  Data.DB, DBAccess, Uni, REST.Types, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TfrmDAO = class(TForm)
    UniConnection1: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    RESTRequest1: TRESTRequest;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponse2: TRESTResponse;
    RESTRequest3: TRESTRequest;
    RESTResponse3: TRESTResponse;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDAO: TfrmDAO;

implementation

{$R *.dfm}

end.
