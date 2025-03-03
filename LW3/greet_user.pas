PROGRAM UserName(INPUT, OUTPUT);
USES
  SysUtils;
VAR
  QueryString, Name: STRING;
  PosName: INTEGER;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;

  QueryString := GetEnvironmentVariable('QUERY_STRING'); {���祭�� Query_string}
  PosName := Pos('name=', QueryString); { ������ � name ������}

  IF PosName > 0 { ��諨 name}
  THEN
    BEGIN
      Name := Copy(QueryString, PosName + 5, Length(QueryString) - PosName - 4); { ��室�� ��ଥ��}
      WRITELN('Hello dear, ', Name, '!')
    END
  ELSE
    WRITELN('Hello Anonymous!') { �� ��諨 ���}
end.
