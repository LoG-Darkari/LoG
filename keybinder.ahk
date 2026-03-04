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
SetTimer, Chatlog, 300000



SendMode Input

;include api
#Include, ./API/SAMP.ahk

;include functions
#Include, ./functions/cp.ahk
#Include, ./functions/factions.ahk
#Include, ./functions/items.ahk
#Include, ./functions/playercolor.ahk
#Include, ./functions/playerinput.ahk
#Include, ./functions/scramble.ahk
#Include, ./functions/thousands_sep.ahk

;Includes general
#Include, ./general/fish.ahk
#Include, ./general/chatlog.ahk
#Include, ./general/hwt.ahk
#Include, ./general/cc.ahk
#Include, ./general/bj.ahk
#Include, ./general/cp_banking.ahk

;include events
#Include, ./general/events/bst.ahk
#Include, ./general/events/bst.ahk
#Include, ./general/events/fnv.ahk
#Include, ./general/events/grussrunde.ahk
#Include, ./general/events/news.ahk
#Include, ./general/events/nr_werbung.ahk
#Include, ./general/events/pinker_roller.ahk
#Include, ./general/events/quiz.ahk
#Include, ./general/events/servicead.ahk
#Include, ./general/events/tuning.ahk

;include factions
#Include, ./Factions/neutral/lsmd/skinchange.ahk 
;Update stuff

/*


Version = 1 

downloadFile(url, dir := ".", filename := "") 
{
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", url, true)
	whr.Send()
	whr.WaitForResponse()

	if !FileExist(dir)
		FileCreateDir, %dir%

	if filename is space
	{
		try
			RegExMatch( whr.GetResponseHeader("Content-Disposition"), "filename=""\K[^""]+", filename )
		catch
			RegExMatch( whr.Option(1), "[^/]+$", filename ) ; 1 = WinHttpRequestOption_URL
	}

	body := whr.ResponseBody
	data := NumGet(ComObjValue(body) + 8 + A_PtrSize, "UInt")
	size := body.MaxIndex() + 1
	FileOpen(dir "\" filename, "w").RawWrite(data + 0, size)
    Return
}
Return

;Setup GUI
IfNotExist, %A_Data%\fav.ico
{
TrayTip, LoG-Keybinder, Keybinderdateien werden heruntergeladen..., 1, 1
downloadFile("https://life-of-german.org/images/style-39/favicon-48x48.png", A_Data, fav.ico)
Return
}
Return

Menu, Tray, Icon, %A_Data%\fav.ico, 1
Menu, Tray, NoStandard
Menu, Tray, Add , Keybinder beenden, exi

Exi:
ExitApp
*/

F11::
Suspend, Permit
lsmd_skinchange()
Return

F12::
Suspend, Permit
AddChatMessage("{FFFFFF}Log-Level")
AddChatMessage("{B22222}FEHLER: {FFFFFF} TEST")
AddChatMessage("{FACA0F}Warnung: {FFFFFF} TEST")
AddChatMessage("{45B6FE}Info: {FFFFFF} TEST")
Return
