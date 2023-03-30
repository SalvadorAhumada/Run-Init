@echo OFF

SET type=%1

SET name=%2

SET folder=WEBDEV

SET directory=C:\

SET valid_path=true

CALL :Validate_Directory %directory%Users\%USERNAME%\Documents\%folder%\
if "%valid_path%"=="false" (
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
  CALL :Validate_Directory %directory%Users\%USERNAME%\Documents\%folder%\%name%
  if "%valid_path%"=="false" (
    EXIT /b
  )
  GOTO :Start_Project %name%
EXIT /b

:Start_Project
    ECHO [7mOpening %name%...[0m
    cd C:\Users\%USERNAME%\Documents\%folder%\%name% && code . && wt -w 0 -d C:\Users\%USERNAME%\Documents\%folder%\%name% && ECHO [7mDone![0m && git branch
EXIT /b

:Run_Script
  CALL :Validate_Directory %directory%scripts\src\%name%.ps1
  if "%valid_path%"=="false" (
    EXIT /b
  )
  CALL Powershell.exe -executionpolicy remotesigned -File  C:\scripts\src\%name%.ps1
EXIT /b

:Create_Folder
  ECHO [7mCreating folder %folder%...[0m
  mkdir C:\Users\%USERNAME%\Documents\%folder%\
  ECHO [7m%folder% created successfully[0m
EXIT /b

:Validate_Directory
SET validate_path=%1
if not exist %validate_path% (
  ECHO [7;31m%validate_path% Not Found[0m
  SET valid_path=false
  EXIT /b
) 