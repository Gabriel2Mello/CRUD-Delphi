unit Horse_F1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxDBEdit, cxPC, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmHorse_F1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pagControl: TcxPageControl;
    tabDados: TcxTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    edtCodigo: TEdit;
    edtNome: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FEstado: string;
    FCodigo: integer;
    { Private declarations }
  public
    { Public declarations }
    property estado: string read FEstado write FEstado;
    property codigo: integer read FCodigo write FCodigo;
  end;

var
  frmHorse_F1: TfrmHorse_F1;

implementation

{$R *.dfm}

uses DAO, Json;

procedure TfrmHorse_F1.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmHorse_F1.btnSalvarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmHorse_F1.FormShow(Sender: TObject);
var
  JSonValue: TJSonValue;
  JSonItens: TJSonValue;
begin
  frmDAO.RESTRequest3.Params.ParameterByName('id').Value := codigo.ToString;
  frmDAO.RESTRequest3.Execute;
  JsonValue := TJSonObject.ParseJSONValue(Trim(frmDAO.RESTResponse3.Content));

  edtCodigo.Text := JsonValue.GetValue<string>('codigo');
  edtNome.Text := JsonValue.GetValue<string>('nome');
  JsonValue.Free;
end;

end.
