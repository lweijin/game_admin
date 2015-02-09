@echo off
rem 收集半小时前的log
setlocal enabledelayedexpansion
set tdate=%date%
set tyear=%tdate:~0,4%
set tmonth=%tdate:~5,2%
set tday=%tdate:~8,2%

set ttime=%time%
set thour=%ttime:~0,2%

for %%i in (*.log) do (
set s=%%i
set s=!s:%~dp0=!
set syear=!s:~8,4!
set is_move="0"
IF NOT !syear! == !tyear! (
set is_move="1"
)

set smonth=!s:~12,2!
IF NOT !smonth! == !tmonth! (
set is_move="1"
)
set sday=!s:~14,2!
IF NOT !sday! == !tday! (
set is_move="1"
)

set shour=!s:~17,2!
IF NOT !shour! == !thour! (
set is_move="1"
)

IF !is_move! == "1" (
move !s! ready >nul
echo !s!
)
echo !is_move!
)