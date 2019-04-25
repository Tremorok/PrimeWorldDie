;*********************************************
;***************BEGIN SCRIPT******************
;*********************************************
;===================Имена=====================
Menu1 = Включение и отключение ф-ий
sMenu11 = АнтиАФК
sMenu12 = Автокаст
sMenu13 = Автолив
sMenu14 = Прокаст маски
Menu2 = Основные клавиши
Menu3 = Выход
Menu4 = Версия: Alpha.0.1
;===============Инициализация=================
mcTray := PathAhkIcon "ico.ico"
Menu, Tray, Icon, %McTray%,, 1
#Persistent
Process, Close, afk.exe
Process, Close, maska.exe
Process, Close, autocast.exe
Process, Close, sdacha.exe
Menu, tray, NoStandard ;Отключение стандартного меню
KeysSubmenu:
    Menu, KeysSubmenu, add, %sMenu11%, AntiAFK,
    Menu, KeysSubmenu, add, %sMenu12%, AutoCast,
    Menu, KeysSubmenu, add, %sMenu13%, AutoLeave,
    Menu, KeysSubmenu, add, %sMenu14%, ProcastMaska,
Menu, tray, add, %Menu1%, :KeysSubmenu
Menu, tray, add, ;Разделитель
Menu, tray, add, %Menu2%, AboutMenu
Menu, tray, add, %Menu3%, TrueExit
Menu, tray, add, ;Разделитель
Menu, tray, add, %Menu4%, None,
Menu, tray, Disable, %Menu4%, ;Делает меню 4 неактивным
#SingleInstance ; Запрет повторного запуска
IniRead, AntiAFKstatus, config.ini, vklfunk, vklfunk1
if (AntiAFKstatus = 1)
{
    Menu, KeysSubmenu, ToggleCheck, %sMenu11%,
    Run, afk.exe ;Запуск антиафк
}
IniRead, AutoCaststatus, config.ini, vklfunk, vklfunk2
if (AutoCaststatus = 1)
{
    Menu, KeysSubmenu, ToggleCheck, %sMenu12%,
    Run, maska.exe ;Запуск прокаста маски
}
IniRead, AutoLeavestatus, config.ini, vklfunk, vklfunk3
if (AutoLeavestatus = 1)
{
    Menu, KeysSubmenu, ToggleCheck, %sMenu13%,
    SendMessage, 0x50,, 0x4090409,, A ; английский
    Run, autocast.exe ;Запуск автокаст
}
IniRead, ProcastMaskastatus, config.ini, vklfunk, vklfunk4
if (ProcastMaskastatus = 1)
{
    Menu, KeysSubmenu, ToggleCheck, %sMenu14%,
    Run, sdacha.exe ;Запуск автолива
}
IniRead, firststartprog, config.ini, firststart, isitfirststart
if (firststartprog = 1)
{
    IniWrite, 0, config.ini, firststart, isitfirststart
    Goto, AboutMenu
}
return
;===========Действия кнопок меню==============
TrueExit:
Process, Close, afk.exe
Process, Close, maska.exe
Process, Close, autocast.exe
Process, Close, sdacha.exe
ExitApp
return
;*********************************************
None:
return
;*********************************************
AboutMenu:
MsgBox, 0, Основные клавиши, F4 - прокаст маски (юзает кинжал - блинк - ульт - кинжал) `nОбязательно нужно чтобы кинжал и блинк были в смарткасте, ульт я оставил таргетным.`n`nF9 - антиафк, кликает на место мышки раз в 5-6 секунд (не помню сколько ставил). Отключается повторным нажатием на F9.`n`nF10 - Включение оповещения о сдачи, по умолчанию выключено. `nПри ключении играет музочка вагона с мороженным. `nПри повторном нажатии, отключает скрипт, сопровождаясь фразой "wasted".`nВ случае если противники прожимают, играет звук аськи. `nЕсли же играет магический звук, значит они отказались.`nВ случае если они прожали, процесс замка и боя автоматически завершатся и вы получите заветный -рейт.`nПобедную музычку я думаю сами поймете.`n`nЁ - На нее забинжен автоматический каст способности сразу на себя. Автоматом делает сочетание Alt+2.
return
;*********************************************
AntiAFK:
IniRead, AntiAFKstatus, config.ini, vklfunk, vklfunk1
Menu, KeysSubmenu, ToggleCheck, %sMenu11%,
if (AntiAFKstatus = 0)
{
    Run, afk.exe ;Запуск антиафк
    IniWrite, 1, config.ini, vklfunk, vklfunk1
    return
}
if (AntiAFKstatus = 1)
{
    Process, Close, afk.exe
    IniWrite, 0, config.ini, vklfunk, vklfunk1
    return
}
return
;*********************************************
AutoCast:
IniRead, AutoCaststatus, config.ini, vklfunk, vklfunk2
Menu, KeysSubmenu, ToggleCheck, %sMenu12%,
if (AutoCaststatus = 0)
{
    Run, autocast.exe ;Запуск антиафк
    SendMessage, 0x50,, 0x4090409,, A ; английский
    IniWrite, 1, config.ini, vklfunk, vklfunk2
    return
}
if (AutoCaststatus = 1)
{
    Process, Close, autocast.exe
    IniWrite, 0, config.ini, vklfunk, vklfunk2
    return
}
return
;*********************************************
AutoLeave:
IniRead, AutoLeavestatus, config.ini, vklfunk, vklfunk3
Menu, KeysSubmenu, ToggleCheck, %sMenu13%,
if (AutoLeavestatus = 0)
{
    Run, sdacha.exe ;Запуск антиафк
    IniWrite, 1, config.ini, vklfunk, vklfunk3
    return
}
if (AutoLeavestatus = 1)
{
    Process, Close, sdacha.exe
    IniWrite, 0, config.ini, vklfunk, vklfunk3
    return
}
return
;*********************************************
ProcastMaska:
IniRead, ProcastMaskastatus, config.ini, vklfunk, vklfunk4
Menu, KeysSubmenu, ToggleCheck, %sMenu14%,
if (ProcastMaskastatus = 0)
{
    Run, maska.exe ;Запуск антиафк
    IniWrite, 1, config.ini, vklfunk, vklfunk4
    return
}
if (ProcastMaskastatus = 1)
{
    Process, Close, maska.exe
    IniWrite, 0, config.ini, vklfunk, vklfunk4
    return
}
return
;*********************************************
;****************END SCRIPT*******************
;*********************************************