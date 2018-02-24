{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooNet.Address.URL_test in '..\code\ooNet.Address.URL_test.pas',
  ooNet.Address.IP_test in '..\code\ooNet.Address.IP_test.pas',
  ooNet.Protocol_test in '..\code\ooNet.Protocol_test.pas',
  ooNet.Credential_test in '..\code\ooNet.Credential_test.pas',
  ooNet.AccessPoint_test in '..\code\ooNet.AccessPoint_test.pas';

{$R *.RES}

begin
  Run;

end.
