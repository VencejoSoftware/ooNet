{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooNet.Protocol_test;

interface

uses
  ooNet.Protocol,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TNetProtocolTest = class sealed(TTestCase)
  published
    procedure CodeIsUnkNown;
    procedure CodeIsMemoryMap;
    procedure CodeIsPipeline;
    procedure CodeIsSerial;
    procedure CodeIsMessageQueue;
    procedure CodeIsSocket;
    procedure CodeIsUDP;
    procedure CodeIsTCP;
    procedure CodeIsHTTP;
    procedure CodeIsHTTPS;
    procedure CodeIsSSH;
    procedure CodeIsFTP;
    procedure CodeIsSFTP;
    procedure CodeIsTelnet;
    procedure CodeIsSSL;
    procedure CodeIsTLS;
    procedure CodeIsIMAP;
    procedure CodeIsPOP;
    procedure CodeIsSMTP;
    procedure CodeIsSMB;
    procedure CodeIsRTPS;
  end;

implementation

procedure TNetProtocolTest.CodeIsUnkNown;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(Unknown);
  CheckTrue(Unknown = Protocol.Code);
  CheckEquals('', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsMemoryMap;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(MemoryMap);
  CheckTrue(MemoryMap = Protocol.Code);
  CheckEquals('mm', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsPipeline;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(Pipeline);
  CheckTrue(Pipeline = Protocol.Code);
  CheckEquals('pipeline', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSerial;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(Serial);
  CheckTrue(Serial = Protocol.Code);
  CheckEquals('com', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsMessageQueue;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(MessageQueue);
  CheckTrue(MessageQueue = Protocol.Code);
  CheckEquals('mq', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSocket;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(Socket);
  CheckTrue(Socket = Protocol.Code);
  CheckEquals('socket', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsUDP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(UDP);
  CheckTrue(UDP = Protocol.Code);
  CheckEquals('upd', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsTCP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(TCP);
  CheckTrue(TCP = Protocol.Code);
  CheckEquals('tcp', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsHTTP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(HTTP);
  CheckTrue(HTTP = Protocol.Code);
  CheckEquals('http', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsHTTPS;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(HTTPS);
  CheckTrue(HTTPS = Protocol.Code);
  CheckEquals('https', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSSH;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(SSH);
  CheckTrue(SSH = Protocol.Code);
  CheckEquals('ssh', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsFTP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(FTP);
  CheckTrue(FTP = Protocol.Code);
  CheckEquals('ftp', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSFTP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(SFTP);
  CheckTrue(SFTP = Protocol.Code);
  CheckEquals('sftp', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsTelnet;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(Telnet);
  CheckTrue(Telnet = Protocol.Code);
  CheckEquals('telnet', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSSL;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(SSL);
  CheckTrue(SSL = Protocol.Code);
  CheckEquals('ssl', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsTLS;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(TLS);
  CheckTrue(TLS = Protocol.Code);
  CheckEquals('tls', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsIMAP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(IMAP);
  CheckTrue(IMAP = Protocol.Code);
  CheckEquals('imap', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsPOP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(POP);
  CheckTrue(POP = Protocol.Code);
  CheckEquals('pop', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSMTP;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(SMTP);
  CheckTrue(SMTP = Protocol.Code);
  CheckEquals('smtp', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsSMB;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(SMB);
  CheckTrue(SMB = Protocol.Code);
  CheckEquals('smb', Protocol.Text);
end;

procedure TNetProtocolTest.CodeIsRTPS;
var
  Protocol: INetProtocol;
begin
  Protocol := TNetProtocol.New(RTPS);
  CheckTrue(RTPS = Protocol.Code);
  CheckEquals('rtps', Protocol.Text);
end;

initialization

RegisterTest(TNetProtocolTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
