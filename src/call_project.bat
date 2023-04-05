@echo OFF
SET name=%1
SET folder=%2


if not exist %folder% (
  ECHO [7;31m%folder% Not Found[0m
  ECHO [7;31mCreating folder...[0m
  mkdir C:\Users\%USERNAME%\Documents\%folder%\
  ECHO [7m%folder% created successfully[0m
  EXIT /b
) 


ECHO [7mOpening %name%...[0m
wt -w 0 -d %folder%\%name%
wt -w 1 -d %folder%\%name%
code %folder%\%name%