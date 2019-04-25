#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
F6::
whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr.Open("GET", "http://37.110.94.221/primehack/", true)
whr.Send()
whr.WaitForResponse()
ip := whr.ResponseText
whr1 := ComObjCreate("WinHttp.WinHttpRequest.5.1")
whr1.Open("GET", "http://37.110.94.221/primehack/WhiteListIP.txt", true)
whr1.Send()
whr1.WaitForResponse()
WhiteListIP := whr1.ResponseText
IfInString, WhiteListIP, %ip%
{
MsgBox, All ok
}
Return
