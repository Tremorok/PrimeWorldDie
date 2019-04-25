#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent  ; Выполнять скрипт, пока не закроет пользователь.
Menu, tray, NoStandard
Menu, tray, add, Exit123321, MenuHandler1
Menu, tray, add  ; Добавить разделитель.
Menu, tray, add, Exit123, MenuHandler  ; Добавить новый пункт.
return
MenuHandler:
ExitApp
return
TrueExit:
Process, Close, afk.exe
Process, Close, maska.exe
Process, Close, autocast.exe
Process, Close, sdacha.exe
ExitApp
return