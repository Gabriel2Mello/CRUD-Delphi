unit X1104_F1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, Data.DB, MemDS, DBAccess, Uni, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxDBEdit;

type
  TfrmX1104_F1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pagControl: TcxPageControl;
    tabDados: TcxTabSheet;
    dtsMaster: TDataSource;
    qryMaster: TUniQuery;
    edtId: TcxDBTextEdit;
    Label2: TLabel;
    edtNome: TcxDBTextEdit;
    Label4: TLabel;
    Label3: TLabel;
    cbxStatus: TcxComboBox;
    Label5: TLabel;
    edtFone: TcxDBTextEdit;
    Label6: TLabel;
    edtEmail: TcxDBTextEdit;
    qryMasterID: TIntegerField;
    qryMasterNOME: TStringField;
    qryMasterFONE: TStringField;
    qryMasterEMAIL: TStringField;
    qryMasterDM_STATUS: TByteField;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    qryMasterFK_X1102: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FEstado: string;
    FidFornecedor: string;
    { Private declarations }
  public
    { Public declarations }
    property estado: string read FEstado write FEstado;
    property idFornecedor: string read FidFornecedor write FidFornecedor;
    function VerificaEstado(state: string): Boolean;
  end;

var
  frmX1104_F1: TfrmX1104_F1;

implementation

{$R *.dfm}

uses
  DAO, X1102_F1;

procedure TfrmX1104_F1.btnFecharClick(Sender: TObject);
begin
  if not frmX1102_F1.VerificaEstado then
    dtsMaster.DataSet.Cancel;

  Self.Close;
end;

procedure TfrmX1104_F1.btnSalvarClick(Sender: TObject);
begin
  if VerificaEstado(estado) then
  begin
    if Trim(edtNome.Text).IsEmpty then
    begin
      ShowMessage('Campo Nome sem valor!');
      edtNome.SetFocus;
      Exit;
    end;

    case cbxStatus.ItemIndex of
      0: dtsMaster.DataSet.FieldByName('DM_STATUS').Text:= '1';
      1: dtsMaster.DataSet.FieldByName('DM_STATUS').Text:= '2';
      2: dtsMaster.DataSet.FieldByName('DM_STATUS').Text:= '3';
    else
      dtsMaster.DataSet.FieldByName('DM_STATUS').Text:= '1';
    end;

    if estado = 'novo' then
      dtsMaster.DataSet.FieldByName('FK_X1102').Text:= idFornecedor;

    dtsMaster.DataSet.Post;
  end;
  Self.Close;
end;

procedure TfrmX1104_F1.FormShow(Sender: TObject);
begin
  dtsMaster.DataSet.Active:= True;

  case dtsMaster.DataSet.FieldByName('DM_STATUS').Text.ToInteger of
    1: cbxStatus.ItemIndex:= 0;
    2: cbxStatus.ItemIndex:= 1;
    3: cbxStatus.ItemIndex:= 2;
  else
    cbxStatus.ItemIndex:= 0;
  end;

  if estado = 'editar' then
  begin
    dtsMaster.DataSet.Edit;
    edtNome.SetFocus;
  end
  else if estado = 'novo' then
  begin
    dtsMaster.DataSet.Append;
    edtNome.SetFocus;
  end
  else
    btnFechar.SetFocus;
end;

function TfrmX1104_F1.VerificaEstado(state: string): Boolean;
begin
  if (estado = 'editar') or (estado = 'novo') then
    result:= True
  else
    result:= False;
end;

end.
