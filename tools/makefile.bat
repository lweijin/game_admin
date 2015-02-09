@echo off
setlocal enabledelayedexpansion
echo "Start Make File"

set protoDir=./proto

set phpDir=./php_file

set src=../proto

for %%i in (%protoDir%/*.proto) do (
set s=%%i
set file_name=!s:~0,-6!
php protoc.php !protoDir!/%%~nxi !phpDir!/!file_name!.php
echo !file_name!.php done
)

echo "Make File Complete...Start Copy File To Target Folder"
xcopy .\!phpDir:~2! ..\!src:~3! /E /Y

echo "Copy Complete..."

pause