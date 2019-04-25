#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
a = 0
ad =
dd =
IniRead, fs, accounts.ini, firststart, isitfirststart
if (fs = 1)
{
    IniWrite, 0, accounts.ini, firststart, isitfirststart
    FileSelectFolder, WhichFolder,,0,Укажите где находится прайм
    Loop, %WhichFolder%\*.exe,,1
    {
        if (A_LoopFileName = "PWLauncher.exe")
        {
            IniWrite, %A_LoopFileDir%, accounts.ini, PrimeMainDir, dirrect
        }
    }
}
Return
F3::
IniRead, primedir1, accounts.ini, PrimeMainDir, dirrect,
Run, %primedir1%\PWLauncher.exe
ad := 0
dd := 0
loop,
{
    a := a + 1
    IniRead, name, accounts.ini, account%a%, name,
    IniRead, pass, accounts.ini, account%a%, password,
    IniRead, type, accounts.ini, account%a%, type,
    if (fraction = "ERROR")
    {
        MsgBox, 64,, %fraction% %a%
        Break
    }
    ;IniRead, PrimeDir, accounts.ini, PrimeMainDir, dirrect
    ;Run, %PrimeDir%\PWLauncher.exe
    if (type = "vk")
    {
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\login\vkb.bmp
    MouseMove, fX, fY
    Click
    Sleep, 1000
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\login\vkl.bmp
    fY := fY + 40
    MouseMove, fX, fY
    Click
    IniRead, name, accounts.ini, account%a%, name,
    SendInput, %name%
    fY := fY + 70
    MouseMove, fX, fY
    Click
    IniRead, pass, accounts.ini, account%a%, password,
    SendInput, %pass%
    SendInput, {Enter}
    Sleep, 2000
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\login\play.bmp
    MouseMove, fX, fY
    Click
    Sleep, 5000
    }

Loop,
    {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\turnon.bmp
        if ErrorLevel = 0
        {
            Break
        }
        if ErrorLevel = 1
        {
            Sleep, 50
        }
    }
Loop, 10
    {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\krest.bmp
        if ErrorLevel = 0
        {
            MouseMove, fX, fY,
            Click
            Break
            MouseMove, 100, 100
        }
        if ErrorLevel = 1
        {
            Sleep, 100
        }
    }
    Sleep, 4000
Loop, 5
    {
        SendInput, {WheelDown}
        Sleep, 200
    }
Loop,
    {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\ad.bmp
        if ErrorLevel = 0
        {
            ad := 1
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\dd.bmp
        if ErrorLevel = 0
        {
            dd := 1
        }
        Sleep, 10
    }
;111111111111111111111111
F7::
ad := 1

Loop,
    {
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\cb.bmp
    if ErrorLevel = 0
    {
        fX := fX + 2
        fY := fY + 17
        MouseMove, fX, fY,
        ;abc123
        Sleep, 500
        MouseMove, 40, 40
        Break
    }
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\cr.bmp
    if ErrorLevel = 0
    {
        fX := fX + 2
        fY := fY + 17
        MouseMove, fX, fY,
        ;abc123
        Sleep, 500
        MouseMove, 40, 40
        Break
    }
    Sleep, 10
    }
Loop, 100
    {
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\gold.bmp
    if ErrorLevel = 0
    {
        fX := fX + 2
        fY := fY + 17
        MouseMove, fX, fY,
        ;abc123
        Sleep, 500
        MouseMove, 40, 40
        Break
    }
    Sleep, 10
    }
Loop,
    {
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\sb.bmp
    if ErrorLevel = 0
    {
        fX := fX + 2
        fY := fY + 17
        MouseMove, fX, fY,
        ;abc123
        Sleep, 500
        MouseMove, 40, 40
        Break
    }
    ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\sr.bmp
    if ErrorLevel = 0
    {
        fX := fX + 2
        fY := fY + 17
        MouseMove, fX, fY,
        ;abc123
        Sleep, 500
        MouseMove, 40, 40
        Break
    }
    Sleep, 10
    }
if (ad = 1)
    {
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\akb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\akr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\amb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\amr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\asb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\asr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    }
if (dd = 1)
    {
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\akb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\akr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\amb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\amr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    Loop,
        {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\asb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\asr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
            Break
        }
        Sleep, 10
        }
    }
Loop, 50
    {
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\akb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\akr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\amb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\amr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\asb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\adornia\asr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\cb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\cr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\sb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\common\sr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\dfb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\dfr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\drb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\drr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\dwb.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        ImageSearch, fX, fY, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\images\docts\dwr.bmp
        if ErrorLevel = 0
        {
            fX := fX + 2
            fY := fY + 17
            MouseMove, fX, fY,
            ;abc123
            Sleep, 500
            MouseMove, 40, 40
        }
        Sleep, 10
    }
Return

}
Return