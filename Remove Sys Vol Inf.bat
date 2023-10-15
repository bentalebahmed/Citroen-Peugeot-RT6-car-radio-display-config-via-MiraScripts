@echo off
set /p DriveLetter=Enter Drive Letter and ":" to remove System Volume Information Files and Folders.
%DriveLetter%
attrib -a -r -h -s "System Volume Information"
Rmdir "System Volume Information" /q /s
pause