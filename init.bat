@echo OFF

SET project=%1

SET folder=WEBDEV

if not exist C:\Users\%USERNAME%\Documents\%folder%\ (
  ECHO [7;31mFolder C:\Users\%USERNAME%\Documents\%folder%\ Not Found[0m
  CALL :Create_Folder
  EXIT /b
) 

if "%project%"=="" (
    ECHO [Run-Init V0.1]
    ECHO usage: init [project]
    ECHO projects:
    ECHO a100d
    EXIT /b %ERRORLEVEL%
)

if not exist C:\Users\%USERNAME%\Documents\%folder%\%project% (
  ECHO [7;31mC:\Users\%USERNAME%\Documents\%folder%\%project% Not Found[0m
  EXIT /b
) 

CALL :Main %project%

EXIT /b %ERRORLEVEL%

:Main
    GOTO :Start_Project %1
EXIT /b

:Start_Project
    ECHO [7mOpening %1...[0m
    cd C:\Users\%USERNAME%\Documents\%folder%\%1 && code . && wt -w 0 -d C:\Users\%USERNAME%\Documents\%folder%\%1 && ECHO [7mDone![0m && git branch
EXIT /b

:Create_Folder
  ECHO [7mCreating folder %folder%...[0m
  mkdir C:\Users\%USERNAME%\Documents\%folder%\
  ECHO [7m%folder% created successfully[0m
EXIT /b