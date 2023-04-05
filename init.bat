@echo OFF
REM This init bat file ONLY job is to run the python script!

SET python=Python311\python.exe

SET folder=WEBDEV

SET directory=C:\\

SET type=%1

SET name=%2

REM init main file
%directory%%python% C:\scripts\src\init.py %directory%Users\\%USERNAME%\\Documents\\%folder%\\ %type% %name%
EXIT /b