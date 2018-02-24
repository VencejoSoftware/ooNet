{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network access point
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.AccessPoint;

interface

uses
  ooNet.Address,
  ooNet.Protocol,
  ooNet.Credential;

type
{$REGION 'documentation'}
{
  @abstract(Network access point interface)
  Network access point abstract definition
  @member(Address Network address)
  @member(Protocol Network protocol)
  @member(Credential Access credential)
}
{$ENDREGION}
  INetAccessPoint = interface
    ['{0F79B177-40DA-49AD-B350-BAB100EBA37B}']
    function Address: INetAddress;
    function Protocol: INetProtocol;
    function Credential: INetCredential;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(INetAccessPoint))
  @member(Address @seealso(INetAccessPoint.Address))
  @member(Protocol @seealso(INetAccessPoint.Protocol))
  @member(Credential @seealso(INetAccessPoint.Credential))
  @member(
    Create Object constructor
    @param(Address Network address)
    @param(Protocol Network protocol)
    @param(Credential Access credential)
  )
  @member(
    New Create a new @classname as interface
    @param(Address Network address)
    @param(Protocol Network protocol)
    @param(Credential Access credential)
  )
}
{$ENDREGION}

  TNetAccessPoint = class sealed(TInterfacedObject, INetAccessPoint)
  strict private
    _Address: INetAddress;
    _Protocol: INetProtocol;
    _Credential: INetCredential;
  public
    function Address: INetAddress;
    function Protocol: INetProtocol;
    function Credential: INetCredential;
    constructor Create(const Address: INetAddress; const Protocol: INetProtocol; const Credential: INetCredential);
    class function New(const Address: INetAddress; const Protocol: INetProtocol; const Credential: INetCredential)
      : INetAccessPoint;
  end;

implementation

function TNetAccessPoint.Address: INetAddress;
begin
  Result := _Address;
end;

function TNetAccessPoint.Protocol: INetProtocol;
begin
  Result := _Protocol;
end;

function TNetAccessPoint.Credential: INetCredential;
begin
  Result := _Credential;
end;

constructor TNetAccessPoint.Create(const Address: INetAddress; const Protocol: INetProtocol;
  const Credential: INetCredential);
begin
  _Address := Address;
  _Protocol := Protocol;
  _Credential := Credential;
end;

class function TNetAccessPoint.New(const Address: INetAddress; const Protocol: INetProtocol;
  const Credential: INetCredential): INetAccessPoint;
begin
  Result := TNetAccessPoint.Create(Address, Protocol, Credential);
end;

end.
