{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.Address.IP_test;

interface

uses
  ooNet.Address.IP,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TIPTest = class sealed(TTestCase)
  strict private
    _IP: IIP;
  public
    procedure SetUp; override;
  published
    procedure FirstIs192;
    procedure SecondIs168;
    procedure ThirdIs1;
    procedure ThirdIs2;
    procedure PortIsEmpty;
    procedure AssignedPortIs666;
    procedure TextIs19216812;
    procedure TextWithPortIs19216812666;
  end;

implementation

procedure TIPTest.FirstIs192;
begin
  CheckEquals(192, _IP.FirstOctet);
end;

procedure TIPTest.SecondIs168;
begin
  CheckEquals(168, _IP.SecondOctet);
end;

procedure TIPTest.ThirdIs1;
begin
  CheckEquals(1, _IP.ThirdOctet);
end;

procedure TIPTest.ThirdIs2;
begin
  CheckEquals(2, _IP.FourthOctet);
end;

procedure TIPTest.PortIsEmpty;
begin
  CheckEquals( - 1, _IP.Port);
end;

procedure TIPTest.TextIs19216812;
begin
  CheckEquals('192.168.1.2', _IP.Text);
end;

procedure TIPTest.TextWithPortIs19216812666;
begin
  CheckEquals('192.168.1.2:666', TIP.New(192, 168, 1, 2, 666).Text);
end;

procedure TIPTest.AssignedPortIs666;
begin
  CheckEquals(666, TIP.New(192, 168, 1, 2, 666).Port);
end;

procedure TIPTest.SetUp;
begin
  inherited;
  _IP := TIP.New(192, 168, 1, 2);
end;

initialization

RegisterTest(TIPTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
