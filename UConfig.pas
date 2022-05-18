unit UConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Uoraconnection,
  Vcl.ExtCtrls;

type
  TFrmConnection = class(TForm)
    CbTns: TComboBox;
    Button1: TButton;
    EdtOraUser: TLabeledEdit;
    EdtOraDatabase: TLabeledEdit;
    EdtOraPassword: TLabeledEdit;
    Conetar: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CbTnsSelect(Sender: TObject);
    procedure ConetarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConnection: TFrmConnection;
  OraConnection : ToraConnection;

implementation

{$R *.dfm}

uses LeOracle , DM;



procedure TFrmConnection.Button1Click(Sender: TObject);

begin
   OraConnection.ParseTNS(CbTNs);

end;

procedure TFrmConnection.CbTnsSelect(Sender: TObject);
begin
  EdtOraUser.Text := CbTns.Text;
  EdtOraDatabase.text := CbTns.Text;
end;

procedure TFrmConnection.ConetarClick(Sender: TObject);
begin
  with DM.DataModule1.Connector do
    begin
      Connected := False;
      Database := EdtOraDatabase.Text;
      User := EdtOraUser.Text;
      Password := EdtOraPassword.Text;

       try
        Connected := true;
        showmessage('Conectado!');
      except
        on e: exception do
        begin
          showmessage(e.Message);
        end;
      end;
    end;
end;

end.
