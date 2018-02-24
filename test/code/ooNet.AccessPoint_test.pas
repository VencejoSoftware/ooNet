{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.AccessPoint_test;

interface

uses
  ooNet.Protocol,
  ooNet.Address.IP,
  ooNet.Address,
  ooNet.Credential,
  ooNet.AccessPoint,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TNetAccessPointTest = class sealed(TTestCase)
  strict private
    _AccessPoint: INetAccessPoint;
  public
    procedure SetUp; override;
  published
    procedure AddressIsIP;
    procedure ProtocolIsUPD;
    procedure CredentialIsAdmin;
  end;

implementation

procedure TNetAccessPointTest.AddressIsIP;
begin
  CheckEquals('192.168.1.2:666', _AccessPoint.Address.Text);
end;

procedure TNetAccessPointTest.ProtocolIsUPD;
begin
  CheckTrue(TNetprotocolCode.UDP = _AccessPoint.Protocol.Code);
end;

procedure TNetAccessPointTest.CredentialIsAdmin;
begin
  CheckEquals('admin', _AccessPoint.Credential.User);
  CheckEquals('1234', _AccessPoint.Credential.Password);
end;

procedure TNetAccessPointTest.SetUp;
var
  Address: INetAddress;
  Protocol: INetProtocol;
  Credential: INetCredential;
begin
  inherited;
  Address := TIP.New(192, 168, 1, 2, 666);
  Protocol := TNetProtocol.New(UDP);
  Credential := TNetCredential.New('admin', '1234');
  _AccessPoint := TNetAccessPoint.New(Address, Protocol, Credential);
end;

initialization

RegisterTest(TNetAccessPointTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
