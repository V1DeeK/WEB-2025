PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;

FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, Param: STRING;
  StartPos, EndPos: INTEGER;
BEGIN                               
  QueryString := GetEnv('QUERY_STRING'); { QUERY_STRING }
  StartPos := Pos(Key + '=', QueryString); { Начальная позиция }

  IF StartPos > 0 { Параметр найден }
  THEN
    BEGIN                                               
      Delete(QueryString, 1, StartPos + Length(Key)); { Убираем подстроку до значения }
      EndPos := Pos('&', QueryString); { Позиция & или конеца строки }
 
      IF EndPos = 0
      THEN
        EndPos := Length(QueryString) + 1;
                                   
      Param := Copy(QueryString, 1, EndPos - 1); { Записываем значение параметра }
      GetQueryStringParameter := Param
    END
  ELSE                                                  
    GetQueryStringParameter := '' { Параметр не найден -> возвращаем пустую строку }
END;

BEGIN { WorkWithQueryString }
  WRITELN('Content-Type: text/plain');
  WRITELN;

  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. { WorkWithQueryString }