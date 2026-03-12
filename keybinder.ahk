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
SetTimer, Logbackup, 300000



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
#Include, ./general/help.ahk
#Include, ./general/join.ahk
#Include, ./general/freundesliste.ahk
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

F2::
Suspend, Permit
id := PlayerInput("ID: ")
color := GetPlayerColor(id)
AddChatMessage(Color)
Return

F3::
Suspend, Permit
ShowDialog(2, "TEST", "TEST", "OK", "LOL", 69)
Return


F11::
Suspend, Permit
if (IsDialogOpen())
{
    i := 1
  FileAppend, "`n", dialogs.txt
  FileAppend, "`n", dialogs.txt
  FileAppend, "`n", dialogs.txt
    n := GetDialogLineCount()
   AddChatMessage("{45B6FE}Info: {FFFFFF}Dialog gefunden")
   AddChatMessage(n)
     dtext := []
   Loop, %n%
   {    
    dtext.Push(GetDialogLine(i))
    inpt := dtext[i]
    FileAppend, %inpt%, dialogs.txt
    FileAppend, "`n", dialogs.txt
    i++

}
AddChatMessage("Vorgang abgeschlossen")
Return
}
Return

F12::
Suspend, Permit
AddChatMessage("{FFFFFF}Log-Level")
AddChatMessage("{B22222}FEHLER: {FFFFFF} TEST")
AddChatMessage("{FACA0F}Warnung: {FFFFFF} TEST")
AddChatMessage("{45B6FE}Info: {FFFFFF} TEST")
ShowDialog(4, "TEST", "TEST", "OK", "LOL", 69)
Return

:?:/help keybinder::
Suspend Permit 
AddChatMessage("{45B6FE}Befehle: {FFFFFF}/hwt /weste /bj /cc /fysch /tanken")
AddChatMessage("{45B6FE}Befehle: {FFFFFF}/cpu /scpu /re /nsms /ncall")
AddChatMessage("{45B6FE}Befehle: {FFFFFF}/rlg /mrlg /drlg /rllotto /kopfgeldalle")
AddChatMessage("{45B6FE}AFK-Timer: {FFFFFF}F2 --> An | F3 --> Aus")
AddChatMessage("{45B6FE}Freundesliste: {FFFFFF}/flhelp")
return



:?:/flhelp::
Suspend Permit 
Sleep 300
ShowDialog(0, "Befehle", "{00FF00}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*`n{666666}/fl{00FFFF} ={ffffff} Freundesliste anzeigen`n{666666}/fladd{00FFFF} ={ffffff} Freund hinzuf�gen`n{666666}/fldel{00FFFF} ={ffffff} Freund entfernen`n{666666}/flreset{00FFFF} ={ffffff} Freundesliste leeren`n Die Freundesliste wurde von {006600} Ryan {FFFFFF} erstellt`n und von {FFFF80} Darkari  {FFFFFF} editiert.`n{660028}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*", "Schlie�en")
return

:?:/nrhelp::
Suspend Permit
Sleep, 200
ShowDialog(0, "News Reporter Befehle","{45B6FE}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*`nWerbung `n {FFFFFF}/nrwerbung --> News Reporter Fraktionswerbung `n /servicead --> Werbund f�r Dienstleistungen der News Reporter `n {45B6FE}Gru�runde `n {FFFFFF}/gstart --> Gru�runde starten `n /gstop --> Gru�runde beenden `n {45B6FE}Buchstabensalat   `n {FFFFFF}/bststart  --> Startet das Event `n /bstnext --> Eine Runde spielen, bis die festgelgte Anzahl an Runden gepielt wurde. `n /bstedit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}Fang den Sultan   `n {FFFFFF}/fstart --> Startet das Event `n /fstop --> Beendet das Event `n /fsedit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}Finde den News Van   `n {FFFFFF}/fnvstart --> Startet das Event  `n /fnvstop --> Beendet das Event `n /fnvedit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}Pinker Roller   `n {FFFFFF}/prstart --> Startet das Event  `n /prstop --> Beendet das Event `n /predit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}Quiz   `n {FFFFFF}/qstart --> Startet das Event `n /qnext  --> Eine Runde spielen, bis die festgelgte Anzahl an Runden gepielt wurde. `n /qedit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}Tuningevent   `n {FFFFFF}/tstart --> Startet das Event `n /tstop --> Beendet das Event `n /tedit --> Event nach start bearbeiten, z.B. bei Erh�hung des Gewinns `n {45B6FE}*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*", "Schlie�en")
return

:?:/nrhilfe::
:?:/nrhelp::
Suspend Permit
Sleep, 200
ShowDialog(4,"News Reporter Befehle","{45B6FE}News`t`n{FFFFFF}/nws`tNews aus der Settings.ini austrahlen`n`t`n{45B6FE}Werbung`t`n{FFFFFF}/nrwerbung`tNews Reporter - Fraktionswerbung`n/servicead`tWerbung f�r Dienstleistungen der News Reporter`n`t`n{45B6FE}Gru�runde`t`n{FFFFFF}/gstart`tGru�runde starten`n/gstop`tGru�runde beenden`n`t`n{45B6FE}Buchstabensalat`t`n{FFFFFF}/bststart`tStartet das Event`n/bstnext`tEine Runde spielen, bis die festgelgte Anzahl an Runden gespielt wurde.`n/bstedit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns`n`t`n{45B6FE}Fang den News Sultan`t`n{FFFFFF}/fstart`tStartet das Event`n/fstop`tBeendet das Event`n/fsedit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns`n`t`n{45B6FE}Finde den News Van`t`n{FFFFFF}/fnvstart`tStartet das Event`n/fnvstop`tBeendet das Event`n/fnvedit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns`n`t`n{45B6FE}Pinker Roller`n{FFFFFF}/prstart`tStartet das Event`n/prstop`tBeendet das Event`n/predit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns`n`t`n{45B6FE}Quiz`t`n{FFFFFF}/qstart`tStartet das Event`n/qnext`tEine Runde spielen, bis die festgelgte Anzahl an Runden gespielt wurde.`n/qedit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns`n`t`n{45B6FE}Tuningevent`t`n{FFFFFF}/tstart`tStartet das Event`n/tstop`tBeendet das Event`n/tedit`tEvent nach dem Start bearbeiten, z.B. bei Erh�hung des Gewinns","Schlie�en")
return

:?:/help::
:?:/hilfe::
Suspend Permit 
SendChat("/help")
Sleep 500
AddChatMessage("{45B6FE}Info: {FFFFFF}Die Hilfe f�r den Keybinder findest du unter /help keybinder")
Return

:?:/tog::
Suspend, Permit
SendChat("/tog")
Sleep, 200
AddChatMessage("{45B6FE}Info: {FFFFFF}Togglebare Keybinder Funktionen: ")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Join] Benachrichtigungen `(Betreten/Verlassen`) de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Freunde] Benachrichtigungen der Freundesliste de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Overlay] Overlay de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[Forum] RSS-Feed (Forum) de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[AFK] AFK-Timer de/aktivieren")
AddChatMessage("{45B6FE}Info: {FFFFFF}[RSS] RSS-Feed de/aktivieren")
Return
