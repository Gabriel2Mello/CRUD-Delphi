unit X1102_F1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations,
  Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, MemDS,
  DBAccess, Uni, cxContainer, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxDBEdit, System.UITypes;

type
  TfrmX1102_F1 = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    btnSalvar: TButton;
    btnFechar: TButton;
    pagControl: TcxPageControl;
    TabDados: TcxTabSheet;
    dtsFornecedor: TDataSource;
    dtsContato: TDataSource;
    qryFornecedor: TUniQuery;
    qryContato: TUniQuery;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtId: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    cbxStatus: TcxComboBox;
    TabDadosContato: TcxTabSheet;
    Panel5: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnVisualizar: TButton;
    grdContato: TcxGrid;
    grdContatoDBTableView1: TcxGridDBTableView;
    grdContatoDBTableView1ID: TcxGridDBColumn;
    grdContatoDBTableView1NOME: TcxGridDBColumn;
    grdContatoDBTableView1FONE: TcxGridDBColumn;
    grdContatoDBTableView1EMAIL: TcxGridDBColumn;
    grdContatoDBTableView1DM_STATUS: TcxGridDBColumn;
    grdContatoLevel1: TcxGridLevel;
    qryFornecedorID: TIntegerField;
    qryFornecedorNOME: TStringField;
    qryFornecedorDM_STATUS: TByteField;
    qryContatoID: TIntegerField;
    qryContatoFK_X1102: TIntegerField;
    qryContatoNOME: TStringField;
    qryContatoFONE: TStringField;
    qryContatoEMAIL: TStringField;
    qryContatoDM_STATUS: TByteField;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure grdContatoDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure qryContatoDM_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FEstado: string;
    procedure EscondeContato;
    procedure AbreForm(state, id: string);
  public
    { Public declarations }
    property estado: string read FEstado write FEstado;
    function VerificaEstado(): Boolean;
  end;

var
  frmX1102_F1: TfrmX1102_F1;

implementation

{$R *.dfm}

uses
  DAO, X1104_F1;

procedure TfrmX1102_F1.AbreForm(state, id: string);
var
  formX1104_F1: TfrmX1104_F1;
begin
  formX1104_F1:= TfrmX1104_F1.Create(Self);

  try
    if state = 'novo' then
      formX1104_F1.estado:= state
    else if state = 'visualizar' then
    begin
      formX1104_F1.estado:= state;
      formX1104_F1.qryMaster.AddWhere('T.ID = ' + id);
    end
    else if (state = 'editar') then
    begin
      formX1104_F1.estado:= state;
      formX1104_F1.qryMaster.AddWhere('T.ID = ' + id);
    end;

    formX1104_F1.idFornecedor:= dtsFornecedor.DataSet.FieldByName('ID').Text;
    formX1104_F1.ShowModal;
  finally
    formX1104_F1.Free;
    dtsContato.DataSet.Refresh;
  end;
end;

procedure TfrmX1102_F1.btnEditarClick(Sender: TObject);
begin
  AbreForm('editar', dtsContato.DataSet.FieldByName('ID').Text);
end;

procedure TfrmX1102_F1.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    dtsContato.DataSet.Delete;
end;

procedure TfrmX1102_F1.btnFecharClick(Sender: TObject);
begin
  if not VerificaEstado then
    dtsFornecedor.DataSet.Cancel;

  Self.Close;
end;

procedure TfrmX1102_F1.btnNovoClick(Sender: TObject);
begin
  AbreForm(TButton(Sender).Hint, dtsContato.DataSet.FieldByName('ID').Text);
end;

procedure TfrmX1102_F1.btnSalvarClick(Sender: TObject);
begin
  if VerificaEstado then
  begin
    if Trim(edtNome.Text).IsEmpty then
    begin
      ShowMessage('Campo Nome sem valor!');
      edtNome.SetFocus;
      Exit;
    end;

    case cbxStatus.ItemIndex of
      0: dtsFornecedor.DataSet.FieldByName('DM_STATUS').Text:= '1';
      1: dtsFornecedor.DataSet.FieldByName('DM_STATUS').Text:= '2';
      2: dtsFornecedor.DataSet.FieldByName('DM_STATUS').Text:= '3';
    else
      dtsFornecedor.DataSet.FieldByName('DM_STATUS').Text:= '1';
    end;

    dtsFornecedor.DataSet.Post;
  end;

  Self.Close;
end;

procedure TfrmX1102_F1.btnVisualizarClick(Sender: TObject);
begin
  AbreForm(TButton(Sender).Hint, dtsContato.DataSet.FieldByName('ID').Text);
end;

procedure TfrmX1102_F1.EscondeContato;
begin
  TabDadosContato.TabVisible:= False;
end;

procedure TfrmX1102_F1.FormShow(Sender: TObject);
begin
  dtsFornecedor.DataSet.Active:= True;
  dtsContato.DataSet.Active:= True;
  PagControl.Properties.ActivePage:= TabDados;

  case dtsFornecedor.DataSet.FieldByName('DM_STATUS').Text.ToInteger of
    1: cbxStatus.ItemIndex:= 0;
    2: cbxStatus.ItemIndex:= 1;
    3: cbxStatus.ItemIndex:= 2;
  else
    cbxStatus.ItemIndex:= 0;
  end;

  if estado = 'editar' then
  begin
    dtsFornecedor.DataSet.Edit;
    edtNome.SetFocus;
  end
  else if estado = 'novo' then
  begin
    EscondeContato;
    dtsFornecedor.DataSet.Append;
    edtNome.SetFocus;
  end
  else
    btnFechar.SetFocus;
end;

procedure TfrmX1102_F1.grdContatoDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditarClick(Self);
end;

procedure TfrmX1102_F1.qryContatoDM_STATUSGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
var
  valorColuna: integer;
begin
  valorColuna:= Sender.Value;
  case valorColuna of
    1: Text:= 'Ativo';
    2: Text:= 'Bloqueado';
    3: Text:= 'Inativo';
  end;
end;

function TfrmX1102_F1.VerificaEstado(): Boolean;
begin
  if (estado = 'editar') or (estado = 'novo') then
    result:= True
  else
    result:= False;
end;

end.
