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
  end;

implementation

procedure TURLTest.URLIsWWWGoogle;
begin
  CheckEquals('www.google.com', TURL.New('www.google.com').Text);
end;

initialization

RegisterTest(TURLTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
