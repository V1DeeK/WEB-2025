PROGRAM UserName(INPUT, OUTPUT);
USES
  SysUtils;
VAR
  QueryString, Name: STRING;
  PosName: INTEGER;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;

  QueryString := GetEnvironmentVariable('QUERY_STRING'); {значение Query_string}
  PosName := Pos('name=', QueryString); { запись в name позицию}

  IF PosName > 0 { нашли name}
  THEN
    BEGIN
      Name := Copy(QueryString, PosName + 5, Length(QueryString) - PosName - 4); { находим парметр}
      WRITELN('Hello dear, ', Name, '!')
    END
  ELSE
    WRITELN('Hello Anonymous!') { не нашли имя}
end.
