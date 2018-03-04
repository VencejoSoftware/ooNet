{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Messages encoding
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Encoding;

interface

type
{$REGION 'documentation'}
{
  @value Unknown Unknown Encoding
  @value UTF8 UTF8 Encoding
}
{$ENDREGION}
  TNetEncodingCode = (Unknown, UTF8);

{$REGION 'documentation'}
{
  @abstract(URL Encoding object)
  Define the message encoding
  @member(Code Valid code enumeration)
  @member(Text Text Encoding as text)
}
{$ENDREGION}

  INetEncoding = interface
    ['{347143BB-AE9F-45C9-8E1E-B88D57C07232}']
    function Code: TNetEncodingCode;
    function Text: String;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(INetEncoding))
  @member(Code @seealso(INetEncoding.Code))
  @member(Text @seealso(INetEncoding.Text))
  @member(
    Create Object constructor
    @param(Code Valid code enumeration)
  )
  @member(
    New Create a new @classname as interface
    @param(Code Valid code enumeration)
  )
}
{$ENDREGION}

  TNetEncoding = class sealed(TInterfacedObject, INetEncoding)
  strict private
    _Code: TNetEncodingCode;
  public
    function Code: TNetEncodingCode;
    function Text: String;
    constructor Create(const Code: TNetEncodingCode);
    class function New(const Code: TNetEncodingCode = Unknown): INetEncoding;
  end;

implementation

function TNetEncoding.Code: TNetEncodingCode;
begin
  Result := _Code;
end;

function TNetEncoding.Text: String;
const
  TEXT_VALUE: array [TNetEncodingCode] of string = ('', 'utf-8');
begin
  Result := TEXT_VALUE[Code];
end;

constructor TNetEncoding.Create(const Code: TNetEncodingCode);
begin
  _Code := Code;
end;

class function TNetEncoding.New(const Code: TNetEncodingCode): INetEncoding;
begin
  Result := TNetEncoding.Create(Code);
end;

end.
