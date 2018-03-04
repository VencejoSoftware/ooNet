{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.Encoding_test;

interface

uses
  SysUtils,
  ooNet.Encoding,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TNetEncodingTest = class(TTestCase)
  published
    procedure UnknownResolvedIsEmpty;
    procedure UTF8ResolvedIsUTF8;
  end;

implementation

procedure TNetEncodingTest.UTF8ResolvedIsUTF8;
begin
  CheckEquals('utf-8', TNetEncoding.New(UTF8).Text);
end;

procedure TNetEncodingTest.UnknownResolvedIsEmpty;
begin
  CheckEquals(EmptyStr, TNetEncoding.New(Unknown).Text);
end;

initialization

RegisterTest(TNetEncodingTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
