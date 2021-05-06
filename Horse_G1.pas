unit Horse_G1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, cxCheckGroup, Datasnap.DBClient, System.UITypes;

type
  TfrmHorse = class(TForm)
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
    Panel3: TPanel;
    ckgStatus: TcxCheckGroup;
    gridMain: TcxGrid;
    gridMainDBTableView1: TcxGridDBTableView;
    gridMainLevel1: TcxGridLevel;
    cliMain: TClientDataSet;
    dtsMain: TDataSource;
    cliMaincodigo: TIntegerField;
    cliMainnome: TStringField;
    gridMainDBTableView1codigo: TcxGridDBColumn;
    gridMainDBTableView1nome: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridMainDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
    procedure btnEsquerdaClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure dtsMainDataChange(Sender: TObject; Field: TField);
  private
    FCodigo: string;
    FNome: string;
    { Private declarations }
  public
    { Public declarations }
    procedure SetActivePage;
    procedure AbreForm(estado: string);
    property codigo: string read FCodigo write FCodigo;
    property nome: string read FNome write FNome;
  end;

var
  frmHorse: TfrmHorse;
  PageActive: integer;
  const Empty = '';

implementation

{$R *.dfm}

uses
  DAO, MainForm, JSon, DataSet.Serialize, Horse_F1;

procedure TfrmHorse.AbreForm(estado: string);
var
  frmHorse: TfrmHorse_F1;
begin
  frmHorse:= TfrmHorse_F1.Create(Self);

  try
    frmHorse.estado := estado;
    frmHorse.codigo := codigo;
    frmHorse.nome   := nome;
    frmHorse.ShowModal;
  finally
    frmHorse.Free;
    btnCarregar.Click;
  end;
end;

procedure TfrmHorse.btnCarregarClick(Sender: TObject);
var
  JSonValue: TJSonValue;
  JsonArray: TJSonArray;
  JSonItens: TJSonValue;
begin
  cliMain.EmptyDataSet;
  frmDAO.RESTRequest1.Execute;
  try
    JsonValue := TJSonObject.ParseJSONValue(Trim(frmDAO.RESTResponse1.Content));
    JsonArray:= JsonValue.GetValue<TJSOnArray>('');

    for JSonItens in JsonArray do
      with dtsMain.DataSet do
      begin
        Append;
        FieldByName('codigo').Text  := JsonItens.GetValue<integer>('codigo').ToString;
        FieldByName('nome').Text := JsonItens.GetValue<string>('nome');
        Post;
      end;
    dtsMain.DataSet.First;
  finally
    JsonValue.Free;
  end;
end;

procedure TfrmHorse.btnDireitaClick(Sender: TObject);
begin
  SetActivePage;
  if (frmMain.pgControl.PageCount -1 >= frmMain.pgControl.Pages[PageActive].PageIndex + 1) then
  begin
    frmMain.pgControl.Pages[PageActive].PageIndex:= frmMain.pgControl.Pages[PageActive].PageIndex + 1;
    SetActivePage;
  end;
end;

procedure TfrmHorse.btnEditarClick(Sender: TObject);
begin
  AbreForm('editar');
end;

procedure TfrmHorse.btnEsquerdaClick(Sender: TObject);
begin
  SetActivePage;
  if (frmMain.pgControl.Pages[PageActive].PageIndex > 0) then
  begin
    frmMain.pgControl.Pages[PageActive].PageIndex:= frmMain.pgControl.Pages[PageActive].PageIndex - 1;
    SetActivePage;
  end;
end;

procedure TfrmHorse.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    frmDAO.RESTRequest2.Params.ParameterByName('id').Value := dtsMain.DataSet.FieldByName('codigo').Text;
    frmDAO.RESTRequest2.Execute;
    dtsMain.DataSet.Delete;
    ShowMessage('Excluído');
  end;
end;

procedure TfrmHorse.btnFecharClick(Sender: TObject);
begin
  SetActivePage;
  frmMain.pgControl.Pages[PageActive].Destroy;
end;

procedure TfrmHorse.btnNovoClick(Sender: TObject);
begin
  AbreForm('novo');
end;

procedure TfrmHorse.btnPrimeiroClick(Sender: TObject);
begin
  dtsMain.DataSet.First;
end;

procedure TfrmHorse.btnUltimoClick(Sender: TObject);
begin
  dtsMain.DataSet.Last;
end;

procedure TfrmHorse.btnVisualizarClick(Sender: TObject);
begin
  AbreForm('visualizar');
end;

procedure TfrmHorse.Button1Click(Sender: TObject);
begin
  dtsMain.DataSet.Next;
end;

procedure TfrmHorse.Button2Click(Sender: TObject);
begin
  dtsMain.DataSet.Prior;
end;

procedure TfrmHorse.dtsMainDataChange(Sender: TObject; Field: TField);
begin
  codigo := dtsMain.DataSet.FieldByName('codigo').Text;
  nome   := dtsMain.DataSet.FieldByName('nome').Text;
end;

procedure TfrmHorse.FormShow(Sender: TObject);
begin
  SetActivePage;
  BorderIcons := [];
  BorderStyle := bsNone;
end;

procedure TfrmHorse.gridMainDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnEditarClick(Self);
end;

procedure TfrmHorse.SetActivePage;
var
  i: integer;
begin
  if frmMain.pgControl.RowCount > 0 then
    for i:= 0 to frmMain.pgControl.PageCount -1 do
      with frmMain.pgControl do
        if Pages[i].Caption = 'Teste Horse' then
        begin
          PageActive:= i;
          Exit;
        end;
end;

end.
