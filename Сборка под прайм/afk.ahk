#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
#IfWinActive Prime World
#MaxThreadsPerHotkey 3
F9::
#MaxThreadsPerHotkey 1
if KeepWinZRunning
{
    KeepWinZRunning := false  ;
    return  ;
}

; Otherwise:
KeepWinZRunning := true
Loop
{
    ToolTip, Press F9 again to stop.
    Sleep 1000
    Click
    Sleep 1000
    if not KeepWinZRunning
        break  ;
}
KeepWinZRunning := false  ;
ToolTip
return