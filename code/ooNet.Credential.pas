{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network authentication credential
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Credential;

interface

uses
  SysUtils;

type

{$REGION 'documentation'}
{
  @abstract(Network authentication credential interface)
  Network authentication credential abstract definition
  @member(User User identification)
  @member(Password Password to access)
    @member(Text Simplified text for credential)
}
{$ENDREGION}
  INetCredential = interface
    ['{03BE99D6-205D-4DAE-99D0-63D67C5A4E83}']
    function User: String;
    function Password: String;
    function Text: String;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(INetCredential))
  @member(User @seealso(INetCredential.User))
  @member(Password @seealso(INetCredential.Password))
  @member(Text @seealso(INetCredential.Text))
  @member(
    Create Object constructor
    @param(User User identification)
    @param(Password Password to access)
  )
  @member(
    New Create a new @classname as interface
    @param(User User identification)
    @param(Password Password to access)
  )
}
{$ENDREGION}

  TNetCredential = class sealed(TInterfacedObject, INetCredential)
  strict private
    _User, _Password: String;
  public
    function User: String;
    function Password: String;
    function Text: String;
    constructor Create(const User, Password: String);
    class function New(const User, Password: String): INetCredential;
  end;

implementation

function TNetCredential.User: String;
begin
  Result := _User;
end;

function TNetCredential.Password: String;
begin
  Result := _Password;
end;

function TNetCredential.Text: String;
begin
  Result := Format('%s:%s', [_User, _Password]);
end;

constructor TNetCredential.Create(const User, Password: String);
begin
  _User := User;
  _Password := Password;
end;

class function TNetCredential.New(const User, Password: String): INetCredential;
begin
  Result := TNetCredential.Create(User, Password);
end;

end.
