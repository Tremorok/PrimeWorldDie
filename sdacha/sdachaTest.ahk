#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
a := 0
b := 0
Loop,
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs123\*.txt, 0, 1,
	{ 
		FileRead, file, %A_LoopFileFullPath% ; Читаем Лог
		IfInString, file, Player [Name] has started voting ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{ 
			a := b + 1
			sleep 5000
			IfInString, file, Command decline surrender ; Ищем в ЧатЛоге фразу "Command decline surrender"
			{ 
				Sleep 50 ; Задержка
				a := b - 1
			}
			If (a > 1) 
			{
				MsgBox, 123344134141 %a%
 			}
			;SoundPlay, sdacha.mp3 ; Уведомление
			Break
		}
		IfInString, file, now we are NOT able to render  :) ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			Sleep 50 ; Задержка
			;SoundPlay, pobeda.mp3 ; Уведомление
			Sleep 7500
			Break
		}
		
	}
	Sleep, 8000
}
return ; Ретерним чтобы потом снова активировать скрипт на F2
F10::Pause ; Клавиша активации скрипта