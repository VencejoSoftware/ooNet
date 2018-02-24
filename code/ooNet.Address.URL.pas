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
  ooNet.Address;

type
{$REGION 'documentation'}
{
  @abstract(Network URL address interface)
  Network URL address abstract definition
}
{$ENDREGION}
  IURL = interface(INetAddress)
    ['{889C3F13-E098-4237-81BA-9B0DB82160A1}']
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IURL))
  @member(Text @seealso(INetAddress.Test))
  @member(
    Create Object constructor
    @param(URL Uniform Resource Locator)
  )
  @member(
    New Create a new @classname as interface
    @param(URL Uniform Resource Locator)
  )
}
{$ENDREGION}

  TURL = class sealed(TInterfacedObject, IURL)
  strict private
    _URL: String;
  public
    function Text: String;
    constructor Create(const URL: String);
    class function New(const URL: String): IURL;
  end;

implementation

function TURL.Text: String;
begin
  Result := _URL;
end;

constructor TURL.Create(const URL: String);
begin
  _URL := URL;
end;

class function TURL.New(const URL: String): IURL;
begin
  Result := TURL.Create(URL);
end;

end.
