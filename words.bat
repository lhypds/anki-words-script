@echo off
setlocal EnableExtensions DisableDelayedExpansion

set YYYYMMDD=%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%
echo %YYYYMMDD%

IF NOT EXIST C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt (
    REM file not exist, create new empty file
    fsutil file createnew C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt 0
) ELSE (
    REM file exist
    REM get line 1 and check if it empty
    FOR /F "delims=" %%x IN ('findstr /N "^" "C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt"') DO (
        echo line = "%%x"

        IF "%%x"=="1:" (
            @echo on
            echo "first line is already empty, open file"
            @echo off
            goto :continue
        ) ELSE (
            @echo on
            echo "first line is not empty, add a new empty line"
            @echo off

            REM add a new line as 1st line is not empty
            REM 1. create a new line temp
            echo.> C:\Users\Liu\Dropbox\Words\newline_temp.txt

            REM 2. copy to create, must use binary copy, else will have a 0x01 at the end
            copy /b /y C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt C:\Users\Liu\Dropbox\Words\%YYYYMMDD%_temp.txt
            copy /b /y C:\Users\Liu\Dropbox\Words\newline_temp.txt + C:\Users\Liu\Dropbox\Words\%YYYYMMDD%_temp.txt C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt
            
            REM 3. cleanup
            del C:\Users\Liu\Dropbox\Words\%YYYYMMDD%_temp.txt
            del C:\Users\Liu\Dropbox\Words\newline_temp.txt
            goto :continue
        )
    )
)
:continue

REM open file
notepad C:\Users\Liu\Dropbox\Words\%YYYYMMDD%.txt