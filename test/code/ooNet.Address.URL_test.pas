{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.Address.URL_test;

interface

uses
  ooNet.Address.URL,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TURLTest = class sealed(TTestCase)
  published
    procedure URLIsWWWGoogle;
    procedure URLWithPortIsSomething;
    procedure PortForURLIs900;
  end;

implementation

procedure TURLTest.URLIsWWWGoogle;
begin
  CheckEquals('www.google.com', TURL.New('www.google.com').Text);
end;

procedure TURLTest.URLWithPortIsSomething;
begin
  CheckEquals('www.someport.com:4040', TURL.New('www.someport.com', 4040).Text);
end;

procedure TURLTest.PortForURLIs900;
begin
  CheckEquals(4040, TURL.New('www.someport.com', 4040).Port);
end;

initialization

RegisterTest(TURLTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
