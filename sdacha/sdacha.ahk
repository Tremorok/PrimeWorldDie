#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive Prime World
way = %A_MyDocuments%\My Games\Prime World\Session\Logs\chatlog.txt ; Путь к папке
a := 0;
b := 0;
Loop,
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs123\*.txt, 0, 1,
	{ 
		FileRead, file, %A_LoopFileFullPath% ; Читаем Лог
		IfInString, file, Player [Name] has started voting ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{ 
			SoundPlay, sdacha.mp3 ; Уведомление
			Sleep, 5000
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy123
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy123\  ; Удаляем ЧатЛог
			Sleep 15000
			Break
		}
		IfInString, file, now we are NOT able to render  :) ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			SendInput, {Enter}
			Sleep 100,
			SoundPlay, pobeda.mp3 ; Уведомление
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\   ; Удаляем ЧатЛог
			Sleep 7500
			Break
		}
		
	}
	Sleep, 1000
}
return ; Ретерним чтобы потом снова активировать скрипт на F2
F10::Pause ; Клавиша активации скрипта