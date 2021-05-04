unit X1101_F1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxBarBuiltInMenu, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, Data.DB, MemDS,
  DBAccess, Uni, dxSkinsCore, cxMaskEdit, cxDropDownEdit;

type
  TfrmX1101_F1 = class(TForm)
    pagControl: TcxPageControl;
    Panel1: TPanel;
    Label1: TLabel;
    tabDados: TcxTabSheet;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtNome: TcxDBTextEdit;
    edtId: TcxDBTextEdit;
    Label4: TLabel;
    dtsMaster: TDataSource;
    qryMaster: TUniQuery;
    qryMasterID: TIntegerField;
    qryMasterNOME: TStringField;
    qryMasterDM_STATUS: TByteField;
    cbxStatus: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FEstado: string;
    function VerificaEstado(state: string): Boolean;
  public
    { Public declarations }
    property estado: string read FEstado write FEstado;
  end;

var
  frmX1101_F1: TfrmX1101_F1;

implementation

{$R *.dfm}

uses
  DAO;

procedure TfrmX1101_F1.btnFecharClick(Sender: TObject);
begin
  if not VerificaEstado(estado) then
    dtsMaster.DataSet.Cancel;

  Self.Close;
end;

procedure TfrmX1101_F1.btnSalvarClick(Sender: TObject);
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

    dtsMaster.DataSet.Post;
  end;

  Self.Close;
end;

procedure TfrmX1101_F1.FormShow(Sender: TObject);
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

function TfrmX1101_F1.VerificaEstado(state: string): Boolean;
begin
  if (estado = 'editar') or (estado = 'novo') then
    result:= True
  else
    result:= False;
end;

end.
