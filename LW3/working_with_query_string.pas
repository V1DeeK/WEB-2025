PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;

FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, Param: STRING;
  StartPos, EndPos: INTEGER;
BEGIN                               
  QueryString := GetEnv('QUERY_STRING'); { QUERY_STRING }
  StartPos := Pos(Key + '=', QueryString); { ��������� ������� }

  IF StartPos > 0 { �������� ������ }
  THEN
    BEGIN                                               
      Delete(QueryString, 1, StartPos + Length(Key)); { ������� ��������� �� �������� }
      EndPos := Pos('&', QueryString); { ������� & ��� ������ ������ }
 
      IF EndPos = 0
      THEN
        EndPos := Length(QueryString) + 1;
                                   
      Param := Copy(QueryString, 1, EndPos - 1); { ���������� �������� ��������� }
      GetQueryStringParameter := Param
    END
  ELSE                                                  
    GetQueryStringParameter := '' { �������� �� ������ -> ���������� ������ ������ }
END;

BEGIN { WorkWithQueryString }
  WRITELN('Content-Type: text/plain');
  WRITELN;

  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. { WorkWithQueryString }