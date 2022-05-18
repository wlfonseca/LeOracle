program PLeOracle;

uses
  Vcl.Forms,
  LeOracle in 'LeOracle.pas' {MainForm},
  UConfig in 'UConfig.pas' {FrmConnection},
  Uoraconnection in 'Uoraconnection.pas',
  Vcl.Themes,
  Vcl.Styles,
  DM in 'DM.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFrmConnection, FrmConnection);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
