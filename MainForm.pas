unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Tabs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, dxSkinsCore, cxClasses,
  cxLookAndFeels, dxSkinsForm, Uni;

type
  TfrmMain = class(TForm)
    pgControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    btnFuncionario: TButton;
    Panel3: TPanel;
    btnFornecedor: TButton;
    Panel4: TPanel;
    btnHorse: TButton;
    procedure btnFuncionarioClick(Sender: TObject);
    procedure btnFornecedorClick(Sender: TObject);
    procedure btnHorseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FConexao: TUniConnection;
  public
    { Public declarations }
    property Conexao : TUniConnection read FConexao write FConexao;

    procedure AbaFuncionario();
    procedure AbaFornecedor();
    procedure AbaHorse();
    procedure ValidaAbaAberta(Control: TPageControl; NomeAba: string);
    function GetBanco: TUniQuery;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  X1101_G1, X1102_G1, Horse_G1, DAO;

{ TfrmMain }

function TfrmMain.GetBanco: TUniQuery;
var
  qryBanco: TUniQuery;
begin
  qryBanco := TUniQuery.Create(nil);
  try
    qryBanco.Connection:= frmDAO.UniConnection1;
    qryBanco.SQL.Clear;
    qryBanco.SQL.Add('SELECT T.* FROM T1005 T');
    qryBanco.Execute;
    Result := qryBanco;
  finally
    //FreeAndNil(qryBanco);
  end;
end;

procedure TfrmMain.btnFornecedorClick(Sender: TObject);
begin
  AbaFornecedor;
  ValidaAbaAberta(pgControl, 'TST - Fornecedor');
end;

procedure TfrmMain.btnFuncionarioClick(Sender: TObject);
begin
  AbaFuncionario;
  ValidaAbaAberta(pgControl, 'TST - Funcionário');
end;

procedure TfrmMain.btnHorseClick(Sender: TObject);
begin
  AbaHorse;
  ValidaAbaAberta(pgControl, 'Teste Horse')
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmMain.ValidaAbaAberta(Control: TPageControl; NomeAba: string);
var
  i: integer;
begin
  if Control.RowCount > 0 then
    for i:= 0 to Control.PageCount -1 do
      with Control do
        if Pages[i].Caption = NomeAba then
        begin
          ActivePageIndex := i;
          Abort;
        end;
end;

procedure TfrmMain.AbaFornecedor;
var
  frmX1102_G1: TfrmX1102_G1;
  TabSheet: TTabSheet;
begin
  ValidaAbaAberta(pgControl, 'TST - Fornecedor');
  TabSheet:= TTabSheet.Create(Self);
  TabSheet.Name:= 'tbFornecedor';
  TabSheet.Caption:= 'TST - Fornecedor';

  frmX1102_G1:= TfrmX1102_G1.Create(Self);
  frmX1102_G1.Parent:= TabSheet;
  TabSheet.PageControl := pgControl;
  frmX1102_G1.Show;
end;

procedure TfrmMain.AbaFuncionario;
var
  frmX1101_G1: TfrmX1101_G1;
  TabSheet: TTabSheet;
begin
  ValidaAbaAberta(pgControl, 'TST - Funcionário');
  TabSheet:= TTabSheet.Create(Self);
  TabSheet.Name:= 'tbFuncionario';
  TabSheet.Caption:= 'TST - Funcionário';

  frmX1101_G1:= TfrmX1101_G1.Create(Self);
  frmX1101_G1.Parent:= TabSheet;
  TabSheet.PageControl := pgControl;
  frmX1101_G1.Show;
end;

procedure TfrmMain.AbaHorse;
var
  frmHorse_G1: TfrmHorse;
  TabSheet: TTabSheet;
begin
  ValidaAbaAberta(pgControl, 'Teste Horse');
  TabSheet:= TTabSheet.Create(Self);
  TabSheet.Name:= 'tbHorse';
  TabSheet.Caption:= 'Teste Horse';

  frmHorse_G1:= TfrmHorse.Create(Self);
  frmHorse_G1.Parent:= TabSheet;
  TabSheet.PageControl := pgControl;
  frmHorse_G1.Show;
end;

end.
