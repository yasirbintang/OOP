unit uConnection;

interface
uses
  uADStanIntf, uADStanOption,forms, classes,
  uADStanError, uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADCompClient, DB, DBClient, Provider;

type
  TConnection = class(TObject)
  public
    class function ConnectDB(AAppName ,ADBEngine, AServer, ADatabase, AUser ,
        APassword, APort : String): Boolean;
    class function ExecuteSQL(ASQL : String): Boolean;
    class function OpenQuery(ASQL : String; AOwner : TComponent = nil):
        TClientDataSet;
  end;

var
  FDConnection : TADConnection;
  FDTransaction: TADTransaction;


implementation

class function TConnection.ConnectDB(AAppName ,ADBEngine, AServer, ADatabase,
    AUser , APassword, APort : String): Boolean;

begin
  Result := False;

  FDConnection := TADConnection.Create(Application);
  FDTransaction:= TADTransaction.Create(Application);

  FDConnection.Transaction := FDTransaction;

  FDConnection.DriverName := ADBEngine;
  FDConnection.LoginPrompt:= False;

  //FDConnection.Params.Add('Server=' + AServer);
//  FDConnection.Params.Add('Database=' + ADatabase);
//  FDConnection.Params.Add('User_Name=' + AUser);
//  FDConnection.Params.Add('Password=' + APassword);

    FDConnection.Params.Add('Server=' + AServer);
    FDConnection.Params.Add('Database=' + ADatabase);
    FDConnection.Params.Add('User_Name=' + AUser);
    FDConnection.Params.Add('Password=' + APassword);



  if APort <> '' then
    FDConnection.Params.Add('Port=' + APort);

  FDConnection.Connected := True;

  if FDConnection.Connected then
    Result := True;


end;

class function TConnection.ExecuteSQL(ASQL : String): Boolean;
begin
  try
    FDConnection.ExecSQL(ASQL);
    Result := True;
  except
    raise
  end;
end;

class function TConnection.OpenQuery(ASQL : String; AOwner : TComponent = nil):
    TClientDataSet;
var
   LDSP: TDataSetProvider;
   LSQLQuery: TADQuery;
begin
  if AOwner = nil then
    AOwner := Application;

  Result      := TClientDataSet.Create(AOwner);
  LDSP        := TDataSetProvider.Create(Result);
  LSQLQuery   := TADQuery.Create(LDSP);
  LSQLQuery.FetchOptions.Unidirectional := False;

  LSQLQuery.Connection := FDConnection;
  LSQLQuery.SQL.Append(ASQL);

  LDSP.DataSet            := LSQLQuery;
  Result.SetProvider(LDSP);
  Result.Open;
end;

end.
