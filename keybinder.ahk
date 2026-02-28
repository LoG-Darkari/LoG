if not A_IsAdmin{
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}
#UseHook
#NoEnv
#SingleInstance force
#IfWinActive, GTA:SA:MP
#HotString EndChars `n

;Function Timers

;Stuff
~+T::
~t::
Label_T:
Suspend, On
Hotkey, Enter, On
Hotkey, NumPadEnter, On
Hotkey, Escape, On
Hotkey, t, Off
Hotkey, +T, Off
return


~NumpadEnter::
~Enter::
~Escape::
Label_Enter:
Suspend, Permit
Suspend, Off
Hotkey, t, On
Hotkey, +T, On
Hotkey, Enter, Off
Hotkey, NumPadEnter, Off
Hotkey, Escape, Off
return

SendMode Input
SetWorkingDir, %A_ScriptDir%
A_Data = %A_ScriptDir%\Data
IfNotExist, %A_Data%
FileCreateDir, %A_Data%

;Includes

;Update stuff
Version = 1 



;Setup GUI
IfNotExist, %A_Data%\fav.ico
{
TrayTip, LoG-Keybinder, Keybinderdateien werden heruntergeladen..., 1, 1
downloadFile("https://life-of-german.org/images/style-39/favicon-48x48.png", A_Data, fav.ico)
}

Menu, Tray, Icon, %A_Data%\fav.ico, 1
Menu, Tray, NoStandard
Menu, Tray, Add , Keybinder beenden, exi

Exi:
ExitApp