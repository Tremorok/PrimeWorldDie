#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
f3::
tr = true
fl = false
IniRead, StartStatus, config.ini, FirstStart, IsItFirstStart
if (%StartStatus% = %tr%)
{
	MsgBox, Yes
	return
}
return