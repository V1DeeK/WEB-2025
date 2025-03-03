PROGRAM EnvVars(INPUT, OUTPUT);
USES
  SysUtils;
BEGIN                     
  WRITELN('Content-Type: text/plain');
  WRITELN;
                                                       
  WRITELN('REQUEST_METHOD: ', GetEnvironmentVariable('REQUEST_METHOD'));
                                                     
  WRITELN('QUERY_STRING: ', GetEnvironmentVariable('QUERY_STRING'));
                                                       
  WRITELN('CONTENT_LENGTH: ', GetEnvironmentVariable('CONTENT_LENGTH'));
                                                        
  WRITELN('HTTP_USER_AGENT: ', GetEnvironmentVariable('HTTP_USER_AGENT'));
                                                  
  WRITELN('HTTP_HOST: ', GetEnvironmentVariable('HTTP_HOST'));
END.