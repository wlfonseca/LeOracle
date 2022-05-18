unit LeOracle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Registry, Vcl.StdCtrls,
  ZAbstractConnection, ZConnection, System.Actions, Vcl.ActnList,
   Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Menus,Uoraconnection;

type
  TMainForm = class(TForm)
    ZConnection1: TZConnection;
    MainMenu1: TMainMenu;
    Configurar1: TMenuItem;
    procedure Configurar1Click(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  slTNSConfig: TStringList;
  Oraconnection : TOraConnection;
implementation

{$R *.dfm}

uses UConfig;

procedure TMainForm.Configurar1Click(Sender: TObject);
  var
  FormConfig : Tform;
begin
   FormConfig:= TFrmConnection.Create(nil);
   FormConfig.ShowModal;
   FreeAndNIL( FormConfig );
end;

end.
