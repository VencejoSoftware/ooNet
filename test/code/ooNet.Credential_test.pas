{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.Credential_test;

interface

uses
  ooNet.Credential,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TNetCredentialTest = class sealed(TTestCase)
  published
    procedure UserIsAdmin;
    procedure PasswordIs1234;
  end;

implementation

procedure TNetCredentialTest.UserIsAdmin;
begin
  CheckEquals('admin', TNetCredential.New('admin', '1234').User);
end;

procedure TNetCredentialTest.PasswordIs1234;
begin
  CheckEquals('1234', TNetCredential.New('admin', '1234').Password);
end;

initialization

RegisterTest(TNetCredentialTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
