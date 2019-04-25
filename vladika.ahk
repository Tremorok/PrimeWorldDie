#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#UseHook On
#IfWinActive Prime World
`::
	BlockClick := not BlockClick
	Sleep, 200
	Send, !2
	Sleep, 200
	BlockClick := not BlockClick

#If BlockClick
{
    LButton::return

}
return

