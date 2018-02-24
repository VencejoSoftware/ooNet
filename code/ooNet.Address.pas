{$REGION 'documentation'}
{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Network address
  @created(18/02/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooNet.Address;

interface

type
{$REGION 'documentation'}
{
  @abstract(Network address interface)
  Network address abstract definition
  @member(Text Address value as text)
}
{$ENDREGION}
  INetAddress = interface
    ['{FE048393-39D0-4C7B-8FA8-3B04F15DEDAF}']
    function Text: String;
  end;

implementation

end.
