{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network IP address
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Address.IP;

interface

uses
  SysUtils,
  ooNet.Address;

type
{$REGION 'documentation'}
// @abstract(Network IP Port range value)
{$ENDREGION}
  TIPPort = - 1 .. 65535;

{$REGION 'documentation'}
{
  @abstract(Network IP address interface)
  Network IP address abstract definition
  @member(FirstOctet First octet)
  @member(SecondOctet Second octet)
  @member(ThirdOctet Third octet)
  @member(FourthOctet Fourth octet)
  @member(Port Port to access)
}
{$ENDREGION}

  IIP = interface(INetAddress)
    ['{3A1156DA-89EB-4991-AD16-CB59329657C4}']
    function FirstOctet: Byte;
    function SecondOctet: Byte;
    function ThirdOctet: Byte;
    function FourthOctet: Byte;
    function Port: TIPPort;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IIP))
  @member(Text @seealso(INetAddress.Text))
  @member(FirstOctet @seealso(IIP.FirstOctet))
  @member(SecondOctet @seealso(IIP.SecondOctet))
  @member(ThirdOctet @seealso(IIP.ThirdOctet))
  @member(FourthOctet @seealso(IIP.FourthOctet))
  @member(Port @seealso(IIP.Port))
  @member(
    Create Object constructor
    @param(FirstOctet First octet)
    @param(SecondOctet Second octet)
    @param(ThirdOctet Third octet)
    @param(FourthOctet Fourth octet)
    @param(Port Port to access)
  )
  @member(
    New Create a new @classname as interface
    @param(FirstOctet First octet)
    @param(SecondOctet Second octet)
    @param(ThirdOctet Third octet)
    @param(FourthOctet Fourth octet)
    @param(Port Port to access)
  )
}
{$ENDREGION}

  TIP = class sealed(TInterfacedObject, IIP)
  strict private
    _FirstOctet, _SecondOctet, _ThirdOctet, _FourthOctet: Byte;
    _Port: TIPPort;
  public
    function Text: String;
    function FirstOctet: Byte;
    function SecondOctet: Byte;
    function ThirdOctet: Byte;
    function FourthOctet: Byte;
    function Port: TIPPort;
    constructor Create(const FirstOctet, SecondOctet, ThirdOctet, FourthOctet: Byte; const Port: TIPPort);
    class function New(const FirstOctet, SecondOctet, ThirdOctet, FourthOctet: Byte; const Port: TIPPort = - 1): IIP;
  end;

implementation

function TIP.Text: String;
begin
  Result := Format('%d.%d.%d.%d', [_FirstOctet, _SecondOctet, _ThirdOctet, _FourthOctet]);
  if _Port > - 1 then
    Result := Format('%s:%d', [Result, _Port]);
end;

function TIP.FirstOctet: Byte;
begin
  Result := _FirstOctet;
end;

function TIP.SecondOctet: Byte;
begin
  Result := _SecondOctet;
end;

function TIP.ThirdOctet: Byte;
begin
  Result := _ThirdOctet;
end;

function TIP.FourthOctet: Byte;
begin
  Result := _FourthOctet;
end;

function TIP.Port: TIPPort;
begin
  Result := _Port;
end;

constructor TIP.Create(const FirstOctet, SecondOctet, ThirdOctet, FourthOctet: Byte; const Port: TIPPort);
begin
  _FirstOctet := FirstOctet;
  _SecondOctet := SecondOctet;
  _ThirdOctet := ThirdOctet;
  _FourthOctet := FourthOctet;
  _Port := Port;
end;

class function TIP.New(const FirstOctet, SecondOctet, ThirdOctet, FourthOctet: Byte; const Port: TIPPort = - 1): IIP;
begin
  Result := TIP.Create(FirstOctet, SecondOctet, ThirdOctet, FourthOctet, Port);
end;

end.
