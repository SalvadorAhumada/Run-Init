@echo OFF

SET type=%1

SET name=%2

SET folder=WEBDEV

if not exist C:\Users\%USERNAME%\Documents\%folder%\ (
  ECHO [7;31mFolder C:\Users\%USERNAME%\Documents\%folder%\ Not Found[0m
  CALL :Create_Folder
  EXIT /b
) 

if "%type%"=="" (
    ECHO [Run-Init V0.1]
    ECHO usage: init [type] [name]
    ECHO [type] project:
    ECHO    - a100d
    ECHO    - santavid
    ECHO [type] script:
    ECHO    - pressk
    ECHO            fake keypress every 10 seconds
    ECHO    - config
    ECHO            edit config
    EXIT /b %ERRORLEVEL%
)

2>NUL CALL :CASE_%type%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE 

EXIT /B

:CASE_project
  CALL :Main %name%
  GOTO END_CASE
:CASE_script
  CALL :Run_Script %name%
  GOTO END_CASE
:DEFAULT_CASE
  ECHO [7;33mUnknown type "%type%"[0m
  GOTO END_CASE
:END_CASE
  VER > NUL # reset ERRORLEVEL
  GOTO :EOF # return from CALL

:Main
  if not exist C:\Users\%USERNAME%\Documents\%folder%\%name% (
    ECHO [7;31mC:\Users\%USERNAME%\Documents\%folder%\%name% Not Found[0m
    EXIT /b
  )
    GOTO :Start_Project %name%
EXIT /b

:Start_Project
    ECHO [7mOpening %name%...[0m
    cd C:\Users\%USERNAME%\Documents\%folder%\%2 && code . && wt -w 0 -d C:\Users\%USERNAME%\Documents\%folder%\%2 && ECHO [7mDone![0m && git branch
EXIT /b

:Run_Script
if not exist C:\scripts\src\%name%.ps1 (
  ECHO [7;31mC:\scripts\src\%name%.ps1 Not Found[0m
  EXIT /b
) 

  ECHO [7mRunning %name%...[0m
  call Powershell.exe -executionpolicy remotesigned -File  C:\scripts\src\%name%.ps1
EXIT /b

:Create_Folder
  ECHO [7mCreating folder %folder%...[0m
  mkdir C:\Users\%USERNAME%\Documents\%folder%\
  ECHO [7m%folder% created successfully[0m
EXIT /b