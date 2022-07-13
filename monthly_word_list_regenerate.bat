
REM remove output file if exist, and recreate
IF EXIST "C:\Users\Liu\Dropbox\Words\202206\202206.txt" (
    del "C:\Users\Liu\Dropbox\Words\202206\202206.txt"
)

REM recreate output file
fsutil file createnew "C:\Users\Liu\Dropbox\Words\202206\202206.txt" 0

REM loop daily word list
FOR %%f IN (C:\Users\Liu\Dropbox\Words\*.txt) DO (
    type %%f >> "C:\Users\Liu\Dropbox\Words\202206\202206.txt"

    REM add an return at end of file
    ECHO.>> "C:\Users\Liu\Dropbox\Words\202206\202206.txt"
)

REM format word list
python3.10 C:\Users\LIU\Dropbox\Words\.scripts\format_word_list.py
