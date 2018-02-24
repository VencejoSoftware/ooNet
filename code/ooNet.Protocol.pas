{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network protocol
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Protocol;

interface

type
{$REGION 'documentation'}
{
  @value Unknown Unknown protocol
  @value MemoryMap Memory mapping protocol
  @value Pipeline Pipelining protocol
  @value Serial Serial port protocol
  @value MessageQueue Messaging queue protocol
  @value Socket Network socket protocol
  @value UDP User Datagram protocol
  @value TCP Transmission Control protocol
  @value HTTP HTTP protocol
  @value HTTPS Secure HTTP protocol
  @value SSH Secure Shell protocol
  @value FTP File Transfer protocol
  @value SFTP Secure File Transfer protocol
  @value Telnet Telecommunication Network protocol
  @value SSL Secure Sockets Layer protocol
  @value TLS Transport Layer Security protocol
  @value IMAP Internet Message Access protocol
  @value POP Post Office protocol
  @value SMTP Simple Mail Transfer protocol
  @value SMB Server Message Block protocl
  @value RTPS Real Time Publish Subscribe protocol
}
{$ENDREGION}
  TNetprotocolCode = (Unknown, MemoryMap, Pipeline, Serial, MessageQueue, Socket, UDP, TCP, HTTP, HTTPS, SSH, FTP, SFTP,
    Telnet, SSL, TLS, IMAP, POP, SMTP, SMB, RTPS);

{$REGION 'documentation'}
{
  @abstract(Network protocol interface)
  Network protocol abstract definition
  @member(Code Valid code enumeration)
  @member(Text Protocol value as text)
}
{$ENDREGION}

  INetProtocol = interface
    ['{7887C307-364C-4799-B50E-6F92163AD40F}']
    function Code: TNetprotocolCode;
    function Text: String;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(INetProtocol))
  @member(Code @seealso(INetProtocol.Code))
  @member(Text @seealso(INetProtocol.Text))
  @member(
    Create Object constructor
    @param(Code Valid code enumeration)
    @param(Text Protocol value as text)
  )
  @member(
    New Create a new @classname as interface
    @param(Code Valid code enumeration)
    @param(Text Protocol value as text)
  )
}
{$ENDREGION}

  TNetProtocol = class sealed(TInterfacedObject, INetProtocol)
  strict private
    _Code: TNetprotocolCode;
  public
    function Code: TNetprotocolCode;
    function Text: String;
    constructor Create(const Code: TNetprotocolCode);
    class function New(const Code: TNetprotocolCode): INetProtocol;
  end;

implementation

function TNetProtocol.Code: TNetprotocolCode;
begin
  Result := _Code;
end;

function TNetProtocol.Text: String;
const
  TEXT_VALUE: array [TNetprotocolCode] of string = ('', 'mm', 'pipeline', 'com', 'mq', 'socket', 'upd', 'tcp', 'http',
    'https', 'ssh', 'ftp', 'sftp', 'telnet', 'ssl', 'tls', 'imap', 'pop', 'smtp', 'smb', 'rtps');
begin
  Result := TEXT_VALUE[Code];
end;

constructor TNetProtocol.Create(const Code: TNetprotocolCode);
begin
  _Code := Code;
end;

class function TNetProtocol.New(const Code: TNetprotocolCode): INetProtocol;
begin
  Result := TNetProtocol.Create(Code);
end;

end.
