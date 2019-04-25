#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive Prime World
way = %A_MyDocuments%\My Games\Prime World\Session\Logs\chatlog.txt ; Путь к папке
Loop,
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs\*.txt, 0, 1,
	{ 
		FileRead, file, %A_LoopFileFullPath% ; Читаем Лог
		IfInString, file, Player [Name] has started voting ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{ 
			SoundPlay, sdacha.mp3 ; Уведомление
			Sleep, 5000
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\  ; Удаляем ЧатЛог
			Break
		}
		IfInString, file, now we are NOT able to render  :) ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			SendInput, {Enter}
			Sleep 100,
			Send, {Enter}{Shift}
			Sleep, 30
			Send, Лалки с
			Sleep, 30
			Send, асалки!
			Sleep, 100
			Send, {Enter}
			Sleep 50 ; Задержка
			SoundPlay, pobeda.mp3 ; Уведомление
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\   ; Удаляем ЧатЛог
			Sleep 7500
			Break
		}
	}
	
	
	
	F3::
Loop, read, a.txt
{
	LastLine := A_LoopReadLine
}
MsgBox %LastLine%
return

IfInString, file, Player [Name] has started voting ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
{ 
	SoundPlay, sdacha.mp3 ; Уведомление
	Sleep, 5000
	Break
}
IfInString, file, Command decline surrender ; Ищем в ЧатЛоге фразу "Command decline surrender"
{ 
	SoundPlay, concide.mp3 ; Уведомление
	Sleep, 5000
	Break
}
IfInString, file, now we are NOT able to render  :) ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
{ 
	SoundPlay, pobeda.mp3 ; Уведомление
	Sleep, 5000
	Break
}



#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Param1 := Player [Name] has started voting
Param2 := Command decline surrender
Param3 := now we are NOT able to render
last_line := A_LoopReadLine
Loop,
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs\*.txt, 0, 1,
	{ 
		FileRead, file, %A_LoopFileFullPath% ; Читаем Лог
		IfInString, A_LoopReadLine, %Param1% ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{ 
			SoundPlay, sdacha.mp3 ; Уведомление
			ToolTip, %A_LoopReadLine%
			Sleep, 3000
			Break
		}
		IfInString, A_LoopReadLine, %Param2% ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			SoundPlay, pobeda.mp3 ; Уведомление
			ToolTip, %A_LoopReadLine%
			Sleep 3000
			Break
		}
		IfInString, A_LoopReadLine, %Param3% ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			SoundPlay, concide.mp3 ; Уведомление
			ToolTip, %A_LoopReadLine%
			Sleep 3000
			Break
		}		
	}
	Sleep, 1000
}
return ; Ретерним чтобы потом снова активировать скрипт на F2
F10::Pause ; Клавиша активации скрипта



Loop,
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs\*.txt, 0, 1,
	{ 
		FileRead, file, %A_LoopFileFullPath% ; Читаем Лог
		MsgBox %A_LoopReadLine%
		If (last_line = "Player [Name] has started voting") ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{ 
			SoundPlay, sdacha.mp3 ; Уведомление
			Sleep, 5000
			Break
		}
		If (last_line = "Command decline surrender") ; Ищем в ЧатЛоге фразу "Command decline surrender"
		{ 
			SoundPlay, concide.mp3 ; Уведомление
			Sleep, 5000
			Break
		}
		If (last_line = "now we are NOT able to render") ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{ 
			SoundPlay, pobeda.mp3 ; Уведомление
			Sleep, 5000
			Break
		}
	}
	Sleep, 500
}
return ; Ретерним чтобы потом снова активировать скрипт на F2
F10::Pause ; Клавиша активации скрипта