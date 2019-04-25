#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon
Param1 = Player [Name] has started voting
Param2 = Command decline surrender
Param3 = now we are NOT able to render
Param4 = Command accept surrender
start = 1
#MaxThreadsPerHotkey 3
F10::
#MaxThreadsPerHotkey 1
if (start = 1)
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs\*.txt,,1
	{
		FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
		FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\ ,1 ; Переносим в другую папку, с перезаписью
	}
	FileRemoveDir, %A_MyDocuments%\My Games\Prime World\Session\Logs, 1
	FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\Logs
}
if KeepWinZRunning
{
	SoundPlay, turn_off.mp3,
	KeepWinZRunning := false  ;
	start = 1
	return  ;
}

KeepWinZRunning := true
start = 0
SoundPlay, turn_on.mp3,
Loop
{
	Loop, %A_MyDocuments%\My Games\Prime World\Session\Logs\*.txt,,1
	{
		Loop Read, %A_LoopFileLongPath%
		{
			LastLine = %A_LoopReadLine% ; Даём переменной имя
		}
		IfInString, LastLine, %Param1% ; Ищем в ЧатЛоге фразу "Player [Name] has started voting"
		{
			SoundPlay, sdacha.mp3 ; Уведомление
			Sleep, 1000
		}
		IfInString, LastLine, %Param2% ; Ищем в ЧатЛоге фразу "Command decline surrender"
		{
			SoundPlay, concide.mp3 ; Уведомление
			Sleep, 40000
		}
		IfInString, LastLine, %Param4% ; Ищем в ЧатЛоге фразу "Command decline surrender"
		{
			Process, Close, PW_Game.exe
			Sleep, 10000
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\ ,1 ; Переносим в другую папку, с перезаписью
			FileRemoveDir, %A_MyDocuments%\My Games\Prime World\Session\Logs, 1
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\Logs
		}
		FileRead, file, %A_LoopFileFullPath%
		IfInString, file, %Param3% ; Ищем в ЧатЛоге фразу "now we are NOT able to render  :)"
		{
			SoundPlay, pobeda.mp3 ; Уведомление
			Sleep, 10
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy
			FileMove, %A_LoopFileFullPath%, %A_MyDocuments%\My Games\Prime World\Session\LogsCopy\ ,1 ; Переносим в другую папку, с перезаписью
			FileRemoveDir, %A_MyDocuments%\My Games\Prime World\Session\Logs, 1
			FileCreateDir, %A_MyDocuments%\My Games\Prime World\Session\Logs
		}
	}
	if not KeepWinZRunning
		break  ;
}
return