#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Kill if exist
Run, "C:\Users\LIU\Dropbox\Words\.scripts\kill_anki.bat"
Sleep 3000

;Sync once before import
Run, "C:\Program Files\Anki\anki"
Sleep 6000
Run, "C:\Users\LIU\Dropbox\Words\.scripts\anki_run_python_sync.bat"
Sleep 10000
Run, "C:\Users\LIU\Dropbox\Words\.scripts\kill_anki.bat"
Sleep 3000

;Import new words
Run, "C:\Users\LIU\Dropbox\Words\.scripts\monthly_word_list_regenerate.bat"
Sleep 3000
Run, "C:\Users\LIU\Dropbox\Words\.scripts\anki_import_gui.bat"
Sleep 10000
Send, {ENTER}
Sleep 1000
Send, {ENTER}

;Sync again and kill
Run, "C:\Users\LIU\Dropbox\Words\.scripts\anki_run_python_sync.bat"
Sleep 10000
Run, "C:\Users\LIU\Dropbox\Words\.scripts\anki_run_python_gui_exit.bat"
Sleep 5000
Run, "C:\Users\LIU\Dropbox\Words\.scripts\kill_anki.bat"
Exit
