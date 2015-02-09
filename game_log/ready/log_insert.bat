@echo off
rem 定时log入库
setlocal enabledelayedexpansion
set /a count = 0
for /r %%i in (*.log) do (
set s=%%i
set s=!s:%~dp0=!
gawk -f log_insert.awk !s! > !s!.sql
D:\xampp\mysql\bin\mysql.exe -u root < !s!.sql
move !s! ..\..\log.bk >nul
move !s!.sql ..\..\log.bk >nul
set /a count = !count! + 1
echo !s!
if !count! GEQ 2 goto _break
)

:_break
echo !count!
