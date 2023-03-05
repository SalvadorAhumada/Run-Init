@ECHO OFF

SET foo=%1

IF "%foo%"=="" (
    
    ECHO usage: init [proyect]
    ECHO proyects:
    ECHO goa10 - a100d
    
    ) else (
        IF "%foo%"=="goa10" (
            cd ""C:\Users\lsaz1\Documents\WEBDEV\a100d && code . && wt -w 0 -d C:\Users\lsaz1\Documents\WEBDEV\a100d""
            )
    )



REM cd ""C:\Users\lsaz1\Documents\WEBDEV\a100d""


REM start code "c:\scripts\init.bat"

exit /b