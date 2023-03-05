@echo OFF

SET project=%1


if not exist C:\Users\%USERNAME%\Documents\WEBDEV\ (
  ECHO [7;31mFolder C:\Users\%USERNAME%\Documents\WEBDEV\ Not Found[0m   
  exit /b
) 

if not exist C:\Users\%USERNAME%\Documents\WEBDEV\%project% (
  ECHO [7;31mC:\Users\%USERNAME%\Documents\WEBDEV\%1 Not Found[0m
  exit /b
) 

if "%project%"=="" (
    ECHO [Run-Init V0.1]
    ECHO usage: init [project]
    ECHO projects:
    ECHO a100d
    EXIT /B %ERRORLEVEL%
)

CALL :Main %project%

EXIT /B %ERRORLEVEL%

:Main
    GOTO :Start_Project %1
exit /b

:Start_Project
    ECHO [7mOpening %1...[0m
    cd C:\Users\%USERNAME%\Documents\WEBDEV\%1 && code . && wt -w 0 -d C:\Users\%USERNAME%\Documents\WEBDEV\%1 && ECHO [7mDone![0m
exit /b