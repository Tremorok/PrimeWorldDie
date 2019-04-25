#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
#IfWinActive Prime World
F4::
send, 1
sleep, 50
send, 2
sleep, 100
send, 4
sleep, 25
Click
sleep, 700
send, 1
return