unit X1102_G1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MemDS, DBAccess, Uni, cxContainer, cxGroupBox, cxCheckGroup, System.UITypes;

type
  TfrmX1102_G1 = class(TForm)
    Panel2: TPanel;
    btnUltimo: TButton;
    btnPrimeiro: TButton;
    Button2: TButton;
    Button1: TButton;
    btnFechar: TButton;
    btnEsquerda: TButton;
    btnDireita: TButton;
    btnVisualizar: TButton;
    btnExcluir: TButton;
    btnEditar: TButton;
    btnNovo: TButton;
    btnCarregar: TButton;
    gridMainDBTableView1: TcxGridDBTableView;
    gridMainLevel1: TcxGridLevel;
    gridMain: TcxGrid;
    dtsGrid: TDataSource;
    qryGrid: TUniQuery;
    gridMainDBTableView1ID: TcxGridDBColumn;
    gridMainDBTableView1NOME: TcxGridDBColumn;
    gridMainDBTableView1DM_STATUS: TcxGridDBColumn;
    Panel3: TPanel;
    ckgStatus: TcxCheckGroup;
    qryGridID: TIntegerField;
    qryGridNOME: TStringField;
    qryGridDM_STATUS: TByteField;
    procedure FormShow(Sender: TObject);
    procedure btnEsquerdaClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure gridMainDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure qryGridDM_STATUSGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetActivePage;
    procedure SQLFiltro;
    procedure AbreForm(state: string; id: string);
    function VerificaActive(DataSource: TDataSource): Boolean;
    function FiltroStatus: string;
    function MenosUm(strAux: string): string;
  end;

var
  frmX1102_G1: TfrmX1102_G1;
  PageActive: integer;
  const Empty = '';

implementation

{$R *.dfm}

uses
  DAO, MainForm, X1102_F1;

procedure TfrmX1102_G1.AbreForm(state, id: string);
var
  formX1102_F1: TfrmX1102_F1;
begin
  formX1102_F1:= TfrmX1102_F1.Create(Self);

  try
    if state <> 'novo' then
    begin
      formX1102_F1.qryFornecedor.AddWhere('T.ID = ' + id);
      formX1102_F1.qryContato.AddWhere('T.FK_X1102 = ' + id);
    end;

    formX1102_F1.estado := state;
    formX1102_F1.ShowModal;
  finally
    formX1102_F1.Free;
    dtsGrid.DataSet.Refresh;
  end;
end;

procedure TfrmX1102_G1.btnCarregarClick(Sender: TObject);
var
  F:Tform;
  MSG: Tlabel;
  Borda: TShape;
begin
  Screen.Cursor := crHourGlass;
  F:=  TForm.Create(Application);
  try
    F.BorderStyle:= bsNone;
    F.Position:= poMainFormCenter;
    F.Width:= 100;
    F.Height:= 16;

    Borda:= TShape.Create(Application);
    Borda.Parent:= F;
    Borda.Align:= alClient;

    MSG:=  TLabel.Create(Application);
    MSG.Parent:= F;
    MSG.Transparent:= True;
    MSG.AutoSize:= False;
    MSG.Width:= 98;
    Msg.Caption:= 'Aguarde';
    MSG.Alignment:= taCenter;

    F.Show;
    F.Update;

    SQLFiltro;
    dtsGrid.DataSet.Active:= True;
    dtsGrid.DataSet.Refresh;
  finally
    F.Free;
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfrmX1102_G1.btnDireitaClick(Sender: TObject);
begin
  SetActivePage;
  if (frmMain.pgControl.PageCount -1 >= frmMain.pgControl.Pages[PageActive].PageIndex + 1) then
  begin
    frmMain.pgControl.Pages[PageActive].PageIndex:= frmMain.pgControl.Pages[PageActive].PageIndex + 1;
    SetActivePage;
  end;
end;

procedure TfrmX1102_G1.btnEditarClick(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    AbreForm('editar', qryGrid.FieldByName('ID').Text);
end;

procedure TfrmX1102_G1.btnEsquerdaClick(Sender: TObject);
begin
  SetActivePage;
  if (frmMain.pgControl.Pages[PageActive].PageIndex > 0) then
  begin
    frmMain.pgControl.Pages[PageActive].PageIndex:= frmMain.pgControl.Pages[PageActive].PageIndex - 1;
    SetActivePage;
  end;
end;

procedure TfrmX1102_G1.btnExcluirClick(Sender: TObject);
var
  qryAux: TUniQuery;
begin
  if VerificaActive(dtsGrid) then
    if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      Screen.Cursor := crHourGlass;
      qryAux:= TUniQuery.Create(nil);
      qryAux.Connection:= frmDAO.UniConnection1;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(Format('DELETE FROM X1104 WHERE FK_X1102 = %s', [dtsGrid.DataSet.FieldByName('ID').Text]));
      qryAux.Execute;
      dtsGrid.DataSet.Delete;
      FreeAndNil(qryAux);
      Screen.Cursor:= crDefault;
    end;
end;

procedure TfrmX1102_G1.btnFecharClick(Sender: TObject);
begin
  SetActivePage;
  frmMain.pgControl.Pages[PageActive].Destroy;
end;

procedure TfrmX1102_G1.btnNovoClick(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    AbreForm('novo', dtsGrid.DataSet.FieldByName('ID').Text);
end;

procedure TfrmX1102_G1.btnPrimeiroClick(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    dtsGrid.DataSet.First;
end;

procedure TfrmX1102_G1.btnUltimoClick(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    dtsGrid.DataSet.Last;
end;

procedure TfrmX1102_G1.btnVisualizarClick(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    AbreForm(Empty, qryGrid.FieldByName('ID').Text);
end;

procedure TfrmX1102_G1.Button1Click(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    dtsGrid.DataSet.Next;
end;

procedure TfrmX1102_G1.Button2Click(Sender: TObject);
begin
  if VerificaActive(dtsGrid) then
    dtsGrid.DataSet.Prior;
end;

function TfrmX1102_G1.FiltroStatus: string;
var
  strAux: string;
begin
  strAux:= Empty;
  if ckgStatus.States[0] = cbsChecked then strAux:= '1,';
  if ckgStatus.States[1] = cbsChecked then strAux:= strAux + '2,';
  if ckgStatus.States[2] = cbsChecked then strAux:= strAux + '3,';

  result:= strAux;
end;

procedure TfrmX1102_G1.FormShow(Sender: TObject);
begin
  SetActivePage;
  BorderIcons := [];
  BorderStyle := bsNone;
end;

procedure TfrmX1102_G1.gridMainDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditarClick(Self);
end;

function TfrmX1102_G1.MenosUm(strAux: string): string;
begin
  strAux := Copy(strAux, 1, Length(strAux)-1);
  result := strAux;
end;

procedure TfrmX1102_G1.qryGridDM_STATUSGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
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

procedure TfrmX1102_G1.SetActivePage;
var
  i: integer;
begin
  if frmMain.pgControl.RowCount > 0 then
    for i:= 0 to frmMain.pgControl.PageCount -1 do
      with frmMain.pgControl do
        if Pages[i].Caption = 'TST - Fornecedor' then
        begin
          PageActive:= i;
          Exit;
        end;
end;

procedure TfrmX1102_G1.SQLFiltro;
var
  strAux: string;
begin
  strAux:= Empty;
  strAux:= FiltroStatus;

  qryGrid.SQL.Clear;
  if strAux.IsEmpty then
    qryGrid.SQL.Add( 'SELECT T.* FROM X1102 T' )
  else
    qryGrid.SQL.Add(Format('SELECT T.* FROM X1102 T WHERE T.DM_STATUS IN(%s)', [MenosUm(strAux)]));
end;

function TfrmX1102_G1.VerificaActive(DataSource: TDataSource): Boolean;
begin
  if DataSource.DataSet.Active = True then
    result:= True
  else
    result:= False;
end;

end.
