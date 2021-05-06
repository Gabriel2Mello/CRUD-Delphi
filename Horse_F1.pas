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
    FCodigo: string;
    FNome: string;
    { Private declarations }
  public
    { Public declarations }
    procedure NovoRegistro;
    procedure Editar;
    property estado: string read FEstado write FEstado;
    property codigo: string read FCodigo write FCodigo;
    property nome: string read FNome write FNome;
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
  if estado = 'novo' then
    NovoRegistro
  else
  if estado = 'editar' then
    Editar;

  Self.Close;
end;

procedure TfrmHorse_F1.Editar;
var
  JsonObj: TJSONObject;
begin
  if ( Trim(nome) <> Trim(edtNome.Text) ) or ( Trim(codigo) <> Trim(edtCodigo.Text) ) then
  begin
    JsonObj := TJSONObject.Create;
    try
      JsonObj.AddPair('CODIGO', TJSONNumber.Create((edtCodigo.Text)));
      JsonObj.AddPair('NOME', edtNome.Text);
      frmDAO.RESTRequest5.Params.ParameterByName('body').Value := JsonObj.ToString;
      frmDAO.RESTRequest5.Params.ParameterByName('id').Value := codigo;
      frmDAO.RESTRequest5.Execute;
    finally
      JsonObj.Free;
    end;
  end;
end;

procedure TfrmHorse_F1.FormShow(Sender: TObject);
var
  JSonValue: TJSonValue;
begin
  if estado = 'novo' then
  begin
    edtCodigo.SetFocus;
    Abort;
  end;

  try
    frmDAO.RESTRequest3.Params.ParameterByName('codigo').Value := codigo;
    frmDAO.RESTRequest3.Execute;
    JsonValue := TJSonObject.ParseJSONValue(Trim(frmDAO.RESTResponse3.Content));

    edtCodigo.Text := JsonValue.GetValue<string>('codigo');
    edtNome.Text := JsonValue.GetValue<string>('nome');
  finally
    JsonValue.Free;
  end;

  if estado = 'editar' then
    btnSalvar.SetFocus
  else
  begin
    edtCodigo.ReadOnly := True;
    edtNome.ReadOnly := True;
    btnFechar.SetFocus;
  end;
end;

procedure TfrmHorse_F1.NovoRegistro;
var
  JsonObj: TJSONObject;
begin
  JsonObj := TJSONObject.Create;
  try
    JsonObj.AddPair('CODIGO', TJSONNumber.Create((edtCodigo.Text)));
    JsonObj.AddPair('NOME', edtNome.Text);
    frmDAO.RESTRequest4.Params.ParameterByName('body').Value := JsonObj.ToString;
    frmDAO.RESTRequest4.Execute;
  finally
    JsonObj.Free;
  end;
end;

end.
