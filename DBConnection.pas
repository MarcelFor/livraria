unit DBConnection;

interface

uses Data.DBXCommon, System.SysUtils;

type
  TDBConnection = class
  strict private
    FConnection: TDBXConnection;
    FCommand: TDBXCommand;
    class var FInstance: TDBConnection;
    constructor CreatePrivate;
  public
    constructor Create;
    class function GetInstance: TDBConnection;
    property Command: TDBXCommand read FCommand;
  end;

implementation

{ TDBConnection }

constructor TDBConnection.Create;
begin
  raise Exception.Create('Para obter uma instância de TDBConnection utilize TDBConnection.GetInstance');
end;

constructor TDBConnection.CreatePrivate;
begin
  FConnection := TDBXConnectionFactory.GetConnectionFactory.GetConnection('LIVRARIA', 'SYSDBA', 'masterkey');
  FCommand := FConnection.CreateCommand;
end;

class function TDBConnection.GetInstance: TDBConnection;
begin
  if not Assigned(FInstance) then
    FInstance := TDBConnection.CreatePrivate;
  Result := FInstance;
end;

end.
