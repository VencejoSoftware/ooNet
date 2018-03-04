{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network URL address
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Address.URL;

interface

uses
  SysUtils,
  ooNet.Address,
  ooNet.Address.IP;

type
{$REGION 'documentation'}
{
  @abstract(Network URL address interface)
  Network URL address abstract definition
  @member(Port Port to access)
}
{$ENDREGION}
  IURL = interface(INetAddress)
    ['{889C3F13-E098-4237-81BA-9B0DB82160A1}']
    function Port: TIPPort;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IURL))
  @member(Text @seealso(INetAddress.Test))
  @member(Port @seealso(IURL.Port))
  @member(
    Create Object constructor
    @param(URL Uniform Resource Locator)
    @param(Port Port to access)
  )
  @member(
    New Create a new @classname as interface
    @param(URL Uniform Resource Locator)
    @param(Port Port to access)
  )
}
{$ENDREGION}

  TURL = class sealed(TInterfacedObject, IURL)
  strict private
    _URL: String;
    _Port: TIPPort;
  public
    function Text: String;
    function Port: TIPPort;
    constructor Create(const URL: String; const Port: TIPPort = - 1);
    class function New(const URL: String; const Port: TIPPort = - 1): IURL;
  end;

implementation

function TURL.Text: String;
begin
  Result := _URL;
  if _Port > - 1 then
    Result := Format('%s:%d', [Result, _Port]);
end;

function TURL.Port: TIPPort;
begin
  Result := _Port;
end;

constructor TURL.Create(const URL: String; const Port: TIPPort = - 1);
begin
  _URL := URL;
  _Port := Port;
end;

class function TURL.New(const URL: String; const Port: TIPPort = - 1): IURL;
begin
  Result := TURL.Create(URL, Port);
end;

end.
