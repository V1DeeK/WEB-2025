PROGRAM SarahRevere(INPUT, OUTPUT);
USES
  SysUtils;
VAR
  QueryStr: STRING;
begin
  WRITELN('Content-Type: text/plain');
  WRITELN;

  QueryStr := GetEnvironmentVariable('QUERY_STRING');

  IF QueryStr = 'lanterns=1'
  THEN
    WRITELN('coming by land!')
  ELSE
    IF QueryStr = 'lanterns=2'
    THEN
      WRITELN('coming by sea!')
    ELSE
      WRITELN('Invalid input');
end.
