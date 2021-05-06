program ProgramaX;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  X1101_G1 in 'X1101_G1.pas' {frmX1101_G1},
  DAO in 'DAO.pas' {frmDAO},
  X1101_F1 in 'X1101_F1.pas' {frmX1101_F1},
  X1102_G1 in 'X1102_G1.pas' {frmX1102_G1},
  X1102_F1 in 'X1102_F1.pas' {frmX1102_F1},
  X1104_F1 in 'X1104_F1.pas' {frmX1104_F1},
  Horse_G1 in 'Horse_G1.pas' {frmHorse},
  Horse_F1 in 'Horse_F1.pas' {frmHorse_F1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDAO, frmDAO);
  Application.CreateForm(TfrmX1102_F1, frmX1102_F1);
  Application.CreateForm(TfrmX1104_F1, frmX1104_F1);
  Application.CreateForm(TfrmHorse, frmHorse);
  Application.CreateForm(TfrmHorse_F1, frmHorse_F1);
  Application.Run;
end.
