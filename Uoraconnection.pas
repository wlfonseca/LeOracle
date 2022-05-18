unit Uoraconnection;

interface

uses
  Vcl.StdCtrls,DIalogs,System.classes,System.Sysutils,Registry,winapi.windows,ZConnection,ZAbstractConnection;

  Type
    TOraConnection = class
      private
        function GetTNSNamesPath: string;
      public
        procedure ParseTNS(Cb: TCombobox);
    end;

  var
   slTNSConfig: TStringList;

implementation




procedure TOraConnection.ParseTNS(Cb : TCombobox);
var
  slTemp: TStringList;
  sPath, sTemp: string;
  i: integer;
begin
  slTemp := TStringList.Create;
  slTNSConfig := TStringList.Create;
  try
    sPath := GetTNSNamesPath;
    ShowMessage(sPath);
    if (length(sPath) < 33) or (not FileExists(sPath)) then
      messageDlg('tnsnames.ora not found.', mtError, [mbOk], 0)
    else
    begin
      slTemp.LoadFromFile(sPath);    // Load tnsnames.ora
      sTemp := StringReplace(StringReplace(UpperCase(slTemp.Text), ' ', '', [rfReplaceAll]), ')', '', [rfReplaceAll]);  // delete ')' and spaces
      slTemp.Clear;
      slTemp.Delimiter := '(';
      slTemp.DelimitedText := sTemp;   // parse like  Name=Value
      sTemp := '';
      for i := 0 to slTemp.Count - 1 do
      begin
        if pos('DESCRIPTION', slTemp[i]) = 1 then  // Get Name before description
        begin
          sTemp := StringReplace(slTemp[i - 1], '=', '', [rfReplaceAll]);
          Cb.Items.Add(sTemp);    // Fill combobox
        end;
        if length(slTemp.ValueFromIndex[i]) > 0 then  //Get filled Name=Value
          slTNSConfig.Add(sTemp + '_' + slTemp[i]);  // Fill TNS config like TNS_HOST=Value
      end;
      Cb.Sorted := true;
    end;
  finally
    slTemp.Free;
  end;
end;

function TOraConnection.GetTNSNamesPath: string;
var
  Reg: TRegistry;
  SubKeyNames: TStringList;
  Name: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly('SOFTWARE\ORACLE');
    SubKeyNames := TStringList.Create;
    try
      Reg.GetKeyNames(SubKeyNames);
      for Name in SubKeyNames do
       // oracle 10 save path to ORACLE_HOME in registry key like this
       // HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\KEY_OraClient10g_home1\ORACLE_HOME
       // for oracle 8 and 9 another key

        if pos('KEY_', Name) = 1 then
        begin
          if Reg.OpenKeyReadOnly('\SOFTWARE\ORACLE\' + Name) then
            Result := Reg.ReadString('ORACLE_HOME') + '\NETWORK\ADMIN\tnsnames.ora';
        end;
    finally
      SubKeyNames.Free;
    end;
  finally
    Reg.Free;
  end;
end;

end.
